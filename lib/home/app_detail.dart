import 'package:flutter/material.dart';
import 'package:tartlabs_store_bloc/models/app.dart';

class AppDetailScreen extends StatefulWidget {
  final App appList;

  const AppDetailScreen({Key key, this.appList}) : super(key: key);
  @override
  _AppDetailScreenState createState() => _AppDetailScreenState();
}

class _AppDetailScreenState extends State<AppDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      appBar: AppBar(
        title: Text("${widget.appList.appName}"),
        backgroundColor: Color.fromRGBO(7, 69, 118, 1),
      ),
      body: layout(),
    );
  }

  Widget layout() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color.fromRGBO(238, 238, 238, 1),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: ListView(
          children: <Widget>[
            installAppRow(),
            SizedBox(height: 10),
            sharableRowWidget(),
            SizedBox(height: 10),
            appDescription(),
            SizedBox(height: 10),
            whatsNewWidget(),
            SizedBox(height: 10),
            olderBuildsWidget(),
          ],
        ),
      ),
    );
  }

  Widget olderBuildsWidget() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Text("View Older Builds"),
          Icon(
            Icons.chevron_right,
            color: Color.fromRGBO(223, 76, 79, 1),
          )
        ],
      ),
    );
  }

  Widget installAppRow() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Image.network(
            "${widget.appList.appLogo}",
            height: 67,
            width: 67,
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${widget.appList.appName}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "${widget.appList.createdAt}",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Expanded(child: Container()),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            color: Color.fromRGBO(223, 76, 79, 1),
            onPressed: () {},
            child: Text(
              "Install",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget sharableRowWidget() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.share,
            color: Color.fromRGBO(7, 69, 118, 1),
            size: 25,
          ),
          SizedBox(width: 20),
          Text(
            "Get sharable app link",
          )
        ],
      ),
    );
  }

  Widget appDescription() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text("${widget.appList.appDescription}"),
    );
  }

  Widget whatsNewWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.red.withOpacity(0.81),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "What's New :",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Bug fixes and a couple of UI changes",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
