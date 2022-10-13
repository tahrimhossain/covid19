import 'package:covid19/GlobalView_Bloc/GlobalView_bloc.dart';
import 'package:covid19/Services/API.dart';
import 'package:covid19/Views/CountryDetailView.dart';
import 'package:covid19/Views/CountryView.dart';
import 'package:covid19/Views/GlobalView.dart';
import 'package:covid19/Views/ScaffoldWithBottomNavBar.dart';
import 'package:covid19/Views/SearchPage.dart';
import 'package:covid19/Views/SymptomsAndPreventions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'CountryDetailView_Bloc/CountryDetailView_bloc.dart';
import 'CountryView_Bloc/CountryView_bloc.dart';
import 'Models/Countries.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(RepositoryProvider(
    create: (context) => API(),
    child: MultiBlocProvider(
      providers: [
        BlocProvider<GlobalViewBloc>(
          lazy: false,
          create: (BuildContext context) => GlobalViewBloc(context.read<API>()),
        ),
        BlocProvider<CountryViewBloc>(
          lazy: false,
          create: (BuildContext context) =>
              CountryViewBloc(context.read<API>()),
        ),
        BlocProvider<CountryDetailViewBloc>(
          lazy: false,
          create: (BuildContext context) =>
              CountryDetailViewBloc(context.read<API>()),
        ),
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: GoRouter(
          navigatorKey: _rootNavigatorKey,
          initialLocation: '/global',
          routes: [
            ShellRoute(
                navigatorKey: _shellNavigatorKey,
                builder:
                    (BuildContext context, GoRouterState state, Widget child) {
                  return ScaffoldWithBottomNavBar(child: child);
                },
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    path: '/global',
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: GlobalView(),
                    ),
                  ),
                  GoRoute(
                      parentNavigatorKey: _shellNavigatorKey,
                      path: '/countries',
                      pageBuilder: (context, state) => NoTransitionPage(
                            child: CountryView(),
                          ),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          path: 'search',
                          builder: (context, state) =>
                              SearchPage(state.extra as Countries),
                        ),
                      ]),
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    path: '/symptomsandpreventions',
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: SymptomsAndPreventions(),
                    ),
                  ),
                ]),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: '/detail/:country',
              builder: (context, state) =>
                  CountryDetailView(state.params['country'] as String),
            ),
          ],
          redirect: (context, state) {
            
            if(state.subloc == '/countries/search' && state.extra == null){
              return '/countries';
            }else{
              return null;
            }
          }),
    );
  }
}
