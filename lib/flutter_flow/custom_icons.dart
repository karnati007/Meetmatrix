import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _designFamily = 'Design';
  static const String _eventsFamily = 'Events';
  static const String _myFlutterAppFamily = 'MyFlutterApp';

  // design
  static const IconData kdesingLogo =
      IconData(0xe901, fontFamily: _designFamily);

  // events
  static const IconData karts = IconData(0xe900, fontFamily: _eventsFamily);
  static const IconData kmusic = IconData(0xe90c, fontFamily: _eventsFamily);
  static const IconData ksports = IconData(0xe910, fontFamily: _eventsFamily);

  // MyFlutterApp
  static const IconData kclose =
      IconData(0xe800, fontFamily: _myFlutterAppFamily);
  static const IconData kkebabVertical =
      IconData(0xf349, fontFamily: _myFlutterAppFamily);
}
