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
  String id;

  Product({required this.name, required this.image,
    required this.price, this.id = ''});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
      id: json['id'],
    );
  }
}

class Bike extends Product {
  int index;
  String model;
  String id;
  String type;
  String image;
  List moreProductImages = [];
  String productDescription;
  
  operator [](int index) => this.index == index ? this : null;

  Bike({this.id = '',
    required String name,
    required double price,
    required this.model,
    required this.index,

    required this.type,
    required this.image,
    required this.productDescription,
    required this.moreProductImages })
      : super(name: name, price: price, image: image, id: id);

  factory Bike.fromMap(Map<String, dynamic> map) {
    return Bike(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      image: map['image'] ?? '',
      index: map['index'] ?? 0,
      model: map['model'] ?? '',
      moreProductImages: map['moreProductImages'] ?? [],
      productDescription: map['productDescription'] ?? '',
      type: map['type'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'id': id,
    };
  }
}
List<Bike> bikes = [
  Bike(
    name: 'Akanchawa',
    price: 320000.00,
    image: 'assets/icons/products/1bike.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
    model: '02',
    type: 'met', index: 0, id: '1',
  ),
  Bike(
    name: 'Ugbo-epepe',
    price: 845000.00,
    image: 'assets/icons/products/pngwing.com (70).png',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: [
      'assets/icons/products/2bike.png', 'assets/icons/products/4bike.png','assets/icons/products/3bike.png'],
    model: '',
    type: '', index: 1, id: '2',
  ),
  Bike(
    name: 'Club',
    price: 440600.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Club Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    type: '', index: 2, id: '3',
  ),
  Bike(
    name: 'Yamaha',
    price: 258000.00,
    image: 'assets/icons/products/ladies2.png',
    productDescription: 'Today Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    type: '', index: 3, id: '4',
  ),
  Bike(
    name: 'Ladies',
    price: 569000.00,
    image: 'assets/icons/products/ladies.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 4, id: '5',
  ),
  Bike(
    name: 'Ogbuawa',
    price: 569000.00,
    image: 'assets/icons/products/1bike.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 4, id: '6',
  ),
  Bike(
    name: 'Ogbuawa',
    price: 569000.00,
    image: 'assets/icons/products/jet.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 4, id: '7',
  ),
  Bike(
      name: 'Enyi',
    price: 569000.00,
    image: 'assets/icons/products/enyi.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 4, id: '8',
  ),
  Bike(
    name: 'Kymko',
    price: 559000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 5, id: '15',
  ),

  Bike(
    name: 'jianshe',
    price: 759000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 6, id: '9',
  ),

  Bike(
    name: 'Bajaj',

    price: 579000.00,
    image: 'assets/icons/products/2bike.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 7, id: '16',
  ),

  Bike(
    name: 'Kotec',
    price: 159000.00,
    image: 'assets/icons/products/pngwing.com (69).png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 8, id: '10',
  ),

  Bike(
    name: 'Qlink',

    price: 179000.00,
    image: 'assets/icons/products/2bike.png',
    productDescription: 'Qlink is the high grade this',
    moreProductImages: [], model: '', type: '', index: 9, id: '11',
  ),

  Bike(
    name: 'Kotec',
    price: 196000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Kotec Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 10, id: '12',
  ),

  Bike(
    name: 'Innoson',
    type: 'Met',
    price: 233000.00,
    image: 'assets/icons/products/4bike.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],  model: '2012', index: 11, id: '13'
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




class Motor extends Product {
  int index;
  String model;
  String type;
  List moreProductImages;
  String image;
  String productDescription;
  operator [](int index) => this.index == index ? this : null;



  Motor({required String name,
    required double price,
    required this.model,
    required this.image,
    required this.index,

    required this.moreProductImages,
    required this.productDescription,

    required this.type })
      : super(name: name, price: price , image: image);
}
List<Motor> motors = [
  Motor(
    name: 'Gear Box',
    price: 220000.00,
    image: 'assets/icons/products/benx.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
    model: '02',
    type: 'met', index: 0,
  ),
  Motor(
    name: 'Brake Pad',
    price: 5000.00,
    image: 'assets/icons/products/benzligh.png',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: [
      'assets/icons/products/2bike.png', 'assets/icons/products/4bike.png','assets/icons/products/3bike.png'],
    model: '',
    type: '', index: 1,
  ),
  Motor(
    name: 'Engine Top',
    price: 640600.00,
    image: 'assets/icons/products/benztop.png',
    productDescription: 'Club Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    type: '', index: 2,
  ),
  Motor(
    name: 'C120 RearLight',
    price: 258000.00,
    image: 'assets/icons/products/benzre.png',
    productDescription: 'Today Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    type: '', index: 3,
  ),
  Motor(
    name: 'Ogbuawa RearLight',
    price: 69000.00,
    image: 'assets/icons/products/benzrear.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 4,
  ),
  Motor(
    name: 'Innoson RearLight',
    price: 59000.00,
    image: 'assets/icons/products/benzre.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 5,
  ),

  Motor(
    name: 'Innoson',
    price: 759000.00,
    image: 'assets/icons/products/benzsh.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 6,
  ),

  Motor(
    name: 'Innoson',
    price: 579000.00,
    image: 'assets/icons/products/benzligh.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 7,
  ),

  Motor(
    name: 'Innoson',
    price: 159000.00,
    image: 'assets/icons/products/benzlig.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 8,
  ),

  Motor(
    name: 'Innoson',

    price: 179000.00,
    image: 'assets/icons/products/benx.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 9,
  ),

  Motor(
    name: 'Kotec',
    price: 196000.00,
    image: 'assets/icons/products/benzlli.png',
    productDescription: 'Kotec Motocycle is the high grade this',
    moreProductImages: [], model: '', type: '', index: 10,
  ),

  Motor(
      name: 'Innoson',
      type: 'Met',
      price: 233000.00,
      image: 'assets/icons/products/benzr.png',
      productDescription: 'Qlink Motocycle is the high grade this',
      moreProductImages: [],  model: '2012', index: 11
  ),
];



