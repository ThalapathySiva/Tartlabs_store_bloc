import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final bool isSecure;
  final TextEditingController textController;

  const CustomTextField(
      {Key key,
      this.icon,
      this.isSecure,
      this.textController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 41.0, right: 41.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4.0,
            ),
          ], borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: TextField(
              controller: textController,
              obscureText: isSecure,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                prefixIcon: Icon(icon),
              )),
        ),
      ),
    );
  }
}
