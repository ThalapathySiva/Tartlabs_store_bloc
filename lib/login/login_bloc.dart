import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_events.dart';
import 'package:tartlabs_store_bloc/login/login_events.dart';
import 'package:tartlabs_store_bloc/login/login_states.dart';
import 'package:tartlabs_store_bloc/repositories/login_repository.dart';

import '../utils/preference_helper.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc(this.authenticationBloc);

  @override
  LoginStates get initialState => LoginInitialState();

  @override
  Stream<LoginStates> mapEventToState(LoginEvents event) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginLoadingState();
      try {
        final token = await LoginRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        if (token != null) {
          await PreferenceHelper.saveToken(token);
          authenticationBloc.add(AuthenticationLoggedInEvent());
        } else {
          yield LoginFailedState("Failed");
        }
      } catch (error) {
        yield LoginFailedState(error.toString());
      }
    }
  }
}
