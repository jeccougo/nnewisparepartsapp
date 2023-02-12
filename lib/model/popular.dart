class PopularCategory {
  final String category;
  final String id;

  PopularCategory({this.category = '', this.id = ''});
}



final homePopularCategories = [
  PopularCategory(category: 'Machine Parts', id: '1'),
  PopularCategory(category: 'Motor Parts', id: '2'),
  PopularCategory(category: 'Keke', id: '3'),

];



class Product {
  String name;
  double price;
  String image;

  Product({required this.name, required this.image,
    required this.price});
}

class Bike extends Product {
  int index;
  String model;
  String type;
  String image;
  List moreProductImages = [];
  String productDescription;
  
  operator [](int index) => this.index == index ? this : null;

  Bike({required String name,
    required double price,
    required this.model,
    required this.index,

    required this.type,
    required this.image,
    required this.productDescription,
    required this.moreProductImages })
      : super(name: name, price: price, image: image);
}
List<Bike> bikes = [
  Bike(
    name: 'Innoson',
    price: 320000.00,
    image: 'assets/icons/products/1bike.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
    model: '02',
    type: 'met', index: 0,
  ),
  Bike(
    name: 'Yamaha',
    price: 245000.00,
    image: 'assets/icons/products/2bike.png',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: [
      'assets/icons/products/2bike.png', 'assets/icons/products/4bike.png','assets/icons/products/3bike.png'],
    model: '',
    type: '', index: 1,
  ),
  Bike(
    name: 'Club',
    price: 440600.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Club Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    type: '', index: 2,
  ),
  Bike(
    name: 'Today',
    price: 258000.00,
    image: 'assets/icons/products/3bike.png',
    productDescription: 'Today Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    type: '', index: 3,
  ),
  Bike(
    name: 'Ogbuawa',
    price: 569000.00,
    image: 'assets/icons/products/1bike.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 4,
  ),
  Bike(
    name: 'Innoson',
    price: 559000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 5,
  ),

  Bike(
    name: 'Innoson',
    price: 759000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 6,
  ),

  Bike(
    name: 'Innoson',

    price: 579000.00,
    image: 'assets/icons/products/2bike.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 7,
  ),

  Bike(
    name: 'Innoson',
    price: 159000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 8,
  ),

  Bike(
    name: 'Innoson',

    price: 179000.00,
    image: 'assets/icons/products/2bike.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 9,
  ),

  Bike(
    name: 'Kotec',
    price: 196000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Kotec Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 10,
  ),

  Bike(
    name: 'Innoson',
    type: 'Met',
    price: 233000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],  model: '2012', index: 11
  ),
];

class Keke extends Product {
  int index;
  String model;
  String type;
  List moreProductImages;
  String image;
  String productDescription;
  operator [](int index) => this.index == index ? this : null;



  Keke({required String name,
    required double price,
    required this.model,
    required this.image,
    required this.index,

    required this.moreProductImages,
    required this.productDescription,

    required this.type })
      : super(name: name, price: price , image: image);
}
List<Keke> kekes = [
  Keke(
    name: 'Innoson',
    price: 320000.00,
    image: 'assets/icons/products/Keke.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
    model: '02',
    type: 'met', index: 0,
  ),
  Keke(
    name: 'Yamaha',
    price: 245000.00,
    image: 'assets/icons/products/Keke5.png',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: [
      'assets/icons/products/2bike.png', 'assets/icons/products/4bike.png','assets/icons/products/3bike.png'],
    model: '',
    type: '', index: 1,
  ),
  Keke(
    name: 'Club',
    price: 440600.00,
    image: 'assets/icons/products/Keke3.png',
    productDescription: 'Club Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    type: '', index: 2,
  ),
  Keke(
    name: 'Today',
    price: 258000.00,
    image: 'assets/icons/products/Keke4.png',
    productDescription: 'Today Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    type: '', index: 3,
  ),
  Keke(
    name: 'Ogbuawa',
    price: 569000.00,
    image: 'assets/icons/products/Keke5.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 4,
  ),
  Keke(
    name: 'Innoson',
    price: 559000.00,
    image: 'assets/icons/products/Keke4.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 5,
  ),

  Keke(
    name: 'Innoson',
    price: 759000.00,
    image: 'assets/icons/products/Keke4.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 6,
  ),

  Keke(
    name: 'Innoson',
    price: 579000.00,
    image: 'assets/icons/products/Keke.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 7,
  ),

  Keke(
    name: 'Innoson',
    price: 159000.00,
    image: 'assets/icons/products/Keke5.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 8,
  ),

  Keke(
    name: 'Innoson',

    price: 179000.00,
    image: 'assets/icons/products/Keke.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 9,
  ),

  Keke(
    name: 'Kotec',
    price: 196000.00,
    image: 'assets/icons/products/Keke4.png',
    productDescription: 'Kotec Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 10,
  ),

  Keke(
      name: 'Innoson',
      type: 'Met',
      price: 233000.00,
      image: 'assets/icons/products/Keke3.png',
      productDescription: 'Qlink Motocycle is the high grade this',
      moreProductImages: [],  model: '2012', index: 11
  ),
];



