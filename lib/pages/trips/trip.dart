import 'package:flutter/cupertino.dart';

class Trip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Add Trip'),
      ),
      child: Center(
        child: Text('Add Trip Screen Content'),
      ),
    );
  }
}
