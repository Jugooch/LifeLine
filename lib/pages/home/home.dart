import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeline/services/trips_service.dart';
import 'package:lifeline/widgets/your_trip_card.dart';

class Home extends StatelessWidget {
  final TextEditingController _accessCodeController = TextEditingController();

  // Example data
  String imageUrl = 'https://via.placeholder.com/400';
  String title = 'Trip to the Mountains';
  DateTime date = DateTime(2024, 6, 15);
  DateTime ideal_time = DateTime(2024, 6, 15, 8, 0);
  DateTime probable_time = DateTime(2024, 6, 15, 10, 0);
  DateTime panic_time = DateTime(2024, 6, 15, 12, 0);
  List<String> destinations = ['Base Camp', 'Mountain Peak', 'Lake View'];

  @override
  Widget build(BuildContext context) {
    //Using CupertinoPageScaffold instead a material one to allow for the navbar across the top
    //This pairs well with the bottom TabBar that persists across pages
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('LifeLine'),
      ),
      //SafeArea keeps the page content from overlapping with the navbar
      child: SafeArea(
        //The material widget allows us to use TextField
        child: Material(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Access Trip Section
                  Text("Access a Trip"),
                  SizedBox(height: 4),
                  Divider(),
                  SizedBox(height: 16),
                  Text(
                    "If you are an emergency contact and received a 6 digit code for another user’s trip, enter that here!",
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _accessCodeController,
                    decoration: InputDecoration(
                      labelText: 'Enter Code Here',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: Text("Access"),
                    ),
                  ),

                  SizedBox(height: 64),

                  // Your Trips Section
                  Text("Your Trips"),
                  SizedBox(height: 4),
                  Divider(),
                  SizedBox(height: 16),
                  YourTripCard(
                      trip: TripModel(
                          title: title,
                          date: date,
                          ideal_time: ideal_time,
                          probable_time: probable_time,
                          panic_time: panic_time,
                          destinations: destinations,
                          imageUrl: imageUrl)),
                  SizedBox(height: 16),
                  YourTripCard(
                      trip: TripModel(
                          title: title,
                          date: date,
                          ideal_time: ideal_time,
                          probable_time: probable_time,
                          panic_time: panic_time,
                          destinations: destinations,
                          imageUrl: imageUrl)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
