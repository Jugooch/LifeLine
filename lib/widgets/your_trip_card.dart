import 'package:flutter/material.dart';
import 'package:lifeline/pages/trips/trip.dart';
import 'package:lifeline/services/trips_service.dart';
import 'package:lifeline/styling.dart';

class YourTripCard extends StatelessWidget {

  final TripModel trip;

  const YourTripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Trip(mode: "Your Trip", trip: trip)));
      },
      child: Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(trip.imageUrl ?? 'https://via.placeholder.com/400'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.overlay,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  trip.title ?? "Trip Title",
                  style: AppStyles.header3
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
