import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            new SizedBox(height: 80.0),
            Center(
              child: Text("This application create with"),
            ),
            new SizedBox(height: 10.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(size: 60),
                  Image.asset("assets/images/android_studio.png",
                      width: 90, height: 90),
                  Image.asset("assets/images/vscode.png",
                      width: 90, height: 90),
                  Image.asset("assets/images/codemagic.jpeg",
                      width: 90, height: 90),
                ],
              ),
            ),
            new SizedBox(height: 10.0),
            Center(
              child: Text("more info"),
            ),
            new SizedBox(height: 10.0),
            Center(
              child: ClipRRect(
                child: Image.asset("assets/images/danill.jpg", width: 120),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
            new SizedBox(height: 10.0),
            Center(
              child: Text("danillyudhistira@gmail.com"),
            ),
            Center(
              child: Text("+6282111780767"),
            ),
          ],
        ),
      ),
    );
  }
}
