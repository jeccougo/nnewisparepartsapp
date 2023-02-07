class PopularCategory {
  final String category;
  final String id;

  PopularCategory({this.category = '', this.id = ''});
}

class KekeModel {

  final String title;
  final double star;
  final int sold;
  final double price;
  final String image;
  final String id;
  final String productDescription;
  List moreProductImages = [];

  KekeModel({required this.title,
    required this.star,
    required this.sold,
    required this.price,
    required this.image,
    required this.id,
    required this.productDescription,
    required this.moreProductImages,
  });
}

List<KekeModel> kekeProducts = [
  KekeModel(
    title: 'Qlink',
    star: 4.5,
    sold: 8374,
    price: 32000.00,
    image: 'assets/icons/products/Keke.png',
    id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
  KekeModel(
    title: 'Suzuki',
    star: 4.7,
    sold: 7483,
    price: 24500.40,
    image: 'assets/icons/products/keke2.png', id: '1',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: [
      'assets/icons/products/2bike.png', 'assets/icons/products/4bike.png','assets/icons/products/3bike.png'
    ],
  ),
  KekeModel(
    title: 'Club',
    star: 4.3,
    sold: 6937,
    price: 44000.00,
    image: 'assets/icons/products/Keke3.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
  KekeModel(
    title: 'Today',
    star: 4.9,
    sold: 8174,
    price: 25000.00,
    image: 'assets/icons/products/Keke4.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
  KekeModel(
    title: 'Tvs',
    star: 4.6,
    sold: 6843,
    price: 56900.00,
    image: 'assets/icons/products/Keke5.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
  KekeModel(
    title: 'Ivm',
    star: 4.5,
    sold: 7758,
    price: 55900.00,
    image: 'assets/icons/products/Keke3.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),

  KekeModel(
    title: 'Ikea',
    star: 4.5,
    sold: 7758,
    price: 75900.00,
    image: 'assets/icons/products/Keke3.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),

  KekeModel(
    title: 'Inno',
    star: 4.5,
    sold: 7758,
    price: 55900.00,
    image: 'assets/icons/products/Keke4.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),

  KekeModel(
    title: 'Son',
    star: 4.5,
    sold: 7758,
    price: 95900.00,
    image: 'assets/icons/products/Keke.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),

  KekeModel(
    title: 'Kotec',
    star: 4.5,
    sold: 7758,
    price: 15900.00,
    image: 'assets/icons/products/Keke3.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),

  KekeModel(
    title: 'Innoson',
    star: 4.5,
    sold: 7758,
    price: 15900.00,
    image: 'assets/icons/products/Keke.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),

  KekeModel(
    title: 'Innoson',
    star: 4.5,
    sold: 7758,
    price: 15900.00,
    image: 'assets/icons/products/Keke3.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
];


