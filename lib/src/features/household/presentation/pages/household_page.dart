import 'dart:async';

import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/custom_text_from_field.dart';
import 'package:digital_profile/src/features/household/data/model/family_details_model.dart';
import 'package:digital_profile/src/features/household/data/repository/household_repository_impl.dart';
import 'package:digital_profile/src/features/maps/presentation/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/household_bloc.dart';
import 'individual_page.dart';

class HouseholdPage extends StatefulWidget {
  final String houseHoldUrl;
  const HouseholdPage(this.houseHoldUrl, {super.key});

  @override
  State<HouseholdPage> createState() => _HouseholdPageState();
}

class _HouseholdPageState extends State<HouseholdPage> {
  List<FamilyDetailsModel> allData = [];
  List<FamilyDetailsModel> foundUser = [];
  final ScrollController _scrollController = ScrollController();
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  _runFilter(String enteredKeyword) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      List<FamilyDetailsModel> results = [];
      if (enteredKeyword.isEmpty) {
        results = allData;
      } else {
        results = allData
            .where((element) => element.wardNo!.contains(enteredKeyword))
            .toList();
      }
      setState(() {
        foundUser = results;
      });
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
              allData = fetchedData;
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
                                      Center(
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => MapsPage(
                                                          double.tryParse(
                                                                  familyDetails
                                                                      .latitude!) ??
                                                              0,
                                                          double.tryParse(
                                                                  familyDetails
                                                                      .longitude!) ??
                                                              0)));
                                            },
                                            child: const Text('view on map')),
                                      )
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
