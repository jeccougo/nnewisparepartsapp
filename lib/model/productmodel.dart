

class ProductModel {
  int? index;
  String? name;
  String? image;
  String? model;
  String? price;
  String? productDescription;
  List moreProductImages = [];


  ProductModel({
    required this.index,
    required this.name,
    required this.image,
    required this.model,
    required double price,
    required this.productDescription,
    required this.moreProductImages });
  
}
List products = [
  ProductModel(
    name: 'Akanchawa',
    price: 320000.00,
    image: 'assets/icons/products/1ProductModel.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
    model: '02',
    index: 0,
  ),
  ProductModel(
    name: 'Ugbo-epepe',
    price: 845000.00,
    image: 'assets/icons/products/pngwing.com (70).png',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: ['assets/icons/products/2ProductModel.png', 'assets/icons/products/4ProductModel.png','assets/icons/products/3ProductModel.png'],
    model: '',
    index: 1,
  ),
  ProductModel(
    name: 'Club',
    price: 440600.00,
    image: 'assets/icons/products/4ProductModel.png',
    productDescription: 'Club Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    index: 2,
  ),
  ProductModel(
    name: 'Yamaha',
    price: 258000.00,
    image: 'assets/icons/products/ladies2.png',
    productDescription: 'Today Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
    index: 3,
  ),
  ProductModel(
    name: 'Ladies',
    price: 569000.00,
    image: 'assets/icons/products/ladies.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], 
    model: '', 
    index: 4,
  ),
  ProductModel(
    name: 'Ogbuawa',
    price: 569000.00,
    image: 'assets/icons/products/1ProductModel.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 4,
  ),
  ProductModel(
    name: 'Ogbuawa',
    price: 569000.00,
    image: 'assets/icons/products/jet.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 4,
  ),
  ProductModel(
    name: 'Enyi',
    price: 569000.00,
    image: 'assets/icons/products/enyi.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 4,
  ),
  ProductModel(
    name: 'Kymko',
    price: 559000.00,
    image: 'assets/icons/products/4ProductModel.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 5,
  ),

  ProductModel(
    name: 'jianshe',
    price: 759000.00,
    image: 'assets/icons/products/4ProductModel.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 6,
  ),

  ProductModel(
    name: 'Bajaj',

    price: 579000.00,
    image: 'assets/icons/products/2ProductModel.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 7,
  ),

  ProductModel(
    name: 'Kotec',
    price: 159000.00,
    image: 'assets/icons/products/pngwing.com (69).png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 8,
  ),

  ProductModel(
    name: 'Qlink',

    price: 179000.00,
    image: 'assets/icons/products/2ProductModel.png',
    productDescription: 'Qlink is the high grade this',
    moreProductImages: [], model: '',  index: 9,
  ),

  ProductModel(
    name: 'Kotec',
    price: 196000.00,
    image: 'assets/icons/products/4ProductModel.png',
    productDescription: 'Kotec Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 10,
  ),

  ProductModel(
      name: 'Innoson',
      price: 233000.00,
      image: 'assets/icons/products/4ProductModel.png',
      productDescription: 'Qlink Motocycle is the high grade this',
      moreProductImages: [],  model: '2012', index: 11
  ),
  ProductModel(
    name: 'Innoson',
    price: 320000.00,
    image: 'assets/icons/products/ProductModel.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
    model: '02',
     index: 0,
  ),
  ProductModel(
    name: 'Yamaha',
    price: 245000.00,
    image: 'assets/icons/products/ProductModel5.png',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: [
      'assets/icons/products/2ProductModel.png', 'assets/icons/products/4ProductModel.png','assets/icons/products/3ProductModel.png'],
    model: '',
     index: 1,
  ),
  ProductModel(
    name: 'Club',
    price: 440600.00,
    image: 'assets/icons/products/ProductModel3.png',
    productDescription: 'Club Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
     index: 2,
  ),
  ProductModel(
    name: 'Today',
    price: 258000.00,
    image: 'assets/icons/products/ProductModel4.png',
    productDescription: 'Today Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
     index: 3,
  ),
  ProductModel(
    name: 'Ogbuawa',
    price: 569000.00,
    image: 'assets/icons/products/ProductModel5.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 4,
  ),
  ProductModel(
    name: 'Innoson',
    price: 559000.00,
    image: 'assets/icons/products/ProductModel4.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 5,
  ),

  ProductModel(
    name: 'Innoson',
    price: 759000.00,
    image: 'assets/icons/products/ProductModel4.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 6,
  ),

  ProductModel(
    name: 'Innoson',
    price: 579000.00,
    image: 'assets/icons/products/ProductModel.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 7,
  ),

  ProductModel(
    name: 'Innoson',
    price: 159000.00,
    image: 'assets/icons/products/ProductModel5.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 8,
  ),

  ProductModel(
    name: 'Innoson',

    price: 179000.00,
    image: 'assets/icons/products/ProductModel.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 9,
  ),

  ProductModel(
    name: 'Kotec',
    price: 196000.00,
    image: 'assets/icons/products/ProductModel4.png',
    productDescription: 'Kotec Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 10,
  ),

  ProductModel(
      name: 'Innoson',
      
      price: 233000.00,
      image: 'assets/icons/products/ProductModel3.png',
      productDescription: 'Qlink Motocycle is the high grade this',
      moreProductImages: [],  model: '2012', index: 11
  ),

  ProductModel(
    name: 'Gear Box',
    price: 220000.00,
    image: 'assets/icons/products/benx.png',
    productDescription: 'Qlink Motocycle is the high grade this',
    moreProductImages: [],
    model: '02',
     index: 0,
  ),
  ProductModel(
    name: 'Brake Pad',
    price: 5000.00,
    image: 'assets/icons/products/benzligh.png',
    productDescription: 'yamaha Motocycle is the high grade this',
    moreProductImages: [
      'assets/icons/products/2ProductModel.png', 'assets/icons/products/4ProductModel.png','assets/icons/products/3ProductModel.png'],
    model: '',
     index: 1,
  ),
  ProductModel(
    name: 'Engine Top',
    price: 640600.00,
    image: 'assets/icons/products/benztop.png',
    productDescription: 'Club Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
     index: 2,
  ),
  ProductModel(
    name: 'C120 RearLight',
    price: 258000.00,
    image: 'assets/icons/products/benzre.png',
    productDescription: 'Today Motocycle is the high grade this',
    moreProductImages: [],
    model: '',
     index: 3,
  ),
  ProductModel(
    name: 'Ogbuawa RearLight',
    price: 69000.00,
    image: 'assets/icons/products/benzrear.png',
    productDescription: 'Ogbuawa Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 4,
  ),
  ProductModel(
    name: 'Innoson RearLight',
    price: 59000.00,
    image: 'assets/icons/products/benzre.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 5,
  ),

  ProductModel(
    name: 'Innoson',
    price: 759000.00,
    image: 'assets/icons/products/benzsh.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 6,
  ),

  ProductModel(
    name: 'Innoson',
    price: 579000.00,
    image: 'assets/icons/products/benzligh.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 7,
  ),

  ProductModel(
    name: 'Innoson',
    price: 159000.00,
    image: 'assets/icons/products/benzlig.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 8,
  ),

  ProductModel(
    name: 'Innoson',

    price: 179000.00,
    image: 'assets/icons/products/benx.png',
    productDescription: 'Innoson Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 9,
  ),

  ProductModel(
    name: 'Kotec',
    price: 196000.00,
    image: 'assets/icons/products/benzlli.png',
    productDescription: 'Kotec Motocycle is the high grade this',
    moreProductImages: [], model: '',  index: 10,
  ),

  ProductModel(
      name: 'Innoson',
      
      price: 233000.00,
      image: 'assets/icons/products/benzr.png',
      productDescription: 'Qlink Motocycle is the high grade this',
      moreProductImages: [],  model: '2012', index: 11
  ),
];











