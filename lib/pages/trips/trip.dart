import 'package:flutter/cupertino.dart';

class Trip extends StatelessWidget {
  final mode;
  final trip;

  const Trip({super.key, required this.mode, required this.trip});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Trip'),
      ),
      child: Center(
        child: Text('Add Trip Screen Content'),
      ),
    );
  }
}
