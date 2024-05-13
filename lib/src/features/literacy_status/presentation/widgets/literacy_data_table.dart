import 'package:digital_profile/app_localization/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/literacy_model.dart';
import '../bloc/literacy_bloc.dart';

class LiteracyDataTable extends StatelessWidget {
  const LiteracyDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<LiteracyBloc, LiteracyState>(
            builder: (context, state) {
              if (state is LiteracySuccessState) {
                List<LiteracyModel> fetchedLiteracyModel = state.literacyModel;
              }
              return CircularProgressIndicator();
            },
          )),
    );
  }
}
