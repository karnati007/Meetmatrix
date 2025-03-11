import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblFollowersRecord extends FirestoreRecord {
  TblFollowersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "creation_time" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "follower_user_id" field.
  DocumentReference? _followerUserId;
  DocumentReference? get followerUserId => _followerUserId;
  bool hasFollowerUserId() => _followerUserId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creationTime = snapshotData['creation_time'] as DateTime?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _followerUserId = snapshotData['follower_user_id'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tbl_followers')
          : FirebaseFirestore.instance.collectionGroup('tbl_followers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tbl_followers').doc(id);

  static Stream<TblFollowersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblFollowersRecord.fromSnapshot(s));

  static Future<TblFollowersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TblFollowersRecord.fromSnapshot(s));

  static TblFollowersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblFollowersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblFollowersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblFollowersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblFollowersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblFollowersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblFollowersRecordData({
  DateTime? creationTime,
  DocumentReference? userId,
  DocumentReference? followerUserId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creation_time': creationTime,
      'user_id': userId,
      'follower_user_id': followerUserId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblFollowersRecordDocumentEquality
    implements Equality<TblFollowersRecord> {
  const TblFollowersRecordDocumentEquality();

  @override
  bool equals(TblFollowersRecord? e1, TblFollowersRecord? e2) {
    return e1?.creationTime == e2?.creationTime &&
        e1?.userId == e2?.userId &&
        e1?.followerUserId == e2?.followerUserId;
  }

  @override
  int hash(TblFollowersRecord? e) => const ListEquality()
      .hash([e?.creationTime, e?.userId, e?.followerUserId]);

  @override
  bool isValidKey(Object? o) => o is TblFollowersRecord;
}
