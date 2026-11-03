class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String description;
  final String time;
  final String age;
  final double price;
  final String imagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis, 
    required this.description,
    required this.time, 
    required this.age,
    required this.price,
    required this.imagePath, 
  });

  String get formattedPrice {
  final String formattedValue = price.toStringAsFixed(2);
  return '£$formattedValue';
  }

}