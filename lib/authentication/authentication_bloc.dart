import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_events.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  @override
  AuthenticationStates get initialState => AuthenticationUnInitialState();

  @override
  Stream<AuthenticationStates> mapEventToState(
      AuthenticationEvents event) async* {
    if (event is AppStarted) {}

    if (event is AuthenticationLoggedInEvent) {
      yield AuthenticatedState();
    }

    if (event is AuthenticationLoggedOutEvent) {
      yield UnAuthenticatedState();
    }
  }
}
