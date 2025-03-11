import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Dark_Mode_Logo.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Splash': ParameterData.none(),
  'Home': (data) async => ParameterData(
        allParams: {
          'showWalkthrough': getParameter<bool>(data, 'showWalkthrough'),
        },
      ),
  'EventPreview': (data) async => ParameterData(
        allParams: {
          'eventDetail': await getDocumentParameter<TblEventsRecord>(
              data, 'eventDetail', TblEventsRecord.fromSnapshot),
        },
      ),
  'Profile': ParameterData.none(),
  'EventDetails': (data) async => ParameterData(
        allParams: {
          'eventDetail': await getDocumentParameter<TblEventsRecord>(
              data, 'eventDetail', TblEventsRecord.fromSnapshot),
        },
      ),
  'EventBooked': (data) async => ParameterData(
        allParams: {
          'eventDetail': await getDocumentParameter<TblEventsRecord>(
              data, 'eventDetail', TblEventsRecord.fromSnapshot),
        },
      ),
  'AllEvents': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
        },
      ),
  'EmptyEvents': ParameterData.none(),
  'UpcomingEvents': ParameterData.none(),
  'PastEvents': ParameterData.none(),
  'Signup': ParameterData.none(),
  'Signin': ParameterData.none(),
  'VerificationCode': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'ForgotPassword': ParameterData.none(),
  'Search': (data) async => ParameterData(
        allParams: {
          'userSearchInput': getParameter<String>(data, 'userSearchInput'),
        },
      ),
  'Ticket': (data) async => ParameterData(
        allParams: {
          'eventDetail': await getDocumentParameter<TblEventsRecord>(
              data, 'eventDetail', TblEventsRecord.fromSnapshot),
          'tickettype': getParameter<String>(data, 'tickettype'),
        },
      ),
  'EventWishList': ParameterData.none(),
  'OnBoarding': ParameterData.none(),
  'calendar_page': ParameterData.none(),
  'samplecalendar': ParameterData.none(),
  'covid19_declaration': (data) async => ParameterData(
        allParams: {
          'eventDetail': await getDocumentParameter<TblEventsRecord>(
              data, 'eventDetail', TblEventsRecord.fromSnapshot),
          'quantity': getParameter<int>(data, 'quantity'),
        },
      ),
  'VouchePage': ParameterData.none(),
  'ScanCard': ParameterData.none(),
  'EmptyNotification': ParameterData.none(),
  'UserInvite': ParameterData.none(),
  'samplecalendarCopy': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'Details11EventTicket': ParameterData.none(),
  'chat_2_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'ChatsLists': ParameterData.none(),
  'SelectUsers': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
          'users': getParameter<DocumentReference>(data, 'users'),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'ErrorPage': ParameterData.none(),
  'AddEvent': ParameterData.none(),
  'Interests': ParameterData.none(),
  'Settings': ParameterData.none(),
  'EventTicket': (data) async => ParameterData(
        allParams: {
          'eventDetail': await getDocumentParameter<TblEventsRecord>(
              data, 'eventDetail', TblEventsRecord.fromSnapshot),
        },
      ),
  'Terms': ParameterData.none(),
  'notification': (data) async => ParameterData(
        allParams: {
          'notificationCount': getParameter<int>(data, 'notificationCount'),
        },
      ),
  'AboutUs': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'Support': ParameterData.none(),
  'ReportPage': ParameterData.none(),
  'OnBoarding1': ParameterData.none(),
  'OnBoarding2': ParameterData.none(),
  'SubscriptionsPage': ParameterData.none(),
  'payment_options': (data) async => ParameterData(
        allParams: {
          'eventDetail': await getDocumentParameter<TblEventsRecord>(
              data, 'eventDetail', TblEventsRecord.fromSnapshot),
        },
      ),
  'Organiser_Profile': ParameterData.none(),
  'SelectCountry': ParameterData.none(),
  'ProfileRedirectPage': ParameterData.none(),
  'LocationView': ParameterData.none(),
  'EditEvent': (data) async => ParameterData(
        allParams: {
          'eventDetails': await getDocumentParameter<TblEventsRecord>(
              data, 'eventDetails', TblEventsRecord.fromSnapshot),
        },
      ),
  'Streams': ParameterData.none(),
  'livestreamer': (data) async => ParameterData(
        allParams: {
          'streamName': getParameter<String>(data, 'streamName'),
        },
      ),
  'livestreamViewer': (data) async => ParameterData(
        allParams: {
          'url': getParameter<String>(data, 'url'),
        },
      ),
  'dashboard': ParameterData.none(),
  'ResetPassword': ParameterData.none(),
  'adsMob': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
