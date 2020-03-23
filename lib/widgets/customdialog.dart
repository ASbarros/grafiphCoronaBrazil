import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Show {
  static Future<void> showLoadingDialog(BuildContext context) async {
    final GlobalKey<State> key = GlobalKey<State>();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            backgroundColor: Colors.black45,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Aguarde....", style: TextStyle(color: Colors.white))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
