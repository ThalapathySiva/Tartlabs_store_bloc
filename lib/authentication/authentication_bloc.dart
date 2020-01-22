import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_events.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_states.dart';

import '../utils/preference_helper.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  @override
  AuthenticationStates get initialState => AuthenticationUnInitialState();

  @override
  Stream<AuthenticationStates> mapEventToState(
      AuthenticationEvents event) async* {
    if (event is AppStartedEvent) {
      if (await PreferenceHelper.getToken() != null) {
        print(PreferenceHelper.getToken());
        yield AuthenticatedState();
      } else {
        yield UnAuthenticatedState();
      }
    }

    if (event is AuthenticationLoggedInEvent) {
      yield AuthenticationLoadingState();
      yield AuthenticatedState();
    }

    if (event is AuthenticationLoggedOutEvent) {
      yield AuthenticationLoadingState();
      await PreferenceHelper.clearStorage();
      yield UnAuthenticatedState();
    }
  }
}
