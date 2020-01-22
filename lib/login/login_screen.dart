import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabs_store_bloc/components/custom_text_field.dart';
import 'package:tartlabs_store_bloc/components/primary_button.dart';
import 'package:tartlabs_store_bloc/login/login_bloc.dart';
import 'package:tartlabs_store_bloc/login/login_events.dart';
import 'package:tartlabs_store_bloc/login/login_states.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: layout(),
      )),
    );
  }

  Widget layout() {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (
        BuildContext context,
        LoginStates state,
      ) {
        if (state is LoginFailedState) {
          print("Failed");
        }

        if (state is LoginLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: <Widget>[
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Image.asset('assets/images/group_4.png'),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 41.0),
              child: Text(
                "Email",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(
              isSecure: false,
              icon: Icons.mail_outline,
              textController: _usernameController,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 41.0),
              child: Text(
                "Password",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(
              icon: Icons.vpn_key,
              isSecure: true,
              textController: _passwordController,
            ),
            SizedBox(height: 50),
            PrimaryButton(
              onPressed: onLoginButtonPressed,
              text: "Sign In",
            ),
          ],
        );
      },
    );
  }

  onLoginButtonPressed() {
    _loginBloc.add(LoginButtonPressedEvent(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
}
