import 'dart:async';

import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/custom_text_from_field.dart';
import 'package:digital_profile/src/features/household/data/model/family_details_model.dart';
import 'package:digital_profile/src/features/household/data/repository/household_repository_impl.dart';
import 'package:digital_profile/src/features/maps/presentation/pages/map_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final _wardController = TextEditingController();
  final _familyNumberController = TextEditingController();
  final _contactController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _nameController = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _wardController.dispose();
    _familyNumberController.dispose();
    _contactController.dispose();
    _houseNumberController.dispose();
    _nameController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  _runFilter() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      List<FamilyDetailsModel> results = allData;

      if (_wardController.text.isNotEmpty) {
        results = results
            .where((element) =>
                element.wardNo != null &&
                element.wardNo!.contains(_wardController.text))
            .toList();
      }
      if (_houseNumberController.text.isNotEmpty) {
        results = results
            .where((element) =>
                element.houseNumber != null &&
                element.houseNumber!.toString() == _houseNumberController.text)
            .toList();
      }

      if (_familyNumberController.text.isNotEmpty) {
        results = results
            .where((element) =>
                element.familyCount != null &&
                element.familyCount!.toString() == _familyNumberController.text)
            .toList();
      }

      if (_contactController.text.isNotEmpty) {
        results = results
            .where((element) =>
                element.phoneNumber != null &&
                element.phoneNumber!.contains(_contactController.text))
            .toList();
      }
      if (_nameController.text.isNotEmpty) {
        results = results
            .where((element) =>
                element.respondent.contains(_nameController.text.toString()))
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

              // Initial display without filters
              if (_wardController.text.isEmpty &&
                  _familyNumberController.text.isEmpty &&
                  _contactController.text.isEmpty &&
                  _houseNumberController.text.isEmpty &&
                  _nameController.text.isEmpty) {
                foundUser = fetchedData;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(
                            onChanged: (value) => _runFilter(),
                            hintText: l10n.wardnumber,
                            obsecureText: false,
                            keyboardType: TextInputType.text,
                            controller: _wardController,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(
                            onChanged: (value) => _runFilter(),
                            hintText: l10n.houseNumber,
                            obsecureText: false,
                            keyboardType: TextInputType.text,
                            controller: _houseNumberController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(
                            onChanged: (value) => _runFilter(),
                            hintText: l10n.familyNumber,
                            obsecureText: false,
                            keyboardType: TextInputType.text,
                            controller: _familyNumberController,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(
                            onChanged: (value) => _runFilter(),
                            hintText: l10n.contact,
                            obsecureText: false,
                            keyboardType: TextInputType.text,
                            controller: _contactController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      onChanged: (value) => _runFilter(),
                      hintText: l10n.nameAndSurname,
                      obsecureText: false,
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '${l10n.total} : ${foundUser.length}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: foundUser.length,
                        itemBuilder: (context, index) {
                          FamilyDetailsModel familyDetails = foundUser[index];
                          String roadToHouse = '';
                          String isHouseHead = '';
                          String residenceType = '';
                          String isDead = '';
                          switch (familyDetails.roadToHouse) {
                            case 'goreto':
                              roadToHouse = 'गोरेटो बाटो';
                              break;
                            case 'garvel':
                              roadToHouse = 'ग्राभेल बाटो';
                              break;
                            case 'ghreto':
                              roadToHouse = 'घोडेटो';
                              break;
                            case 'motorable':
                              roadToHouse = 'मोटरबाटो';
                              break;
                            case 'noway':
                              roadToHouse = 'बाटो नभएको';
                              break;
                          }
                          switch (familyDetails.relationHh) {
                            case 'yes':
                              isHouseHead = 'हाे';
                              break;
                            case 'no':
                              isHouseHead = 'होईन';
                              break;
                          }
                          switch (familyDetails.migrationType) {
                            case 'perma':
                              residenceType = 'स्थायी';
                              break;
                            case 'tempory':
                              residenceType = 'अस्थायी';
                              break;
                            case 'gypsy':
                              residenceType = 'स्थायी (सुकुम्वासी)';
                              break;
                          }
                          switch (familyDetails.isDeath) {
                            case 'yes':
                              isDead = 'छ';
                              break;
                            case 'no':
                              isDead = 'छैन';
                              break;
                          }
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IndividualPage(
                                          foundUser[index],
                                          widget.houseHoldUrl)));
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
                                      Text(
                                          '${l10n.wardnumber} : ${familyDetails.wardNo}'),
                                      Text(
                                          '${l10n.houseNumber} : ${familyDetails.houseNumber}'),
                                      Text(
                                          '${l10n.respondentName} : ${familyDetails.respondent}'),
                                      Text(
                                          '${l10n.respondentNumber} : ${familyDetails.phoneNumber}'),
                                      Text(
                                          '${l10n.settName} : ${familyDetails.setName}'),
                                      Text(
                                          '${l10n.road} : ${familyDetails.road}'),
                                      Text(
                                          '${l10n.roadToHouse} : $roadToHouse'),
                                      Text('${l10n.relationHh} : $isHouseHead'),
                                      Text(
                                          '${l10n.migrationType} : $residenceType'),
                                      Text(
                                          '${l10n.familyNumber} : ${familyDetails.familyCount}'),
                                      Text('${l10n.isDeathMember} : $isDead'),
                                      Text(
                                          '${l10n.deathQty} : ${familyDetails.deathQty ?? 0}'),
                                      Center(
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MapsPage(
                                                            double.tryParse(
                                                                    familyDetails
                                                                        .latitude!) ??
                                                                0,
                                                            double.tryParse(
                                                                    familyDetails
                                                                        .longitude!) ??
                                                                0,
                                                            zoom: 18,
                                                          )));
                                            },
                                            child: const Text('View on map')),
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
