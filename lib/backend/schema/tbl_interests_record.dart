import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblInterestsRecord extends FirestoreRecord {
  TblInterestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "creation_time" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "user_interest" field.
  UserInterest? _userInterest;
  UserInterest? get userInterest => _userInterest;
  bool hasUserInterest() => _userInterest != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creationTime = snapshotData['creation_time'] as DateTime?;
    _userInterest = snapshotData['user_interest'] is UserInterest
        ? snapshotData['user_interest']
        : deserializeEnum<UserInterest>(snapshotData['user_interest']);
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tbl_interests')
          : FirebaseFirestore.instance.collectionGroup('tbl_interests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tbl_interests').doc(id);

  static Stream<TblInterestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblInterestsRecord.fromSnapshot(s));

  static Future<TblInterestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TblInterestsRecord.fromSnapshot(s));

  static TblInterestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblInterestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblInterestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblInterestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblInterestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblInterestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblInterestsRecordData({
  DateTime? creationTime,
  UserInterest? userInterest,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creation_time': creationTime,
      'user_interest': userInterest,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblInterestsRecordDocumentEquality
    implements Equality<TblInterestsRecord> {
  const TblInterestsRecordDocumentEquality();

  @override
  bool equals(TblInterestsRecord? e1, TblInterestsRecord? e2) {
    return e1?.creationTime == e2?.creationTime &&
        e1?.userInterest == e2?.userInterest &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(TblInterestsRecord? e) =>
      const ListEquality().hash([e?.creationTime, e?.userInterest, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is TblInterestsRecord;
}
