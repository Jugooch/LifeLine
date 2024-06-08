import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeline/styling.dart';
import 'package:intl/intl.dart';

class Trip extends StatefulWidget {
  final mode;
  final trip;

  const Trip({super.key, required this.mode, required this.trip});

  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {
  final TextEditingController _accessCodeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Default data
  String imageUrl = '';
  String title = '';
  DateTime date = DateTime.now();
  DateTime ideal_time = DateTime.now();
  DateTime probable_time = DateTime.now();
  DateTime panic_time = DateTime.now();
  List<String> destinations = [];

  @override
  void initState() {
    super.initState();

    // Initialize with trip details or default values
    if (widget.trip.imageUrl != null) {
      imageUrl = widget.trip.imageUrl;
    }
    if (widget.trip.title != null) {
      title = widget.trip.title;
    }
    if (widget.trip.date != null) {
      date = widget.trip.date;
    }
    if (widget.trip.ideal_time != null) {
      ideal_time = widget.trip.ideal_time;
    }
    if (widget.trip.probable_time != null) {
      probable_time = widget.trip.probable_time;
    }
    if (widget.trip.panic_time != null) {
      panic_time = widget.trip.panic_time;
    }
    if (widget.trip.destinations != null) {
      destinations = widget.trip.destinations;
    }
    
      _dateController.text = DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(date); // Update the TextField with the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('LifeLine', style: AppStyles.header1),
        backgroundColor: AppColors.primary,
      ),
      //SafeArea keeps the page content from overlapping with the navbar
      child: SafeArea(
        // The GestureDetector will detect taps outside of the input fields
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          //The material widget allows us to use TextField
          child: Material(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Access Trip Section
                    Text("Planning on taking a trip soon? Fill out this form so your emergency contacts can stay informed of your itinerary!", style: AppStyles.paragraph),
                    SizedBox(height: 16),
                    Text("Trip Name", style: AppStyles.header4),
                    TextField(
                      controller: _accessCodeController..text = title,
                      decoration: InputDecoration(
                        labelText: 'Trip Name Here...',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.inputPlaceholder,
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
                    Text("Trip Date", style: AppStyles.header4),
                    // Date Picker Section
                    TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Select Date',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.inputPlaceholder,
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
                      readOnly: true, // Make the TextField read-only
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
