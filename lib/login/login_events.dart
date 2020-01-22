import 'package:flutter/material.dart';
import 'package:tartlabs_store_bloc/utils/basic_equatable.dart';

class LoginEvents extends BaseEquatable {}

class LoginButtonPressedEvent extends LoginEvents {
   final String username;
  final String password;

  LoginButtonPressedEvent({
    @required this.username,
    @required this.password,
  });

}

