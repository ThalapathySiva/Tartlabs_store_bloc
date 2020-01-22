import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_events.dart';
import 'package:tartlabs_store_bloc/routes.dart';

void main() => runApp(BlocProvider<AuthenticationBloc>(
    create: (BuildContext context) {
      return AuthenticationBloc()..add(AppStartedEvent());
    },
    child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getRoute,
      theme: ThemeData(
          fontFamily: 'Quicksand', scaffoldBackgroundColor: Colors.white),
      home: addAuthBloc(
          context,
          Container(
            child: Image.asset('assets/images/group_4.png'),
          )),
    );
  }
}
