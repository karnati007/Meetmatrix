// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventEntityStruct extends FFFirebaseStruct {
  EventEntityStruct({
    DocumentReference? eventReference,
    String? eventName,
    DateTime? startDate,
    DateTime? endDate,
    DocumentReference? eventOrganizerReference,
    String? eventLocation,
    int? quantity,
    double? ticketTotalPrice,
    PaymentType? paymentType,
    DocumentReference? ticketReference,
    String? currencySymbol,
    String? ticketType,
    Currency? currency,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _eventReference = eventReference,
        _eventName = eventName,
        _startDate = startDate,
        _endDate = endDate,
        _eventOrganizerReference = eventOrganizerReference,
        _eventLocation = eventLocation,
        _quantity = quantity,
        _ticketTotalPrice = ticketTotalPrice,
        _paymentType = paymentType,
        _ticketReference = ticketReference,
        _currencySymbol = currencySymbol,
        _ticketType = ticketType,
        _currency = currency,
        super(firestoreUtilData);

  // "event_reference" field.
  DocumentReference? _eventReference;
  DocumentReference? get eventReference => _eventReference;
  set eventReference(DocumentReference? val) => _eventReference = val;

  bool hasEventReference() => _eventReference != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  set eventName(String? val) => _eventName = val;

  bool hasEventName() => _eventName != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "event_organizer_reference" field.
  DocumentReference? _eventOrganizerReference;
  DocumentReference? get eventOrganizerReference => _eventOrganizerReference;
  set eventOrganizerReference(DocumentReference? val) =>
      _eventOrganizerReference = val;

  bool hasEventOrganizerReference() => _eventOrganizerReference != null;

  // "event_location" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  set eventLocation(String? val) => _eventLocation = val;

  bool hasEventLocation() => _eventLocation != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "ticket_total_price" field.
  double? _ticketTotalPrice;
  double get ticketTotalPrice => _ticketTotalPrice ?? 0.0;
  set ticketTotalPrice(double? val) => _ticketTotalPrice = val;

  void incrementTicketTotalPrice(double amount) =>
      ticketTotalPrice = ticketTotalPrice + amount;

  bool hasTicketTotalPrice() => _ticketTotalPrice != null;

  // "payment_type" field.
  PaymentType? _paymentType;
  PaymentType? get paymentType => _paymentType;
  set paymentType(PaymentType? val) => _paymentType = val;

  bool hasPaymentType() => _paymentType != null;

  // "ticket_reference" field.
  DocumentReference? _ticketReference;
  DocumentReference? get ticketReference => _ticketReference;
  set ticketReference(DocumentReference? val) => _ticketReference = val;

  bool hasTicketReference() => _ticketReference != null;

  // "currency_symbol" field.
  String? _currencySymbol;
  String get currencySymbol => _currencySymbol ?? '';
  set currencySymbol(String? val) => _currencySymbol = val;

  bool hasCurrencySymbol() => _currencySymbol != null;

  // "ticket_type" field.
  String? _ticketType;
  String get ticketType => _ticketType ?? '';
  set ticketType(String? val) => _ticketType = val;

  bool hasTicketType() => _ticketType != null;

  // "currency" field.
  Currency? _currency;
  Currency? get currency => _currency;
  set currency(Currency? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  static EventEntityStruct fromMap(Map<String, dynamic> data) =>
      EventEntityStruct(
        eventReference: data['event_reference'] as DocumentReference?,
        eventName: data['event_name'] as String?,
        startDate: data['start_date'] as DateTime?,
        endDate: data['end_date'] as DateTime?,
        eventOrganizerReference:
            data['event_organizer_reference'] as DocumentReference?,
        eventLocation: data['event_location'] as String?,
        quantity: castToType<int>(data['quantity']),
        ticketTotalPrice: castToType<double>(data['ticket_total_price']),
        paymentType: data['payment_type'] is PaymentType
            ? data['payment_type']
            : deserializeEnum<PaymentType>(data['payment_type']),
        ticketReference: data['ticket_reference'] as DocumentReference?,
        currencySymbol: data['currency_symbol'] as String?,
        ticketType: data['ticket_type'] as String?,
        currency: data['currency'] is Currency
            ? data['currency']
            : deserializeEnum<Currency>(data['currency']),
      );

  static EventEntityStruct? maybeFromMap(dynamic data) => data is Map
      ? EventEntityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'event_reference': _eventReference,
        'event_name': _eventName,
        'start_date': _startDate,
        'end_date': _endDate,
        'event_organizer_reference': _eventOrganizerReference,
        'event_location': _eventLocation,
        'quantity': _quantity,
        'ticket_total_price': _ticketTotalPrice,
        'payment_type': _paymentType?.serialize(),
        'ticket_reference': _ticketReference,
        'currency_symbol': _currencySymbol,
        'ticket_type': _ticketType,
        'currency': _currency?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'event_reference': serializeParam(
          _eventReference,
          ParamType.DocumentReference,
        ),
        'event_name': serializeParam(
          _eventName,
          ParamType.String,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'event_organizer_reference': serializeParam(
          _eventOrganizerReference,
          ParamType.DocumentReference,
        ),
        'event_location': serializeParam(
          _eventLocation,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'ticket_total_price': serializeParam(
          _ticketTotalPrice,
          ParamType.double,
        ),
        'payment_type': serializeParam(
          _paymentType,
          ParamType.Enum,
        ),
        'ticket_reference': serializeParam(
          _ticketReference,
          ParamType.DocumentReference,
        ),
        'currency_symbol': serializeParam(
          _currencySymbol,
          ParamType.String,
        ),
        'ticket_type': serializeParam(
          _ticketType,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static EventEntityStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventEntityStruct(
        eventReference: deserializeParam(
          data['event_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tbl_events'],
        ),
        eventName: deserializeParam(
          data['event_name'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.DateTime,
          false,
        ),
        eventOrganizerReference: deserializeParam(
          data['event_organizer_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tbl_users'],
        ),
        eventLocation: deserializeParam(
          data['event_location'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        ticketTotalPrice: deserializeParam(
          data['ticket_total_price'],
          ParamType.double,
          false,
        ),
        paymentType: deserializeParam<PaymentType>(
          data['payment_type'],
          ParamType.Enum,
          false,
        ),
        ticketReference: deserializeParam(
          data['ticket_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tbl_tickets'],
        ),
        currencySymbol: deserializeParam(
          data['currency_symbol'],
          ParamType.String,
          false,
        ),
        ticketType: deserializeParam(
          data['ticket_type'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam<Currency>(
          data['currency'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'EventEntityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventEntityStruct &&
        eventReference == other.eventReference &&
        eventName == other.eventName &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        eventOrganizerReference == other.eventOrganizerReference &&
        eventLocation == other.eventLocation &&
        quantity == other.quantity &&
        ticketTotalPrice == other.ticketTotalPrice &&
        paymentType == other.paymentType &&
        ticketReference == other.ticketReference &&
        currencySymbol == other.currencySymbol &&
        ticketType == other.ticketType &&
        currency == other.currency;
  }

  @override
  int get hashCode => const ListEquality().hash([
        eventReference,
        eventName,
        startDate,
        endDate,
        eventOrganizerReference,
        eventLocation,
        quantity,
        ticketTotalPrice,
        paymentType,
        ticketReference,
        currencySymbol,
        ticketType,
        currency
      ]);
}

EventEntityStruct createEventEntityStruct({
  DocumentReference? eventReference,
  String? eventName,
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? eventOrganizerReference,
  String? eventLocation,
  int? quantity,
  double? ticketTotalPrice,
  PaymentType? paymentType,
  DocumentReference? ticketReference,
  String? currencySymbol,
  String? ticketType,
  Currency? currency,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventEntityStruct(
      eventReference: eventReference,
      eventName: eventName,
      startDate: startDate,
      endDate: endDate,
      eventOrganizerReference: eventOrganizerReference,
      eventLocation: eventLocation,
      quantity: quantity,
      ticketTotalPrice: ticketTotalPrice,
      paymentType: paymentType,
      ticketReference: ticketReference,
      currencySymbol: currencySymbol,
      ticketType: ticketType,
      currency: currency,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventEntityStruct? updateEventEntityStruct(
  EventEntityStruct? eventEntity, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventEntity
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventEntityStructData(
  Map<String, dynamic> firestoreData,
  EventEntityStruct? eventEntity,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventEntity == null) {
    return;
  }
  if (eventEntity.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventEntity.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventEntityData =
      getEventEntityFirestoreData(eventEntity, forFieldValue);
  final nestedData =
      eventEntityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventEntity.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventEntityFirestoreData(
  EventEntityStruct? eventEntity, [
  bool forFieldValue = false,
]) {
  if (eventEntity == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventEntity.toMap());

  // Add any Firestore field values
  eventEntity.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventEntityListFirestoreData(
  List<EventEntityStruct>? eventEntitys,
) =>
    eventEntitys?.map((e) => getEventEntityFirestoreData(e, true)).toList() ??
    [];
