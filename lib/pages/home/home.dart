import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}
