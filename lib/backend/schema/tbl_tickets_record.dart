import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblTicketsRecord extends FirestoreRecord {
  TblTicketsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "event_id" field.
  DocumentReference? _eventId;
  DocumentReference? get eventId => _eventId;
  bool hasEventId() => _eventId != null;

  // "creation_time" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "price_paid" field.
  double? _pricePaid;
  double get pricePaid => _pricePaid ?? 0.0;
  bool hasPricePaid() => _pricePaid != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "payment_type" field.
  PaymentType? _paymentType;
  PaymentType? get paymentType => _paymentType;
  bool hasPaymentType() => _paymentType != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "currency" field.
  Currency? _currency;
  Currency? get currency => _currency;
  bool hasCurrency() => _currency != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "ticket_type" field.
  TicketType? _ticketType;
  TicketType? get ticketType => _ticketType;
  bool hasTicketType() => _ticketType != null;

  void _initializeFields() {
    _eventId = snapshotData['event_id'] as DocumentReference?;
    _creationTime = snapshotData['creation_time'] as DateTime?;
    _pricePaid = castToType<double>(snapshotData['price_paid']);
    _uid = snapshotData['uid'] as String?;
    _paymentType = snapshotData['payment_type'] is PaymentType
        ? snapshotData['payment_type']
        : deserializeEnum<PaymentType>(snapshotData['payment_type']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _tax = castToType<double>(snapshotData['tax']);
    _currency = snapshotData['currency'] is Currency
        ? snapshotData['currency']
        : deserializeEnum<Currency>(snapshotData['currency']);
    _userId = snapshotData['user_id'] as DocumentReference?;
    _ticketType = snapshotData['ticket_type'] is TicketType
        ? snapshotData['ticket_type']
        : deserializeEnum<TicketType>(snapshotData['ticket_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tbl_tickets');

  static Stream<TblTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblTicketsRecord.fromSnapshot(s));

  static Future<TblTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TblTicketsRecord.fromSnapshot(s));

  static TblTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblTicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblTicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblTicketsRecordData({
  DocumentReference? eventId,
  DateTime? creationTime,
  double? pricePaid,
  String? uid,
  PaymentType? paymentType,
  int? quantity,
  double? tax,
  Currency? currency,
  DocumentReference? userId,
  TicketType? ticketType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_id': eventId,
      'creation_time': creationTime,
      'price_paid': pricePaid,
      'uid': uid,
      'payment_type': paymentType,
      'quantity': quantity,
      'tax': tax,
      'currency': currency,
      'user_id': userId,
      'ticket_type': ticketType,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblTicketsRecordDocumentEquality implements Equality<TblTicketsRecord> {
  const TblTicketsRecordDocumentEquality();

  @override
  bool equals(TblTicketsRecord? e1, TblTicketsRecord? e2) {
    return e1?.eventId == e2?.eventId &&
        e1?.creationTime == e2?.creationTime &&
        e1?.pricePaid == e2?.pricePaid &&
        e1?.uid == e2?.uid &&
        e1?.paymentType == e2?.paymentType &&
        e1?.quantity == e2?.quantity &&
        e1?.tax == e2?.tax &&
        e1?.currency == e2?.currency &&
        e1?.userId == e2?.userId &&
        e1?.ticketType == e2?.ticketType;
  }

  @override
  int hash(TblTicketsRecord? e) => const ListEquality().hash([
        e?.eventId,
        e?.creationTime,
        e?.pricePaid,
        e?.uid,
        e?.paymentType,
        e?.quantity,
        e?.tax,
        e?.currency,
        e?.userId,
        e?.ticketType
      ]);

  @override
  bool isValidKey(Object? o) => o is TblTicketsRecord;
}
