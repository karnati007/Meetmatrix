import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

EventCategory? convertToEventCategory(String category) {
  EventCategory result = EventCategory.Design;
  switch (category) {
    case "Music":
      result = EventCategory.Music;
      break;
    case "Sports":
      result = EventCategory.Sports;
      break;
    case "Design":
      result = EventCategory.Design;
      break;
    case "Arts":
      result = EventCategory.Arts;
      break;
    case "Social":
      result = EventCategory.Social;
      break;
    case "Education":
      result = EventCategory.Education;
      break;
  }
  return result;
}

int calculateTicketTotalPriceForStripe(
  double price,
  int quantity,
) {
  // #eventDetail.price multiplied by #CountCounter

  return (price * quantity * 100).toInt();
}

String? calculateTicketTotalPrice(
  double price,
  int quantity,
) {
  // #eventDetail.price multiplied by #CountCounter
  return (price * quantity).toString();
}

double convertStringToDouble(String totalAmount) {
  return double.parse(totalAmount);
}

TicketType convertToTicketType(String ticketType) {
  var result = TicketType.VIP;
  switch (ticketType) {
    case "VIP":
      result = TicketType.VIP;
      break;
    case "ECONOMY":
      result = TicketType.Economy;
      break;
  }
  return result;
}

UserTypes convertToUserType(String userType) {
  var result = UserTypes.User;
  switch (userType) {
    case "User":
      result = UserTypes.User;
      break;
    case "Organizer":
      result = UserTypes.Organizer;
    case "Admin":
      result = UserTypes.Admin;
      break;
  }
  return result;
}

int? incrementnumberoffollowers(
  int? nooffollowers,
  bool isfollowing,
) {
  // if isfollowing is true increment counter  by 1 else decrement it by 1
  if (isfollowing) {
    return (nooffollowers ?? 0) + 1;
  } else {
    return (nooffollowers ?? 0) - 1;
  }
}

String getPlaybackIDFromURL(String url) {
  String strl = url.replaceAll(".m3u8", "");
  return strl.split("/").last;
}

double getTheSumOfEvents(List<double> prices) {
  return prices.reduce((value, element) => value + element);
}

DateTime getMonthStartOrEndDate(String rangeType) {
  DateTime now = DateTime.now();
  DateTime startOfMonth = DateTime(now.year, now.month, 1);
  DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);

  if (rangeType == 'start') {
    return startOfMonth;
  } else {
    return endOfMonth;
  }
}
