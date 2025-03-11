import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetLiveStreamIDCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLiveStreamID',
      apiUrl: 'https://api.mux.com/video/v1/playback-ids/$playbackId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic YjMzYzgxZjYtMDQ2MC00NzIyLTgxNTAtYjJlMmQ0ZGY3MWIxOlREWHU3UVFjRFpSdDFwTVdaWmJWdm45UVNQbWpQeUY1M2xmeVUxaEJ2ZUxDNXNXL0pvRytrSU9lYkFGcmVQeGt1a3dFc1YvTC8yMg==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? liveStreamID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.object.id''',
      ));
}

class GetPastLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? streamId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPastLiveStream',
      apiUrl: 'https://api.mux.com/video/v1/assets',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic YjMzYzgxZjYtMDQ2MC00NzIyLTgxNTAtYjJlMmQ0ZGY3MWIxOlREWHU3UVFjRFpSdDFwTVdaWmJWdm45UVNQbWpQeUY1M2xmeVUxaEJ2ZUxDNXNXL0pvRytrSU9lYkFGcmVQeGt1a3dFc1YvTC8yMg==',
      },
      params: {
        'live_stream_id': streamId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic playbackID(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? from = 'MeetMatrix<noreply@meetmatrix.com>',
    String? to = 'ademolajhon@gmail.com',
    String? subject = 'Event Created',
    String? text = 'Successfully sent',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmail',
      apiUrl: 'https://api.mailgun.net/v3/www.thekyub.com/messages',
      callType: ApiCallType.POST,
      headers: {
        'authorization':
            'Basic YXBpOmUzOGE4MjUwOGUzMDE0Mzg3NDI2MTQ4OTcyMGI0YmM0LWY1NWQ3NDQ2LWNlOTYxMzY3',
      },
      params: {
        'from': from,
        'to': to,
        'subject': subject,
        'text': text,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
