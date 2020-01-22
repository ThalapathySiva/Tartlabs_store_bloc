import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_bloc.dart';
import 'package:tartlabs_store_bloc/home/app_events.dart';
import 'package:tartlabs_store_bloc/home/app_states.dart';
import 'package:tartlabs_store_bloc/models/app.dart';
import 'package:tartlabs_store_bloc/repositories/app_repository.dart';

class AppListBloc extends Bloc<AppListEvents, AppListStates> {
  final AuthenticationBloc authenticationBloc;

  List<App> apps = [];

  AppListBloc(this.authenticationBloc);
  @override
  AppListStates get initialState => AppListInitialState();

  @override
  Stream<AppListStates> mapEventToState(AppListEvents event) async* {
    if (event is AppListInitialEvent) {
      if (apps.isEmpty) {
        yield AppListLoadingState();
        apps.addAll(await AppListRepository.getAppList());
        yield AppListInitialState();
      } else {
        yield AppListInitialState();
      }
    }
  }
}
