import 'package:tartlabs_store_bloc/utils/basic_equatable.dart';

class AuthenticationEvents extends BaseEquatable {}

class AppStartedEvent extends AuthenticationEvents {}

class AuthenticationUnInitialEvent extends AuthenticationEvents {
  @override
  String toString() {
    return "AuthenticationInitialEvent";
  }
}

class AuthenticationLoggedInEvent extends AuthenticationEvents {
  @override
  String toString() {
    return "AuthenticationLoggedInEvent";
  }
}

class AuthenticationLoggedOutEvent extends AuthenticationEvents {
  @override
  String toString() {
    return "AuthenticationLoggedOutEvent";
  }
}
