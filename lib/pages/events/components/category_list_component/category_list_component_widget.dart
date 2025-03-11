import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'category_list_component_model.dart';
export 'category_list_component_model.dart';

class CategoryListComponentWidget extends StatefulWidget {
  const CategoryListComponentWidget({super.key});

  @override
  State<CategoryListComponentWidget> createState() =>
      _CategoryListComponentWidgetState();
}

class _CategoryListComponentWidgetState
    extends State<CategoryListComponentWidget> {
  late CategoryListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryListComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: FlutterFlowChoiceChips(
        options: [
          ChipData(
              FFLocalizations.of(context).getText(
                'gn2ikuug' /* Design */,
              ),
              Icons.design_services),
          ChipData(
              FFLocalizations.of(context).getText(
                '2p0k6g3q' /* Arts */,
              ),
              Icons.color_lens),
          ChipData(
              FFLocalizations.of(context).getText(
                'ibj9j2d9' /* Sports */,
              ),
              Icons.sports_basketball),
          ChipData(
              FFLocalizations.of(context).getText(
                'uwesxvrk' /* Education */,
              ),
              FontAwesomeIcons.graduationCap),
          ChipData(
              FFLocalizations.of(context).getText(
                'qzzsdarb' /* Social */,
              ),
              Icons.social_distance)
        ],
        onChanged: (val) async {
          safeSetState(
              () => _model.categoryChoiceChipsValue = val?.firstOrNull);
          logFirebaseEvent('CATEGORY_LIST_COMPONENT_CategoryChoiceCh');
          logFirebaseEvent('CategoryChoiceChips_update_app_state');

          _model.updatePage(() {});
        },
        selectedChipStyle: ChipStyle(
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).info,
                fontSize: 12.0,
                letterSpacing: 0.0,
              ),
          iconColor: FlutterFlowTheme.of(context).info,
          iconSize: 14.0,
          elevation: 0.0,
          borderRadius: BorderRadius.circular(24.0),
        ),
        unselectedChipStyle: ChipStyle(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 12.0,
                letterSpacing: 0.0,
                lineHeight: 2.0,
              ),
          iconColor: FlutterFlowTheme.of(context).secondaryText,
          iconSize: 14.0,
          elevation: 0.0,
          borderRadius: BorderRadius.circular(24.0),
        ),
        chipSpacing: 15.0,
        rowSpacing: 8.0,
        multiselect: false,
        initialized: _model.categoryChoiceChipsValue != null,
        alignment: WrapAlignment.start,
        controller: _model.categoryChoiceChipsValueController ??=
            FormFieldController<List<String>>(
          [
            FFLocalizations.of(context).getText(
              'yf533f26' /* Design */,
            )
          ],
        ),
        wrapped: false,
      ),
    );
  }
}
