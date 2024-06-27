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
              String individualEthnicity = '';
              String relationHhHead = '';
              String individualLanguage = '';
              String maritalStatus = '';
              String educationStatus = '';
              String anySpecialist = '';
              String occupation = '';
              String livingStatus = '';
              String disability = '';
              String healthCondition = '';
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
              switch (widget.familyModel.individualData[index].ethnicity) {
                case 'hilljanajati':
                  individualEthnicity = 'पहाडी आदिवासी जनजाति';
                  break;
                case 'hill_bramin':
                  individualEthnicity =
                      'पहाडी ब्राम्हण्, क्षेत्री, ठकुरी, सन्यासी';
                  break;
                case 'tarai_bramin':
                  individualEthnicity = 'तराई ब्राम्हण्, क्षेत्री, राजपुत';
                  break;
                case 'otarai':
                  individualEthnicity = 'तराई अन्य';
                  break;
                case 'pahadi':
                  individualEthnicity = 'पहाडी अन्य';
                  break;
                case 'muslim':
                  individualEthnicity = 'मुस्लिम';
                  break;
                case 'tariai_dalit':
                  individualEthnicity = 'तराई दलित';
                  break;
                case 'hilldalit':
                  individualEthnicity = 'पहाडी दलित';
                  break;
                case 'tarijanajati':
                  individualEthnicity = 'तराई आदिवासी जनजाति';
                  break;
              }
              switch (widget.familyModel.individualData[index].relationHhHead) {
                case 'self':
                  relationHhHead = 'घरमुली आफै';
                  break;
                case 'husband_wife':
                  relationHhHead = 'श्रीमान/श्रीमती';
                  break;
                case 'parent':
                  relationHhHead = 'आमा/ बुवा';
                  break;
                case 'son_dil':
                  relationHhHead = 'छोरा वा बुहारी';
                  break;
                case 'dau_sil':
                  relationHhHead = 'छोरी वा ज्वाई';
                  break;
                case 'fil_mil':
                  relationHhHead = 'ससुरा वा सासु';
                  break;
                case 'uncle_aunt':
                  relationHhHead = 'काका वा काकी';
                  break;
                case 'fupu':
                  relationHhHead = 'फुफु, फुफाजु,';
                  break;
                case 'mama':
                  relationHhHead = 'मामा, माइजु';
                  break;
                case 'nati':
                  relationHhHead = 'नाति, नातिनी';
                  break;
                case 'brother':
                  relationHhHead = 'दाजु, भाउजू';
                  break;
                case 'bhauju_buhari':
                  relationHhHead = 'भाइ, भाइबुहारी';
                  break;
                case 'sister':
                  relationHhHead = 'दीदि, भेना';
                  break;
                case 'jwai_jethan':
                  relationHhHead = 'ज्वाई, जेठान';
                  break;
                case 'thulo_buwa_aama':
                  relationHhHead = 'ठूलाे बुवा, ठूलाे आमा';
                  break;
              }
              switch (widget.familyModel.individualData[index].language) {
                case 'nepali':
                  individualLanguage = 'नेपाली';
                  break;
                case 'tamang':
                  individualLanguage = 'तामाङ';
                  break;
                case 'ghale':
                  individualLanguage = 'घले';
                  break;
                case 'yemphu':
                  individualLanguage = 'राई';
                  break;
                case 'limbu':
                  individualLanguage = 'लिम्बु';
                  break;
                case 'others':
                  individualLanguage = 'अन्य';
                  break;
                case 'guung':
                  individualLanguage = 'गुरुङ';
                  break;
                case 'sherpa':
                  individualLanguage = 'शेर्पा';
                  break;
              }
              switch (widget.familyModel.individualData[index].maritalStatus) {
                case 'underage':
                  maritalStatus = 'उमेर कम बिबाहित';
                  break;
                case 'seperated':
                  maritalStatus = 'बिबाहित तर अलग बसेको';
                  break;
                case 'divorce':
                  maritalStatus = 'सम्बन्ध बिच्छेद';
                  break;
                case 'single_women':
                  maritalStatus = 'एकल पुरूष, एकल महिला';
                  break;
                case 'remarried':
                  maritalStatus = 'पुनः बिवाह';
                  break;
                case 'polygami':
                  maritalStatus = 'बहु बिवाह';
                  break;
                case 'married':
                  maritalStatus = 'बिबाहित';
                  break;
                case 'not_married':
                  maritalStatus = 'अबिबाहित';
                  break;
              }
              switch (widget.familyModel.individualData[index].education) {
                case 'preprimary':
                  educationStatus = 'पूर्व प्रथमिक';
                  break;
                case 'underage':
                  educationStatus = 'उमेर कम';
                  break;
                case 'illtrate':
                  educationStatus = 'निरक्षर';
                  break;
                case 'litrate':
                  educationStatus = 'साधारण लेखपढ';
                  break;
                case 'techsse':
                  educationStatus = 'प्राविधिक एसलसि';
                  break;
                case 'mphil':
                  educationStatus = 'एमफिल वा सो भन्दा माथि';
                  break;
                case 'masters':
                  educationStatus = 'स्नातकोत्तर तह';
                  break;
                case 'batchlor':
                  educationStatus = 'स्नातक तह';
                  break;
                case 'secondary':
                  educationStatus = 'माध्यिमक तह';
                  break;
                case 'primary':
                  educationStatus = 'आधारभूत तह';
                  break;
              }
              switch (widget.familyModel.individualData[index].specialist) {
                case 'other_prof':
                  anySpecialist = 'अन्य';
                  break;
                case 'hotelmanager':
                  anySpecialist = 'होटेल मनेजर';
                  break;
                case 'teacher':
                  anySpecialist = 'शिक्षक/ शिक्षिका';
                  break;
                case 'computerist':
                  anySpecialist = 'कम्पुटर बिज्ञ';
                  break;
                case 'account':
                  anySpecialist = 'चार्टर्ड एकाउन्टेन्ट (CA)';
                  break;
                case 'vetnery_1':
                  anySpecialist = 'भेटनरी डाक्टर';
                  break;
                case 'agriculturist':
                  anySpecialist = 'कृषिबिज्ञ';
                  break;
                case 'pilot':
                  anySpecialist = 'पाइलट';
                  break;
                case 'forester':
                  anySpecialist = 'वनबिज्ञ';
                  break;
                case 'lawyer':
                  anySpecialist = 'वकिल';
                  break;
                case 'jornalist':
                  anySpecialist = 'पत्रकार';
                  break;
                case 'engineer':
                  anySpecialist = 'इन्जिनियर';
                  break;
                case 'vetnery':
                  anySpecialist = 'पशुचिकित्सक';
                  break;
                case 'doctor':
                  anySpecialist = 'डाक्टर';
                  break;
                case 'no':
                  anySpecialist = 'हाेइन';
                  break;
              }
              switch (widget.familyModel.individualData[index].occupation) {
                case 'Other':
                  occupation = 'अन्य';
                  break;
                case 'senior_citizen':
                  occupation = 'ज्येष्ठ नागरिक';
                  break;
                case 'underage':
                  occupation = 'कम उमेर';
                  break;
                case 'fore_remit':
                  occupation = 'बैदेशिक';
                  break;
                case 'unemploy':
                  occupation = 'बेरोजगार';
                  break;
                case 'Pensioneer':
                  occupation = 'Pensioneer';
                  break;
                case 'houswife':
                  occupation = 'गृहिणी';
                  break;
                case 'stud':
                  occupation = 'विद्यार्थी (अध्ययनरत)';
                  break;
                case 'enterpanur':
                  occupation =
                      'व्यवसायिक कार्य (पत्रकार, वकिल, परामर्श, ठेक्का, पुजारी)';
                  break;
                case 'worker':
                  occupation = 'ज्याला मजदुरी';
                  break;
                case 'busin':
                  occupation = 'उद्योग व्यापार';
                  break;
                case 'service':
                  occupation = 'नोकरी जागिर';
                  break;
                case 'agri':
                  occupation = 'कृषि तथा पशुपालन';
                  break;
              }
              switch (widget.familyModel.individualData[index].livingStatus) {
                case 'default':
                  livingStatus = 'गणना गरेकै ठाउँमा बसेको';
                  break;
                case 'countryside':
                  livingStatus = 'स्वदेशमा अन्यत्र बसेको';
                  break;
                case 'expatriate':
                  livingStatus = 'बिदेशमा बसेको';
                  break;
              }
              switch (widget.familyModel.individualData[index].disability) {
                case 'multi_disable':
                  disability = 'बहु अपाँगता';
                  break;
                case 'celeberal':
                  disability = 'सुस्त मनस्थिती';
                  break;
                case 'redarded':
                  disability = 'मनोसामाजिक अपाङगता भएको';
                  break;
                case 'hearingloss':
                  disability = 'सुस्त श्रवण भएकाे';
                  break;
                case 'slammer':
                  disability = 'स्वर बोलाई सम्बन्धी अपाङगता (भकभके)';
                  break;
                case 'deft':
                  disability = 'बहिरा (सुन्न र बोल्न नसक्ने)';
                  break;
                case 'blind':
                  disability = 'दृश्टिबिहिन (आखा नदेख्ने)';
                  break;
                case 'mental':
                  disability = 'बैाद्विक अपाङगता भएको';
                  break;
                case 'disable':
                  disability = 'शारिरीक अपाङगता भएको';
                  break;
                case 'able':
                  disability = 'सपांग';
                  break;
              }
              switch (
                  widget.familyModel.individualData[index].healthCondition) {
                case 'healthy':
                  healthCondition = 'स्वस्थ';
                  break;
                case 'ord_ill':
                  healthCondition = 'सामान्य राेग लागेकाे';
                  break;
                case 'cronic':
                  healthCondition = 'दीर्घ राेग लागेकाे';
                  break;
                case 'Covid':
                  healthCondition = 'काेभिड - १९ (काेराेनाबाट संक्रमित)';
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
                      Text('${l10n.ethnicity} : $individualEthnicity'),
                      Text('${l10n.relatioWithHh} : $relationHhHead'),
                      Text('${l10n.language} : $individualLanguage'),
                      Text('${l10n.maritalStatus} : $maritalStatus'),
                      Text('${l10n.educationLevel} : $educationStatus'),
                      Text('${l10n.anySpecialist} : $anySpecialist'),
                      Text('${l10n.occupation} : $occupation'),
                      Text('${l10n.livingStatus} : $livingStatus'),
                      Text('${l10n.disability} : $disability'),
                      Text(
                          '${l10n.healthCondition} : $healthCondition'),
                    ],
                  ),
                ),
              );
            }));
  }
}
