import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const SplashWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const SplashWidget(),
        ),
        FFRoute(
          name: 'Splash',
          path: '/splash',
          builder: (context, params) => const SplashWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Home')
              : HomeWidget(
                  showWalkthrough: params.getParam(
                    'showWalkthrough',
                    ParamType.bool,
                  ),
                ),
        ),
        FFRoute(
          name: 'EventPreview',
          path: '/event-preview',
          asyncParams: {
            'eventDetail': getDoc(['tbl_events'], TblEventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventPreviewWidget(
            eventDetail: params.getParam(
              'eventDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'EventDetails',
          path: '/event-details',
          asyncParams: {
            'eventDetail': getDoc(['tbl_events'], TblEventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventDetailsWidget(
            eventDetail: params.getParam(
              'eventDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'EventBooked',
          path: '/event-booked',
          asyncParams: {
            'eventDetail': getDoc(['tbl_events'], TblEventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventBookedWidget(
            eventDetail: params.getParam(
              'eventDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'AllEvents',
          path: '/all-events',
          builder: (context, params) => AllEventsWidget(
            filterType: params.getParam<EventFilterType>(
              'filterType',
              ParamType.Enum,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EmptyEvents',
          path: '/empty-events',
          builder: (context, params) => const EmptyEventsWidget(),
        ),
        FFRoute(
          name: 'UpcomingEvents',
          path: '/upcoming-events',
          builder: (context, params) => const UpcomingEventsWidget(),
        ),
        FFRoute(
          name: 'PastEvents',
          path: '/past-events',
          builder: (context, params) => const PastEventsWidget(),
        ),
        FFRoute(
          name: 'Signup',
          path: '/Signup',
          builder: (context, params) => const SignupWidget(),
        ),
        FFRoute(
          name: 'Signin',
          path: '/signin',
          builder: (context, params) => const SigninWidget(),
        ),
        FFRoute(
          name: 'VerificationCode',
          path: '/Verification',
          builder: (context, params) => VerificationCodeWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/ForgotPassword',
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'Search',
          path: '/search',
          builder: (context, params) => SearchWidget(
            userSearchInput: params.getParam(
              'userSearchInput',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Ticket',
          path: '/ticket',
          asyncParams: {
            'eventDetail': getDoc(['tbl_events'], TblEventsRecord.fromSnapshot),
          },
          builder: (context, params) => TicketWidget(
            eventDetail: params.getParam(
              'eventDetail',
              ParamType.Document,
            ),
            tickettype: params.getParam(
              'tickettype',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EventWishList',
          path: '/event--wishlist',
          builder: (context, params) => const EventWishListWidget(),
        ),
        FFRoute(
          name: 'OnBoarding',
          path: '/onBoarding',
          builder: (context, params) => const OnBoardingWidget(),
        ),
        FFRoute(
          name: 'calendar_page',
          path: '/calendarPage',
          builder: (context, params) => const CalendarPageWidget(),
        ),
        FFRoute(
          name: 'samplecalendar',
          path: '/samplecalendar',
          builder: (context, params) => const SamplecalendarWidget(),
        ),
        FFRoute(
          name: 'covid19_declaration',
          path: '/covid19Declaration',
          asyncParams: {
            'eventDetail': getDoc(['tbl_events'], TblEventsRecord.fromSnapshot),
          },
          builder: (context, params) => Covid19DeclarationWidget(
            eventDetail: params.getParam(
              'eventDetail',
              ParamType.Document,
            ),
            quantity: params.getParam(
              'quantity',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'VouchePage',
          path: '/vouchePage',
          builder: (context, params) => const VouchePageWidget(),
        ),
        FFRoute(
          name: 'ScanCard',
          path: '/scanCard',
          builder: (context, params) => const ScanCardWidget(),
        ),
        FFRoute(
          name: 'EmptyNotification',
          path: '/emptyNotification',
          builder: (context, params) => const EmptyNotificationWidget(),
        ),
        FFRoute(
          name: 'UserInvite',
          path: '/userInvite',
          builder: (context, params) => const UserInviteWidget(),
        ),
        FFRoute(
          name: 'samplecalendarCopy',
          path: '/samplecalendarCopy',
          builder: (context, params) => const SamplecalendarCopyWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'Details11EventTicket',
          path: '/details11EventTicket',
          builder: (context, params) => const Details11EventTicketWidget(),
        ),
        FFRoute(
          name: 'chat_2_Details',
          path: '/chat2Details',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ChatsLists',
          path: '/chatsLists',
          builder: (context, params) => const ChatsListsWidget(),
        ),
        FFRoute(
          name: 'SelectUsers',
          path: '/selectUsers',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => SelectUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
            users: params.getParam(
              'users',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tbl_users'],
            ),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ErrorPage',
          path: '/errorPage',
          builder: (context, params) => const ErrorPageWidget(),
        ),
        FFRoute(
          name: 'AddEvent',
          path: '/addEvent',
          builder: (context, params) => const AddEventWidget(),
        ),
        FFRoute(
          name: 'Interests',
          path: '/interests',
          builder: (context, params) => const InterestsWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => const SettingsWidget(),
        ),
        FFRoute(
          name: 'EventTicket',
          path: '/eventTicket',
          asyncParams: {
            'eventDetail': getDoc(['tbl_events'], TblEventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventTicketWidget(
            eventDetail: params.getParam(
              'eventDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Terms',
          path: '/terms',
          builder: (context, params) => const TermsWidget(),
        ),
        FFRoute(
          name: 'notification',
          path: '/notification',
          builder: (context, params) => NotificationWidget(
            notificationCount: params.getParam(
              'notificationCount',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'AboutUs',
          path: '/aboutUs',
          builder: (context, params) => const AboutUsWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolicy',
          path: '/privacyPolicy',
          builder: (context, params) => const PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: 'Support',
          path: '/support',
          builder: (context, params) => const SupportWidget(),
        ),
        FFRoute(
          name: 'ReportPage',
          path: '/reportPage',
          builder: (context, params) => const ReportPageWidget(),
        ),
        FFRoute(
          name: 'OnBoarding1',
          path: '/onBoarding1',
          builder: (context, params) => const OnBoarding1Widget(),
        ),
        FFRoute(
          name: 'OnBoarding2',
          path: '/onBoarding2',
          builder: (context, params) => const OnBoarding2Widget(),
        ),
        FFRoute(
          name: 'SubscriptionsPage',
          path: '/subscriptionsPage',
          builder: (context, params) => const SubscriptionsPageWidget(),
        ),
        FFRoute(
          name: 'payment_options',
          path: '/paymentOptions',
          asyncParams: {
            'eventDetail': getDoc(['tbl_events'], TblEventsRecord.fromSnapshot),
          },
          builder: (context, params) => PaymentOptionsWidget(
            eventDetail: params.getParam(
              'eventDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Organiser_Profile',
          path: '/organiserProfile',
          builder: (context, params) => const OrganiserProfileWidget(),
        ),
        FFRoute(
          name: 'SelectCountry',
          path: '/selectCountry',
          builder: (context, params) => const SelectCountryWidget(),
        ),
        FFRoute(
          name: 'ProfileRedirectPage',
          path: '/profileRedirectPage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'ProfileRedirectPage')
              : const ProfileRedirectPageWidget(),
        ),
        FFRoute(
          name: 'LocationView',
          path: '/locationView',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'LocationView')
              : const LocationViewWidget(),
        ),
        FFRoute(
          name: 'EditEvent',
          path: '/editEvent',
          asyncParams: {
            'eventDetails':
                getDoc(['tbl_events'], TblEventsRecord.fromSnapshot),
          },
          builder: (context, params) => EditEventWidget(
            eventDetails: params.getParam(
              'eventDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Streams',
          path: '/streams',
          builder: (context, params) => const StreamsWidget(),
        ),
        FFRoute(
          name: 'livestreamer',
          path: '/livestreamer',
          builder: (context, params) => LivestreamerWidget(
            streamName: params.getParam(
              'streamName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'livestreamViewer',
          path: '/livestreamViewer',
          builder: (context, params) => LivestreamViewerWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'dashboard',
          path: '/dashboard',
          builder: (context, params) => const DashboardWidget(),
        ),
        FFRoute(
          name: 'ResetPassword',
          path: '/resetPassword',
          builder: (context, params) => const ResetPasswordWidget(),
        ),
        FFRoute(
          name: 'adsMob',
          path: '/adsMob',
          builder: (context, params) => const AdsMobWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splash';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Dark_Mode_Logo.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
