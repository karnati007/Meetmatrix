import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/components/events_list_component/events_list_component_widget.dart';
import 'past_events_widget.dart' show PastEventsWidget;
import 'package:flutter/material.dart';

class PastEventsModel extends FlutterFlowModel<PastEventsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EventsListComponent component.
  late EventsListComponentModel eventsListComponentModel;

  @override
  void initState(BuildContext context) {
    eventsListComponentModel =
        createModel(context, () => EventsListComponentModel());
  }

  @override
  void dispose() {
    eventsListComponentModel.dispose();
  }
}
