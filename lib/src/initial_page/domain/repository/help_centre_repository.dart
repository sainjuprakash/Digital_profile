import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

Future<void> send() async {
  //List<String> attachments = [];
  final _recipientController = TextEditingController(
    text: '	info@csds.com.np',
  );

  final _subjectController = TextEditingController(text: '');

  final _bodyController = TextEditingController(
    text: '',
  );
  final Email email = Email(
    body: _bodyController.text,
    subject: _subjectController.text,
    recipients: [_recipientController.text],
   // attachmentPaths: attachments,
    isHTML: false,
  );

  String platformResponse;

  try {
    await FlutterEmailSender.send(email);
    platformResponse = 'success';
  } catch (error) {
    print(error);
    platformResponse = error.toString();
  }
}
