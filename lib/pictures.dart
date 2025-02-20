import 'package:equatable/equatable.dart';

class Category extends Equatable {
  //final String name;
  final String image;
  final String name;

  const Category({
    //required this.name,
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [image];

  static List<Category> categories = [
    const Category(name: 'Residence', image: 'pictures/images.jpeg'),
    const Category(name: 'land', image: 'pictures/images.jpeg'),
    const Category(name: 'Hotels', image: 'pictures/images.jpeg'),
  ];
}
