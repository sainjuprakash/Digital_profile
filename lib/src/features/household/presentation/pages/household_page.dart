import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/custom_text_from_field.dart';
import 'package:digital_profile/src/features/household/data/model/family_details_model.dart';
import 'package:digital_profile/src/features/household/data/repository/household_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/household_bloc.dart';
import 'individual_page.dart';

class HouseholdPage extends StatefulWidget {
  String houseHoldUrl;
  HouseholdPage(this.houseHoldUrl, {super.key});

  @override
  State<HouseholdPage> createState() => _HouseholdPageState();
}

class _HouseholdPageState extends State<HouseholdPage> {
  List<FamilyDetailsModel> foundUser = [];
  final ScrollController _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _runFilter(String enteredKeyword) {
    List<FamilyDetailsModel>? results = [];
    if (enteredKeyword.isEmpty) {
      results = foundUser;
    } else {
      results = foundUser
          .where(
              (element) => element.wardNo!.contains(enteredKeyword.toString()))
          .toList();
    }
    setState(() {
      foundUser = results!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HouseholdBloc(
          RepositoryProvider.of<ImplHouseholdRepository>(context),
          widget.houseHoldUrl)
        ..add(GetHouseholdEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(l10n.householdData),
        ),
        body: BlocBuilder<HouseholdBloc, HouseholdState>(
          builder: (context, state) {
            if (state is HouseholdLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HouseholdSuccessState) {
              List<FamilyDetailsModel> fetchedData = state.fetchedModel;
              foundUser = fetchedData;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      onChanged: (value) => _runFilter(value!),
                      hintText: 'search ward number',
                      obsecureText: false,
                      keyboardType: TextInputType.text,
                      controller: _searchController,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: foundUser.length,
                        itemBuilder: (context, index) {
                          FamilyDetailsModel familyDetails = foundUser[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IndividualPage(
                                          index, widget.houseHoldUrl)));
                            },
                            child: Card(
                              color: Colors.blueAccent.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('ID : ${familyDetails.id}'),
                                      Text(
                                          '${l10n.wardnumber} : ${familyDetails.wardNo}'),
                                      Text(
                                          '${l10n.respondentName} : ${familyDetails.respondent}'),
                                      Text(
                                          '${l10n.respondentNumber} : ${familyDetails.phoneNumber}'),
                                      Text(
                                          '${l10n.settName} : ${familyDetails.setName}'),
                                      Text(
                                          '${l10n.road} : ${familyDetails.road}'),
                                      Text(
                                          '${l10n.roadToHouse} : ${familyDetails.roadToHouse}'),
                                      Text(
                                          '${l10n.relationHh} : ${familyDetails.relationHh}'),
                                      Text(
                                          '${l10n.migrationType} : ${familyDetails.migrationType}'),
                                      Text(
                                          '${l10n.familyNumber} : ${familyDetails.familyCount}'),
                                      Text(
                                          '${l10n.isDeathMember} : ${familyDetails.isDeath}'),
                                      Text(
                                          '${l10n.deathQty} : ${familyDetails.deathQty}'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
