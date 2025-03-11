import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/components/booked_marked_events_component/booked_marked_events_component_widget.dart';
import '/pages/events/components/events_list_component/events_list_component_widget.dart';
import 'all_events_widget.dart' show AllEventsWidget;
import 'package:flutter/material.dart';

class AllEventsModel extends FlutterFlowModel<AllEventsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EventsListComponent component.
  late EventsListComponentModel eventsListComponentModel;
  // Model for BookedMarkedEventsComponent component.
  late BookedMarkedEventsComponentModel bookedMarkedEventsComponentModel;

  @override
  void initState(BuildContext context) {
    eventsListComponentModel =
        createModel(context, () => EventsListComponentModel());
    bookedMarkedEventsComponentModel =
        createModel(context, () => BookedMarkedEventsComponentModel());
  }

  @override
  void dispose() {
    eventsListComponentModel.dispose();
    bookedMarkedEventsComponentModel.dispose();
  }
}
