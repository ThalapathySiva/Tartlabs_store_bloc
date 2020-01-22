import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_events.dart';
import 'package:tartlabs_store_bloc/home/my_apps_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(
              "Tart",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("labs Store")
          ],
        ),
        backgroundColor: Color.fromRGBO(7, 69, 118, 1),
      ),
      drawer: buildDrawer(context),
      body: _setDrawerItemWidget(selectedIndex),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          SizedBox(height: 20),
          selectedIndex == 0
              ? Container(
                  color: Color.fromRGBO(228, 4, 9, 1),
                  child: _createDrawerItem(
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      icon: Icons.layers,
                      text: 'My Apps',
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                        Navigator.pop(context);
                      }),
                )
              : Container(
                  child: _createDrawerItem(
                      icon: Icons.layers,
                      text: 'My Apps',
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                        Navigator.pop(context);
                      }),
                ),
          selectedIndex == 1
              ? Container(
                  color: Color.fromRGBO(228, 4, 9, 1),
                  child: _createDrawerItem(
                      icon: Icons.exit_to_app,
                      text: 'Logout',
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Are you sure?"),
                              content: Text("You want to logout"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = 0;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                    child: Text("Yes"),
                                    onPressed: onLogOutButtonPressed),
                              ],
                            );
                          },
                        );
                      }),
                )
              : Container(
                  child: _createDrawerItem(
                      icon: Icons.exit_to_app,
                      text: 'Logout',
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Are you sure?"),
                              content: Text("You want to logout"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = 0;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                    child: Text("Yes"),
                                    onPressed: onLogOutButtonPressed),
                              ],
                            );
                          },
                        );
                      }),
                ),
        ],
      ),
    );
  }

  onLogOutButtonPressed() {
    AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    authenticationBloc.add(AuthenticationLoggedOutEvent());
  }

  Widget _createHeader() {
    return SizedBox(
      height: 250,
      child: DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/bg_1.png'))),
          child: Stack(children: <Widget>[
            Positioned(
              top: 12,
              left: 75,
              child: Container(
                height: 150,
                child: Image.asset('assets/images/group_4.png'),
              ),
            ),
            Positioned(
                bottom: 12.0,
                right: 100.0,
                child: Column(
                  children: <Widget>[
                    Text("Gowtham Raj",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
          ])),
    );
  }

  Widget _createDrawerItem(
      {IconData icon,
      Color textColor,
      Color iconColor,
      String text,
      GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: iconColor, size: 30),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  _setDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return MyAppScreen();

      default:
        return Text("Error");
    }
  }
}
