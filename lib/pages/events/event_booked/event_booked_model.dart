import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/components/event_actions_component/event_actions_component_widget.dart';
import 'event_booked_widget.dart' show EventBookedWidget;
import 'package:flutter/material.dart';

class EventBookedModel extends FlutterFlowModel<EventBookedWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> friendsList = [];
  void addToFriendsList(DocumentReference item) => friendsList.add(item);
  void removeFromFriendsList(DocumentReference item) =>
      friendsList.remove(item);
  void removeAtIndexFromFriendsList(int index) => friendsList.removeAt(index);
  void insertAtIndexInFriendsList(int index, DocumentReference item) =>
      friendsList.insert(index, item);
  void updateFriendsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      friendsList[index] = updateFn(friendsList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in MessageButton widget.
  ChatsRecord? newChatThread;
  // Model for EventActionsComponent component.
  late EventActionsComponentModel eventActionsComponentModel;

  @override
  void initState(BuildContext context) {
    eventActionsComponentModel =
        createModel(context, () => EventActionsComponentModel());
  }

  @override
  void dispose() {
    eventActionsComponentModel.dispose();
  }
}
