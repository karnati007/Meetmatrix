import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblUserEventReviewsRecord extends FirestoreRecord {
  TblUserEventReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "creation_time" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  bool hasRate() => _rate != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creationTime = snapshotData['creation_time'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _rate = castToType<int>(snapshotData['rate']);
    _fullName = snapshotData['full_name'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tbl_user_event_reviews')
          : FirebaseFirestore.instance
              .collectionGroup('tbl_user_event_reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tbl_user_event_reviews').doc(id);

  static Stream<TblUserEventReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblUserEventReviewsRecord.fromSnapshot(s));

  static Future<TblUserEventReviewsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TblUserEventReviewsRecord.fromSnapshot(s));

  static TblUserEventReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblUserEventReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblUserEventReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblUserEventReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblUserEventReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblUserEventReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblUserEventReviewsRecordData({
  DateTime? creationTime,
  String? message,
  int? rate,
  String? fullName,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creation_time': creationTime,
      'message': message,
      'rate': rate,
      'full_name': fullName,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblUserEventReviewsRecordDocumentEquality
    implements Equality<TblUserEventReviewsRecord> {
  const TblUserEventReviewsRecordDocumentEquality();

  @override
  bool equals(TblUserEventReviewsRecord? e1, TblUserEventReviewsRecord? e2) {
    return e1?.creationTime == e2?.creationTime &&
        e1?.message == e2?.message &&
        e1?.rate == e2?.rate &&
        e1?.fullName == e2?.fullName &&
        e1?.email == e2?.email;
  }

  @override
  int hash(TblUserEventReviewsRecord? e) => const ListEquality()
      .hash([e?.creationTime, e?.message, e?.rate, e?.fullName, e?.email]);

  @override
  bool isValidKey(Object? o) => o is TblUserEventReviewsRecord;
}
