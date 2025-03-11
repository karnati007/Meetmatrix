// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future newCustomAction(BuildContext context) async {
  // after the timer sets to 00:00 the card should turn back to frontside

  // Wait for the timer to reach 00:00
  await Future.delayed(Duration(minutes: 1));

  // Set the card to frontside
  // setState(() {
  //   isCardFlipped = false;
  // });
}
