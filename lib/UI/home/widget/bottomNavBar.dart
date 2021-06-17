import 'package:flutter/material.dart';
import 'package:tontonin/UI/home/home.dart';
import 'package:tontonin/UI/login_page.dart';
import 'package:tontonin/service/sign_in.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:<Widget>[
        Expanded(
          child: RaisedButton(
            padding: const EdgeInsets.only(
              top: 15,bottom: 15,
            ),
            onPressed: () {
              Navigator.pop(context, Tontonin());
            },
            color: Colors.white,
            textColor: Colors.black45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.home,
                ),
                Container(height: 5,width: 5),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: RaisedButton(
            padding: const EdgeInsets.only(
              top: 15,bottom: 15,
            ),
            onPressed: () {
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return LoginPage();
        }), ModalRoute.withName('/'));
            },
            color: Colors.white,
            textColor: Colors.black45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.logout,
                ),
                Container(height: 5,width: 5),
                Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
              ],
            ),
          ),
        ),
      ]
    );
  }
}