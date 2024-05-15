import 'package:digital_profile/src/features/literacy_status/data/repository/literacy_repository_impl.dart';
import 'package:digital_profile/src/features/literacy_status/presentation/widgets/literacy_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/literacy_model.dart';
import '../bloc/literacy_bloc.dart';

class LiteracyPage extends StatefulWidget {
  const LiteracyPage({super.key});

  @override
  State<LiteracyPage> createState() => _LiteracyPageState();
}

class _LiteracyPageState extends State<LiteracyPage> {
  int totalMaleLiterate = 0;
  int totalMalePrePrimary = 0;
  int totalMalePrimary = 0;
  int totalMaleSecondary = 0;
  int totalMaleTechnical = 0;
  int totalMaleBachelor = 0;
  int totalMaleMaster = 0;
  int totalMaleMphil = 0;
  int totalMaleUnderAge = 0;
  int totalMaleIlliterate = 0;
  int totalMaleNotAvailable = 0;
  int totalFemaleLiterate = 0;
  int totalFemalePrePrimary = 0;
  int totalFemalePrimary = 0;
  int totalFemaleSecondary = 0;
  int totalFemaleTechnical = 0;
  int totalFemaleBachelor = 0;
  int totalFemaleMaster = 0;
  int totalFemaleMphil = 0;
  int totalFemaleUnderAge = 0;
  int totalFemaleIlliterate = 0;
  int totalFemaleNotAvailable = 0;
  int totalOthersLiterate = 0;
  int totalOthersPrePrimary = 0;
  int totalOthersPrimary = 0;
  int totalOthersSecondary = 0;
  int totalOthersTechnical = 0;
  int totalOthersBachelor = 0;
  int totalOthersMaster = 0;
  int totalOthersMphil = 0;
  int totalOthersUnderAge = 0;
  int totalOthersIlliterate = 0;
  int totalOthersNotAvailable = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LiteracyBloc(RepositoryProvider.of<ImplLiteracyRepository>(context))
            ..add(GetLiteracyEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body:
            BlocBuilder<LiteracyBloc, LiteracyState>(builder: (context, state) {
          if (state is LiteracySuccessState) {
            List<LiteracyModel> fetchedLiteracyModel = state.literacyModel;
            fetchedLiteracyModel.asMap().forEach((key, value) {
              totalMaleLiterate += fetchedLiteracyModel[key].maleLiterate ?? 0;
              totalMalePrePrimary +=
                  fetchedLiteracyModel[key].malePrePrimary ?? 0;
              totalMalePrimary += fetchedLiteracyModel[key].malePrimary ?? 0;
              totalMaleSecondary +=
                  fetchedLiteracyModel[key].maleSecondary ?? 0;
              totalMaleTechnical +=
                  fetchedLiteracyModel[key].maleTechnical ?? 0;
              totalMaleBachelor += fetchedLiteracyModel[key].maleBachelor ?? 0;
              totalMaleMaster += fetchedLiteracyModel[key].maleMasters ?? 0;
              totalMaleMphil += fetchedLiteracyModel[key].maleMphil ?? 0;
              totalMaleUnderAge += fetchedLiteracyModel[key].maleUnderAge ?? 0;
              totalMaleIlliterate +=
                  fetchedLiteracyModel[key].maleIlitrate ?? 0;
              totalMaleNotAvailable +=
                  fetchedLiteracyModel[key].maleNotAvailable ?? 0;

              totalFemaleLiterate +=
                  fetchedLiteracyModel[key].femaleLiterate ?? 0;
              totalFemalePrePrimary +=
                  fetchedLiteracyModel[key].femalePrePrimary ?? 0;
              totalFemalePrimary +=
                  fetchedLiteracyModel[key].femalePrimary ?? 0;
              totalFemaleSecondary +=
                  fetchedLiteracyModel[key].femaleSecondary ?? 0;
              totalFemaleTechnical +=
                  fetchedLiteracyModel[key].femaleTechincal ?? 0;
              totalFemaleBachelor +=
                  fetchedLiteracyModel[key].femaleBachelor ?? 0;
              totalFemaleMaster += fetchedLiteracyModel[key].femaleMasters ?? 0;
              totalFemaleMphil += fetchedLiteracyModel[key].femaleMphil ?? 0;
              totalFemaleUnderAge +=
                  fetchedLiteracyModel[key].femaleUnderAge ?? 0;
              totalFemaleIlliterate +=
                  fetchedLiteracyModel[key].femaleIliterate ?? 0;
              totalFemaleNotAvailable +=
                  fetchedLiteracyModel[key].femaleNotAvailable ?? 0;

              totalOthersLiterate +=
                  fetchedLiteracyModel[key].othersLiterate ?? 0;
              totalOthersPrePrimary +=
                  fetchedLiteracyModel[key].othersPrePrimary ?? 0;
              totalOthersPrimary +=
                  fetchedLiteracyModel[key].othersPrimary ?? 0;
              totalOthersSecondary +=
                  fetchedLiteracyModel[key].othersSecondary ?? 0;
              totalOthersTechnical +=
                  fetchedLiteracyModel[key].othersTechnical ?? 0;
              totalOthersBachelor +=
                  fetchedLiteracyModel[key].othersBachelor ?? 0;
              totalOthersMaster += fetchedLiteracyModel[key].othersMasters ?? 0;
              totalOthersMphil += fetchedLiteracyModel[key].othersMphil ?? 0;
              totalOthersUnderAge +=
                  fetchedLiteracyModel[key].othersUnderAge ?? 0;
              totalOthersIlliterate +=
                  fetchedLiteracyModel[key].othersIliterate ?? 0;
              totalOthersNotAvailable +=
                  fetchedLiteracyModel[key].othersNotAvailable ?? 0;
            });
          }
          return Column(
            children: [
              LiteracyDataTable()
            ],
          );
        }),
      ),
    );
  }
}