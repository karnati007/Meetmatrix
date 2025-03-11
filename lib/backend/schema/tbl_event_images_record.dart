import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblEventImagesRecord extends FirestoreRecord {
  TblEventImagesRecord._(
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

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  void _initializeFields() {
    _creationTime = snapshotData['creation_time'] as DateTime?;
    _eventId = snapshotData['event_id'] as DocumentReference?;
    _imagePath = snapshotData['image_path'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tbl_event_images');

  static Stream<TblEventImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblEventImagesRecord.fromSnapshot(s));

  static Future<TblEventImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TblEventImagesRecord.fromSnapshot(s));

  static TblEventImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblEventImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblEventImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblEventImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblEventImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblEventImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblEventImagesRecordData({
  DateTime? creationTime,
  DocumentReference? eventId,
  String? imagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creation_time': creationTime,
      'event_id': eventId,
      'image_path': imagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblEventImagesRecordDocumentEquality
    implements Equality<TblEventImagesRecord> {
  const TblEventImagesRecordDocumentEquality();

  @override
  bool equals(TblEventImagesRecord? e1, TblEventImagesRecord? e2) {
    return e1?.creationTime == e2?.creationTime &&
        e1?.eventId == e2?.eventId &&
        e1?.imagePath == e2?.imagePath;
  }

  @override
  int hash(TblEventImagesRecord? e) =>
      const ListEquality().hash([e?.creationTime, e?.eventId, e?.imagePath]);

  @override
  bool isValidKey(Object? o) => o is TblEventImagesRecord;
}
