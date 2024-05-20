import 'package:flutter/cupertino.dart';

class AppTitleText extends StatelessWidget {
  String text;
  AppTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
