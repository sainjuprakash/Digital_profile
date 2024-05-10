import 'package:digital_profile/src/features/religion/data/repository/religion_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/religion_bloc.dart';

class ReligionPage extends StatefulWidget {
  const ReligionPage({super.key});

  @override
  State<ReligionPage> createState() => _ReligionPageState();
}

class _ReligionPageState extends State<ReligionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReligionBloc(RepositoryProvider.of<ImplReligionRepository>(context))
            ..add(GetReligionEvent()),
      child: Scaffold(
        body: BlocBuilder(builder: (context, state) {
          if(state is ReligionSuccessState){
            return Text('data');
          }
          return Column();
        }),
      ),
    );
  }
}
