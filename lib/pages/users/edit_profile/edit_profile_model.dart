import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for FullNameTextField widget.
  FocusNode? fullNameTextFieldFocusNode;
  TextEditingController? fullNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      fullNameTextFieldTextControllerValidator;
  // State field(s) for UserTypeField widget.
  String? userTypeFieldValue;
  FormFieldController<String>? userTypeFieldValueController;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  DateTime? datePicked;
  // State field(s) for AboutMeTextField widget.
  FocusNode? aboutMeTextFieldFocusNode;
  TextEditingController? aboutMeTextFieldTextController;
  String? Function(BuildContext, String?)?
      aboutMeTextFieldTextControllerValidator;
  // State field(s) for CategoryChoiceChips widget.
  FormFieldController<List<String>>? categoryChoiceChipsValueController;
  List<String>? get categoryChoiceChipsValues =>
      categoryChoiceChipsValueController?.value;
  set categoryChoiceChipsValues(List<String>? val) =>
      categoryChoiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullNameTextFieldFocusNode?.dispose();
    fullNameTextFieldTextController?.dispose();

    aboutMeTextFieldFocusNode?.dispose();
    aboutMeTextFieldTextController?.dispose();
  }
}
