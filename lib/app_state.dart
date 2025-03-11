import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_ticketcounter')) {
        try {
          final serializedData = prefs.getString('ff_ticketcounter') ?? '{}';
          _ticketcounter =
              CounterStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  CounterStruct _ticketcounter = CounterStruct();
  CounterStruct get ticketcounter => _ticketcounter;
  set ticketcounter(CounterStruct value) {
    _ticketcounter = value;
    prefs.setString('ff_ticketcounter', value.serialize());
  }

  void updateTicketcounterStruct(Function(CounterStruct) updateFn) {
    updateFn(_ticketcounter);
    prefs.setString('ff_ticketcounter', _ticketcounter.serialize());
  }

  double _sliderValue = 0.0;
  double get sliderValue => _sliderValue;
  set sliderValue(double value) {
    _sliderValue = value;
  }

  bool _isprimarycard = false;
  bool get isprimarycard => _isprimarycard;
  set isprimarycard(bool value) {
    _isprimarycard = value;
  }

  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;
  set isExpanded(bool value) {
    _isExpanded = value;
  }

  EventEntityStruct _eventState = EventEntityStruct();
  EventEntityStruct get eventState => _eventState;
  set eventState(EventEntityStruct value) {
    _eventState = value;
  }

  void updateEventStateStruct(Function(EventEntityStruct) updateFn) {
    updateFn(_eventState);
  }

  List<String> _categories = [];
  List<String> get categories => _categories;
  set categories(List<String> value) {
    _categories = value;
  }

  void addToCategories(String value) {
    categories.add(value);
  }

  void removeFromCategories(String value) {
    categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
  }

  void insertAtIndexInCategories(int index, String value) {
    categories.insert(index, value);
  }

  String _selectedcategories = '';
  String get selectedcategories => _selectedcategories;
  set selectedcategories(String value) {
    _selectedcategories = value;
  }

  bool _isfollowing = false;
  bool get isfollowing => _isfollowing;
  set isfollowing(bool value) {
    _isfollowing = value;
  }

  List<String> _selectedchips = [];
  List<String> get selectedchips => _selectedchips;
  set selectedchips(List<String> value) {
    _selectedchips = value;
  }

  void addToSelectedchips(String value) {
    selectedchips.add(value);
  }

  void removeFromSelectedchips(String value) {
    selectedchips.remove(value);
  }

  void removeAtIndexFromSelectedchips(int index) {
    selectedchips.removeAt(index);
  }

  void updateSelectedchipsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedchips[index] = updateFn(_selectedchips[index]);
  }

  void insertAtIndexInSelectedchips(int index, String value) {
    selectedchips.insert(index, value);
  }

  LatLng? _defaultLongLat = const LatLng(41.1184532, -85.105941);
  LatLng? get defaultLongLat => _defaultLongLat;
  set defaultLongLat(LatLng? value) {
    _defaultLongLat = value;
  }

  final _userDocQueryManager = FutureRequestManager<TblUsersRecord>();
  Future<TblUsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<TblUsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
