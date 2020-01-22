import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabs_store_bloc/home/app_bloc.dart';
import 'package:tartlabs_store_bloc/home/app_detail.dart';
import 'package:tartlabs_store_bloc/home/app_states.dart';

class MyAppScreen extends StatefulWidget {
  @override
  _MyAppScreenState createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  AppListBloc appListBloc;
  @override
  void initState() {
    appListBloc = BlocProvider.of<AppListBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: layout(),
    );
  }

  Widget layout() {
    return BlocListener(
      bloc: appListBloc,
      listener: (BuildContext context, AppListStates state) {},
      child: BlocBuilder(
        bloc: appListBloc,
        builder: (BuildContext context, AppListStates state) {
          if (state is AppListLoadingState) {
            return Center(child: CupertinoActivityIndicator());
          }
          return ListView.separated(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            separatorBuilder: (context, index) => Container(height: 10),
            itemCount: appListBloc.apps.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AppDetailScreen(appList: appListBloc.apps[index])));
              },
              child: Container(
                  padding: EdgeInsets.all(16),
                  height: 99,
                  width: 340,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                        ),
                      ]),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        "${appListBloc.apps[index].appLogo}",
                        height: 67,
                        width: 67,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${appListBloc.apps[index].appName}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "${appListBloc.apps[index].createdAt}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.chevron_right,
                        color: Color.fromRGBO(223, 76, 79, 1),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
