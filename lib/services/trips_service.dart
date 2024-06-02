class TripModel {
  final String? imageUrl;
  final String? title;
  final DateTime? date;
  final DateTime? ideal_time;
  final DateTime? probable_time;
  final DateTime? panic_time;
  final List<String>? destinations;

  // Constructor with named optional parameters
  TripModel({
    this.imageUrl,
    this.title,
    this.date,
    this.ideal_time,
    this.probable_time,
    this.panic_time,
    this.destinations,
  });

  @override
  String toString() {
    return 'TripModel(title: $title, date: $date, ideal_time: $ideal_time, probable_time: $probable_time, panic_time: $panic_time, destinations: $destinations, imageUrl: $imageUrl)';
  }
}