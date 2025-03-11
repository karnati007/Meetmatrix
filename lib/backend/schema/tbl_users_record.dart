import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TblUsersRecord extends FirestoreRecord {
  TblUsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_type" field.
  UserTypes? _userType;
  UserTypes? get userType => _userType;
  bool hasUserType() => _userType != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "no_of_followers" field.
  int? _noOfFollowers;
  int get noOfFollowers => _noOfFollowers ?? 0;
  bool hasNoOfFollowers() => _noOfFollowers != null;

  // "no_of_following" field.
  int? _noOfFollowing;
  int get noOfFollowing => _noOfFollowing ?? 0;
  bool hasNoOfFollowing() => _noOfFollowing != null;

  // "no_of_events" field.
  int? _noOfEvents;
  int get noOfEvents => _noOfEvents ?? 0;
  bool hasNoOfEvents() => _noOfEvents != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "location_name" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "location_latlong" field.
  LatLng? _locationLatlong;
  LatLng? get locationLatlong => _locationLatlong;
  bool hasLocationLatlong() => _locationLatlong != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _userType = snapshotData['user_type'] is UserTypes
        ? snapshotData['user_type']
        : deserializeEnum<UserTypes>(snapshotData['user_type']);
    _password = snapshotData['password'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _fullName = snapshotData['full_name'] as String?;
    _country = snapshotData['country'] as String?;
    _noOfFollowers = castToType<int>(snapshotData['no_of_followers']);
    _noOfFollowing = castToType<int>(snapshotData['no_of_following']);
    _noOfEvents = castToType<int>(snapshotData['no_of_events']);
    _about = snapshotData['about'] as String?;
    _dob = snapshotData['dob'] as DateTime?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _locationName = snapshotData['location_name'] as String?;
    _locationLatlong = snapshotData['location_latlong'] as LatLng?;
    _categories = getDataList(snapshotData['categories']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tbl_users');

  static Stream<TblUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TblUsersRecord.fromSnapshot(s));

  static Future<TblUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TblUsersRecord.fromSnapshot(s));

  static TblUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TblUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TblUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TblUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TblUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TblUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTblUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  UserTypes? userType,
  String? password,
  String? displayName,
  String? fullName,
  String? country,
  int? noOfFollowers,
  int? noOfFollowing,
  int? noOfEvents,
  String? about,
  DateTime? dob,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? locationName,
  LatLng? locationLatlong,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edited_time': editedTime,
      'bio': bio,
      'user_name': userName,
      'user_type': userType,
      'password': password,
      'display_name': displayName,
      'full_name': fullName,
      'country': country,
      'no_of_followers': noOfFollowers,
      'no_of_following': noOfFollowing,
      'no_of_events': noOfEvents,
      'about': about,
      'dob': dob,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'location_name': locationName,
      'location_latlong': locationLatlong,
    }.withoutNulls,
  );

  return firestoreData;
}

class TblUsersRecordDocumentEquality implements Equality<TblUsersRecord> {
  const TblUsersRecordDocumentEquality();

  @override
  bool equals(TblUsersRecord? e1, TblUsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        e1?.userType == e2?.userType &&
        e1?.password == e2?.password &&
        e1?.displayName == e2?.displayName &&
        e1?.fullName == e2?.fullName &&
        e1?.country == e2?.country &&
        e1?.noOfFollowers == e2?.noOfFollowers &&
        e1?.noOfFollowing == e2?.noOfFollowing &&
        e1?.noOfEvents == e2?.noOfEvents &&
        e1?.about == e2?.about &&
        e1?.dob == e2?.dob &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.locationName == e2?.locationName &&
        e1?.locationLatlong == e2?.locationLatlong &&
        listEquality.equals(e1?.categories, e2?.categories);
  }

  @override
  int hash(TblUsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.bio,
        e?.userName,
        e?.userType,
        e?.password,
        e?.displayName,
        e?.fullName,
        e?.country,
        e?.noOfFollowers,
        e?.noOfFollowing,
        e?.noOfEvents,
        e?.about,
        e?.dob,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.locationName,
        e?.locationLatlong,
        e?.categories
      ]);

  @override
  bool isValidKey(Object? o) => o is TblUsersRecord;
}
