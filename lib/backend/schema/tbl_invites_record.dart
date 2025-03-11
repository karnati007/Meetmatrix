import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblInvitesRecord extends FirestoreRecord {
  TblInvitesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "creation_time" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "event_id" field.
  DocumentReference? _eventId;
  DocumentReference? get eventId => _eventId;
  bool hasEventId() => _eventId != null;

  // "sender_status" field.
  SenderInviteStatus? _senderStatus;
  SenderInviteStatus? get senderStatus => _senderStatus;
  bool hasSenderStatus() => _senderStatus != null;

  // "receiver_status" field.
  ReceiverInviteStatus? _receiverStatus;
  ReceiverInviteStatus? get receiverStatus => _receiverStatus;
  bool hasReceiverStatus() => _receiverStatus != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creationTime = snapshotData['creation_time'] as DateTime?;
    _eventId = snapshotData['event_id'] as DocumentReference?;
    _senderStatus = snapshotData['sender_status'] is SenderInviteStatus
        ? snapshotData['sender_status']
        : deserializeEnum<SenderInviteStatus>(snapshotData['sender_status']);
    _receiverStatus = snapshotData['receiver_status'] is ReceiverInviteStatus
        ? snapshotData['receiver_status']
        : deserializeEnum<ReceiverInviteStatus>(
            snapshotData['receiver_status']);
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tbl_invites')
          : FirebaseFirestore.instance.collectionGroup('tbl_invites');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tbl_invites').doc(id);

  static Stream<TblInvitesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblInvitesRecord.fromSnapshot(s));

  static Future<TblInvitesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TblInvitesRecord.fromSnapshot(s));

  static TblInvitesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblInvitesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblInvitesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblInvitesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblInvitesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblInvitesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblInvitesRecordData({
  DateTime? creationTime,
  DocumentReference? eventId,
  SenderInviteStatus? senderStatus,
  ReceiverInviteStatus? receiverStatus,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creation_time': creationTime,
      'event_id': eventId,
      'sender_status': senderStatus,
      'receiver_status': receiverStatus,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblInvitesRecordDocumentEquality implements Equality<TblInvitesRecord> {
  const TblInvitesRecordDocumentEquality();

  @override
  bool equals(TblInvitesRecord? e1, TblInvitesRecord? e2) {
    return e1?.creationTime == e2?.creationTime &&
        e1?.eventId == e2?.eventId &&
        e1?.senderStatus == e2?.senderStatus &&
        e1?.receiverStatus == e2?.receiverStatus &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(TblInvitesRecord? e) => const ListEquality().hash([
        e?.creationTime,
        e?.eventId,
        e?.senderStatus,
        e?.receiverStatus,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is TblInvitesRecord;
}
