import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/language_bloc.dart';

class LanguageDetails extends StatefulWidget {
  const LanguageDetails({super.key});

  @override
  State<LanguageDetails> createState() => _LanguageDetailsState();
}

class _LanguageDetailsState extends State<LanguageDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if(state is LanguageLoadedState){
         return Text("Data fetched");
        }
        return Scaffold(
          body: Row(),
        );
      },
    );
  }
}
