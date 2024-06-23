import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/src/features/household/data/model/family_details_model.dart';
import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  FamilyDetailsModel familyModel;
  String householdUrl;

  IndividualPage(this.familyModel, this.householdUrl, {super.key});

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
        body: ListView.builder(
            itemCount: widget.familyModel.individualData.length,
            itemBuilder: (context, index) {
              String sexText = '';
              switch (widget.familyModel.individualData[index].sex) {
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
                          '${l10n.nameAndSurname} : ${widget.familyModel.individualData[index].individualName} ${widget.familyModel.individualData[index].lastName}'),
                      Text('${l10n.sex} : $sexText'),
                      Text(
                          '${l10n.age} : ${widget.familyModel.individualData[index].age}'),
                      Text(
                          '${l10n.ethnicity} : ${widget.familyModel.individualData[index].ethnicity}'),
                      Text(
                          '${l10n.relatioWithHh} : ${widget.familyModel.individualData[index].relationHhHead}'),
                      Text(
                          '${l10n.language} : ${widget.familyModel.individualData[index].language}'),
                      Text(
                          '${l10n.maritalStatus} : ${widget.familyModel.individualData[index].maritalStatus}'),
                      Text(
                          '${l10n.educationLevel} : ${widget.familyModel.individualData[index].education}'),
                      Text(
                          '${l10n.anySpecialist} : ${widget.familyModel.individualData[index].specialist}'),
                      Text(
                          '${l10n.occupation} : ${widget.familyModel.individualData[index].occupation}'),
                      Text(
                          '${l10n.livingStatus} : ${widget.familyModel.individualData[index].livingStatus}'),
                      Text(
                          '${l10n.disability} : ${widget.familyModel.individualData[index].disability}'),
                      Text(
                          '${l10n.healthCondition} : ${widget.familyModel.individualData[index].healthCondition}'),
                    ],
                  ),
                ),
              );
            }));
  }
}
