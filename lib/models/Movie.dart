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

factory Movie.fromJson(Map<String, dynamic> json) {
  final String id = json['id'] as String;
  final String title = json['title'] as String;
  final String synopsis = json['synopsis'] as String;
  final String description = json['description'] as String;
  final String time = json['time'] as String;
  final String age = json['age'] as String;
  final num priceNumber = json['price'] as num;
  final double price = priceNumber.toDouble();
  final String imagePath = json['imagePath'] as String;



  return Movie(
    id: id,
    title: title,
    synopsis: synopsis,
    description: description,
    time: time,
    age: age,
    price: price,
    imagePath: imagePath,
  );
}

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{
    'id': id,
    'title': title,
    'synopsis': synopsis,
    'description': description,
    'time': time,
    'age': age,
    'price': price,
    'imagePath': imagePath,
  };

  return data;
}
}

