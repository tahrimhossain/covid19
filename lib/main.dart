import 'package:covid19/GlobalView_Bloc/GlobalView_bloc.dart';
import 'package:covid19/Services/API.dart';
import 'package:covid19/Views/GlobalView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CountryDetailView_Bloc/CountryDetailView_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
      RepositoryProvider(
          create: (context) => API(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<GlobalViewBloc>(
                lazy: false,
                create: (BuildContext context) => GlobalViewBloc(context.read<API>()),
              ),
              BlocProvider<CountryDetailViewBloc>(
                lazy: false,
                create: (BuildContext context) => CountryDetailViewBloc(context.read<API>()),
              ),
            ],
            child: MaterialApp(
              home:MyApp(),
            ),
          ),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalView();
  }
}

