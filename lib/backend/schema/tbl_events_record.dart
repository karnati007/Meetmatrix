import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblEventsRecord extends FirestoreRecord {
  TblEventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "category" field.
  EventCategory? _category;
  EventCategory? get category => _category;
  bool hasCategory() => _category != null;

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  bool hasArchived() => _archived != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "location_name" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "currency" field.
  Currency? _currency;
  Currency? get currency => _currency;
  bool hasCurrency() => _currency != null;

  // "no_of_users_joined" field.
  int? _noOfUsersJoined;
  int get noOfUsersJoined => _noOfUsersJoined ?? 0;
  bool hasNoOfUsersJoined() => _noOfUsersJoined != null;

  // "event_organizer_id" field.
  DocumentReference? _eventOrganizerId;
  DocumentReference? get eventOrganizerId => _eventOrganizerId;
  bool hasEventOrganizerId() => _eventOrganizerId != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "currency_symbol" field.
  String? _currencySymbol;
  String get currencySymbol => _currencySymbol ?? '';
  bool hasCurrencySymbol() => _currencySymbol != null;

  // "is_booked_marked" field.
  bool? _isBookedMarked;
  bool get isBookedMarked => _isBookedMarked ?? false;
  bool hasIsBookedMarked() => _isBookedMarked != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _startTime = snapshotData['start_time'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _category = snapshotData['category'] is EventCategory
        ? snapshotData['category']
        : deserializeEnum<EventCategory>(snapshotData['category']);
    _archived = snapshotData['archived'] as bool?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _locationName = snapshotData['location_name'] as String?;
    _currency = snapshotData['currency'] is Currency
        ? snapshotData['currency']
        : deserializeEnum<Currency>(snapshotData['currency']);
    _noOfUsersJoined = castToType<int>(snapshotData['no_of_users_joined']);
    _eventOrganizerId =
        snapshotData['event_organizer_id'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
    _currencySymbol = snapshotData['currency_symbol'] as String?;
    _isBookedMarked = snapshotData['is_booked_marked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tbl_events');

  static Stream<TblEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblEventsRecord.fromSnapshot(s));

  static Future<TblEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TblEventsRecord.fromSnapshot(s));

  static TblEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblEventsRecordData({
  String? name,
  String? description,
  double? price,
  DateTime? startTime,
  DateTime? endTime,
  EventCategory? category,
  bool? archived,
  String? uid,
  DateTime? createdTime,
  String? locationName,
  Currency? currency,
  int? noOfUsersJoined,
  DocumentReference? eventOrganizerId,
  LatLng? location,
  String? currencySymbol,
  bool? isBookedMarked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'start_time': startTime,
      'end_time': endTime,
      'category': category,
      'archived': archived,
      'uid': uid,
      'created_time': createdTime,
      'location_name': locationName,
      'currency': currency,
      'no_of_users_joined': noOfUsersJoined,
      'event_organizer_id': eventOrganizerId,
      'location': location,
      'currency_symbol': currencySymbol,
      'is_booked_marked': isBookedMarked,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblEventsRecordDocumentEquality implements Equality<TblEventsRecord> {
  const TblEventsRecordDocumentEquality();

  @override
  bool equals(TblEventsRecord? e1, TblEventsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.category == e2?.category &&
        e1?.archived == e2?.archived &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.locationName == e2?.locationName &&
        e1?.currency == e2?.currency &&
        e1?.noOfUsersJoined == e2?.noOfUsersJoined &&
        e1?.eventOrganizerId == e2?.eventOrganizerId &&
        e1?.location == e2?.location &&
        e1?.currencySymbol == e2?.currencySymbol &&
        e1?.isBookedMarked == e2?.isBookedMarked;
  }

  @override
  int hash(TblEventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.startTime,
        e?.endTime,
        e?.category,
        e?.archived,
        e?.uid,
        e?.createdTime,
        e?.locationName,
        e?.currency,
        e?.noOfUsersJoined,
        e?.eventOrganizerId,
        e?.location,
        e?.currencySymbol,
        e?.isBookedMarked
      ]);

  @override
  bool isValidKey(Object? o) => o is TblEventsRecord;
}
