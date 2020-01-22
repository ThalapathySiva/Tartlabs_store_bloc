import 'package:tartlabs_store_bloc/utils/basic_equatable.dart';

class AuthenticationStates extends BaseEquatable {}

class AuthenticationUnInitialState extends AuthenticationStates {
  @override
  String toString() {
    return "AuthenticationUnInitialState";
  }
}

class UnAuthenticatedState extends AuthenticationStates {
  @override
  String toString() {
    return "UnAuthenticatedState";
  }
}

class AuthenticatedState extends AuthenticationStates {
  @override
  String toString() {
    return "AuthenticatedState";
  }
}

class AuthenticationLoadingState extends AuthenticationStates {
  @override
  String toString() {
    return "AuthenticationLoadingState";
  }
}
