import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/initial_page/domain/repository/help_centre_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCentrePage extends StatefulWidget {
  const HelpCentrePage({super.key});

  @override
  State<HelpCentrePage> createState() => _HelpCentrePageState();
}

class _HelpCentrePageState extends State<HelpCentrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitleText(text: "Help Centre"),
                  verticalspace(height: 20),
                  const Text(
                    "We're here to help! If you have any questions, encounter any issues, or have feedback to improve our app, please don't hesitate to reach out. Your feedback is invaluable in helping us create a better experience for all users.",
                    textAlign: TextAlign.start,
                  ),
                  const Divider(
                    height: 50,
                    color: Colors.black,
                  ),
                  AppTitleText(text: "How to Get in Touch"),
                  verticalspace(height: 20),
                  const Text(
                    '1. Email Us:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text(
                    "Simply click the button below, and you'll be directed to your email app. Please include as much detail as possible about your inquiry or issue so we can assist you effectively.",
                    textAlign: TextAlign.start,
                  ),
                  verticalspace(),
                  const Text(
                    '2. Quick Tips:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text(
                      "Before reaching out, you might find an answer in our FAQs section or in the app’s user guide. We recommend checking these resources first."),
                  const Divider(
                    height: 50,
                    color: Colors.black,
                  ),
                  const Text(
                    'Contact Developer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      send();
                    },
                    child: const Text(
                      'Send mail',
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
