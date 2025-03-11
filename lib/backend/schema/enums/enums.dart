import 'package:collection/collection.dart';

enum UserTypes {
  Admin,
  Organizer,
  User,
}

enum EventCategory {
  Arts,
  Sports,
  Education,
  Music,
  Social,
  Design,
}

enum Currency {
  USD,
  NGN,
  INR,
}

enum TicketStatus {
  Booked,
  Pending,
}

enum UserInterest {
  Design,
  Music,
  Sports,
  Food,
  Others,
}

enum SenderInviteStatus {
  Sent,
  NotSent,
}

enum ReceiverInviteStatus {
  Accepted,
  NotAccepted,
}

enum PaymentType {
  ApplePay,
  GooglePay,
  PayPal,
  Card,
}

enum TicketType {
  Economy,
  VIP,
}

enum EventFilterType {
  All,
  BookedMarked,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UserTypes):
      return UserTypes.values.deserialize(value) as T?;
    case (EventCategory):
      return EventCategory.values.deserialize(value) as T?;
    case (Currency):
      return Currency.values.deserialize(value) as T?;
    case (TicketStatus):
      return TicketStatus.values.deserialize(value) as T?;
    case (UserInterest):
      return UserInterest.values.deserialize(value) as T?;
    case (SenderInviteStatus):
      return SenderInviteStatus.values.deserialize(value) as T?;
    case (ReceiverInviteStatus):
      return ReceiverInviteStatus.values.deserialize(value) as T?;
    case (PaymentType):
      return PaymentType.values.deserialize(value) as T?;
    case (TicketType):
      return TicketType.values.deserialize(value) as T?;
    case (EventFilterType):
      return EventFilterType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
