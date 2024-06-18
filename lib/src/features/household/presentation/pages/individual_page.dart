import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/household/data/model/family_details_model.dart';
import 'package:digital_profile/src/features/household/data/repository/household_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/household_bloc.dart';

class IndividualPage extends StatefulWidget {
  int indexOfCard;
  String householdUrl;

  IndividualPage(this.indexOfCard,this.householdUrl, {super.key});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(l10n.individualData),
      ),
      body: BlocProvider(
  create: (context) => HouseholdBloc(RepositoryProvider.of<ImplHouseholdRepository>(context),widget.householdUrl)..add(GetHouseholdEvent()),
  child: BlocBuilder<HouseholdBloc, HouseholdState>(
        builder: (context, state) {
          if (state is HouseholdLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HouseholdFailureState) {
            return const Center(child: Text('Unable to load data'));
          }
          if (state is HouseholdSuccessState) {
            List<FamilyDetailsModel> fetchedData = state.fetchedModel;
            return ListView.builder(
                itemCount:
                    fetchedData[widget.indexOfCard].individualData.length,
                itemBuilder: (context, index) {
                  String sexText = '';
                          switch (fetchedData[widget.indexOfCard]
                              .individualData[index]
                              .sex) {
                            case '1':
                              sexText = 'पुरुष';
                              break;
                            case '2':
                              sexText = 'महिला';
                              break;
                            case '3':
                              sexText = 'अन्य';
                              break;
                          }
                  return Card(
                    color: Colors.blueAccent.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${l10n.nameAndSurname} : ${fetchedData[widget.indexOfCard].individualData[index].individualName} ${fetchedData[widget.indexOfCard].individualData[index].lastName}'),
                          Text(
                              '${l10n.sex} : $sexText'),
                          Text(
                              '${l10n.age} : ${fetchedData[widget.indexOfCard].individualData[index].age}'),
                          Text(
                              '${l10n.ethnicity} : ${fetchedData[widget.indexOfCard].individualData[index].ethnicity}'),
                          Text(
                              '${l10n.relatioWithHh} : ${fetchedData[widget.indexOfCard].individualData[index].relationHhHead}'),
                          Text(
                              '${l10n.language} : ${fetchedData[widget.indexOfCard].individualData[index].language}'),
                          Text(
                              '${l10n.maritalStatus} : ${fetchedData[widget.indexOfCard].individualData[index].maritalStatus}'),
                          Text(
                              '${l10n.educationLevel} : ${fetchedData[widget.indexOfCard].individualData[index].education}'),
                          Text(
                              '${l10n.anySpecialist} : ${fetchedData[widget.indexOfCard].individualData[index].specialist}'),
                          Text(
                              '${l10n.occupation} : ${fetchedData[widget.indexOfCard].individualData[index].occupation}'),
                          Text(
                              '${l10n.livingStatus} : ${fetchedData[widget.indexOfCard].individualData[index].livingStatus}'),
                          Text(
                              '${l10n.disability} : ${fetchedData[widget.indexOfCard].individualData[index].disability}'),
                          Text(
                              '${l10n.healthCondition} : ${fetchedData[widget.indexOfCard].individualData[index].healthCondition}'),
                        ],
                      ),
                    ),
                  );
                });
          }
          return const Center(child: Text('Something went wrong'));
        },
      ),
),
    );
  }
}
