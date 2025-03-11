import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblRsvpRecord extends FirestoreRecord {
  TblRsvpRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tbl_rsvp');

  static Stream<TblRsvpRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblRsvpRecord.fromSnapshot(s));

  static Future<TblRsvpRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TblRsvpRecord.fromSnapshot(s));

  static TblRsvpRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblRsvpRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblRsvpRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblRsvpRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblRsvpRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblRsvpRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblRsvpRecordData({
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblRsvpRecordDocumentEquality implements Equality<TblRsvpRecord> {
  const TblRsvpRecordDocumentEquality();

  @override
  bool equals(TblRsvpRecord? e1, TblRsvpRecord? e2) {
    return e1?.userId == e2?.userId;
  }

  @override
  int hash(TblRsvpRecord? e) => const ListEquality().hash([e?.userId]);

  @override
  bool isValidKey(Object? o) => o is TblRsvpRecord;
}
