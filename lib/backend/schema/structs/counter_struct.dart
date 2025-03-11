// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CounterStruct extends FFFirebaseStruct {
  CounterStruct({
    int? count,
    bool? isprimarycard,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _count = count,
        _isprimarycard = isprimarycard,
        super(firestoreUtilData);

  // "Count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "isprimarycard" field.
  bool? _isprimarycard;
  bool get isprimarycard => _isprimarycard ?? false;
  set isprimarycard(bool? val) => _isprimarycard = val;

  bool hasIsprimarycard() => _isprimarycard != null;

  static CounterStruct fromMap(Map<String, dynamic> data) => CounterStruct(
        count: castToType<int>(data['Count']),
        isprimarycard: data['isprimarycard'] as bool?,
      );

  static CounterStruct? maybeFromMap(dynamic data) =>
      data is Map ? CounterStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Count': _count,
        'isprimarycard': _isprimarycard,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Count': serializeParam(
          _count,
          ParamType.int,
        ),
        'isprimarycard': serializeParam(
          _isprimarycard,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CounterStruct fromSerializableMap(Map<String, dynamic> data) =>
      CounterStruct(
        count: deserializeParam(
          data['Count'],
          ParamType.int,
          false,
        ),
        isprimarycard: deserializeParam(
          data['isprimarycard'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CounterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CounterStruct &&
        count == other.count &&
        isprimarycard == other.isprimarycard;
  }

  @override
  int get hashCode => const ListEquality().hash([count, isprimarycard]);
}

CounterStruct createCounterStruct({
  int? count,
  bool? isprimarycard,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CounterStruct(
      count: count,
      isprimarycard: isprimarycard,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CounterStruct? updateCounterStruct(
  CounterStruct? counter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    counter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCounterStructData(
  Map<String, dynamic> firestoreData,
  CounterStruct? counter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (counter == null) {
    return;
  }
  if (counter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && counter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final counterData = getCounterFirestoreData(counter, forFieldValue);
  final nestedData = counterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = counter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCounterFirestoreData(
  CounterStruct? counter, [
  bool forFieldValue = false,
]) {
  if (counter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(counter.toMap());

  // Add any Firestore field values
  counter.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCounterListFirestoreData(
  List<CounterStruct>? counters,
) =>
    counters?.map((e) => getCounterFirestoreData(e, true)).toList() ?? [];
