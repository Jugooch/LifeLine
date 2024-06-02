import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeline/pages/home/home.dart';
import 'package:lifeline/pages/profile/profile.dart';
import 'package:lifeline/pages/trips/trip.dart';
import 'package:lifeline/services/trips_service.dart';


class CustomTabScaffold extends StatelessWidget {
  const CustomTabScaffold({super.key});

@override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add Trip',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    ), 
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Home();
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Trip(mode: "add", trip: TripModel());
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Profile();
              },
            );
          default:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Center(
                  child: Text('Unknown tab'),
                );
              },
            );
        }
      },
    );
  }
}
