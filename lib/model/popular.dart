class PopularCategory {
  final String category;
  final String id;

  PopularCategory({this.category = '', this.id = ''});
}

class Product {

  final String title;
  final double star;
  final int sold;
  final double price;
  final String image;
  final String id;
  final String productDescription;
   List moreProductImages = [];

  Product({required this.title,
    required this.star,
    required this.sold,
    required this.price,
    required this.image,
    required this.id,
    required this.productDescription,
    required this.moreProductImages,
  });

}

final homePopularCategories = [
  PopularCategory(category: 'Machine Parts', id: '1'),
  PopularCategory(category: 'Motor Parts', id: '2'),
  PopularCategory(category: 'Keke', id: '3'),
  // PopularCategory(category: 'Table', id: '4'),
  // PopularCategory(category: 'Lamp', id: '5'),
  // PopularCategory(category: 'Cupboard', id: '6'),
  // PopularCategory(category: 'Vase', id: '7'),
  // PopularCategory(category: 'Others', id: '8'),
];

 List<Product> homePopularProducts = [
  Product(
    title: 'Qlink',
    star: 4.5,
    sold: 8374,
    price: 32000.00,
    image: 'assets/icons/products/1bike.png',
    id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
  Product(
    title: 'Yamaha',
    star: 4.7,
    sold: 7483,
    price: 24500.40,
    image: 'assets/icons/products/2bike.png', id: '1',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: [
      'assets/icons/products/2bike.png', 'assets/icons/products/4bike.png','assets/icons/products/3bike.png'
    ],
  ),
  Product(
    title: 'Club',
    star: 4.3,
    sold: 6937,
    price: 44000.00,
    image: 'assets/icons/products/4bike.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
  Product(
    title: 'Today',
    star: 4.9,
    sold: 8174,
    price: 25000.00,
    image: 'assets/icons/products/3bike.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
  Product(
    title: 'Ogbuawa',
    star: 4.6,
    sold: 6843,
    price: 56900.00,
    image: 'assets/icons/products/1bike.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),
  Product(
    title: 'Innoson',
    star: 4.5,
    sold: 7758,
    price: 55900.00,
    image: 'assets/icons/products/4bike.png', id: '1',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
  ),

   Product(
     title: 'Innoson',
     star: 4.5,
     sold: 7758,
     price: 75900.00,
     image: 'assets/icons/products/4bike.png', id: '1',
     productDescription: 'Qlink Motocycle is the high grade this',
     moreProductImages: [],
   ),

   Product(
     title: 'Innoson',
     star: 4.5,
     sold: 7758,
     price: 55900.00,
     image: 'assets/icons/products/2bike.png', id: '1',
     productDescription: 'Qlink Motocycle is the high grade this',
     moreProductImages: [],
   ),

   Product(
     title: 'Innoson',
     star: 4.5,
     sold: 7758,
     price: 95900.00,
     image: 'assets/icons/products/4bike.png', id: '1',
     productDescription: 'Qlink Motocycle is the high grade this',
     moreProductImages: [],
   ),

   Product(
     title: 'Innoson',
     star: 4.5,
     sold: 7758,
     price: 15900.00,
     image: 'assets/icons/products/2bike.png', id: '1',
     productDescription: 'Qlink Motocycle is the high grade this',
     moreProductImages: [],
   ),

   Product(
     title: 'Innoson',
     star: 4.5,
     sold: 7758,
     price: 15900.00,
     image: 'assets/icons/products/4bike.png', id: '1',
     productDescription: 'Qlink Motocycle is the high grade this',
     moreProductImages: [],
   ),

   Product(
     title: 'Innoson',
     star: 4.5,
     sold: 7758,
     price: 15900.00,
     image: 'assets/icons/products/4bike.png', id: '1',
     productDescription: 'Qlink Motocycle is the high grade this',
     moreProductImages: [],
   ),
];


