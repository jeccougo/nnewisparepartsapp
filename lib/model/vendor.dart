class Vendor {
  final String id;
  final String name;
  final String description;
  final String vendorImage;
  final List<Product> products;

  Vendor({
    required this.id,
    required this.name,
    required this.description,
    required this.vendorImage,
    required this.products,
  });
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
  List<Vendor> product = [
  Vendor(
    id: '1',
    name: 'Innoson Group',
    description: 'A leading supplier of Automobiles parts.',
    vendorImage: 'assets/icons/products/innoson.jpg',
    products: [
      Product(
        id: '1',
        name: 'Widget A',
        description: 'The classic widget.',
        price: 9.99,
        image: 'assets/icons/products/benzlig.png',
      ),
      Product(
        id: '2',
        name: 'Widget B',
        description: 'The deluxe widget.',
        price: 19.99,
        image: 'assets/icons/products/2bike.png',
      ),
      Product(
        id: '3',
        name: 'Widget C',
        description: 'The deluxe widget.',
        price: 14.99,
        image: 'assets/icons/products/jet.png',
      ),
      Product(
        id: '4',
        name: 'Widget D',
        description: 'The deluxe widget.',
        price: 11.99,
        image: 'assets/icons/products/Keke.png',
      ),
    ],
  ),
  Vendor(
    id: '2',
    name: 'Globex Corp.',
    description: 'Innovative solutions for your widget needs.',
    vendorImage: 'https://example.com/globex_logo.png',
    products: [
      Product(
        id: '3',
        name: 'Widget C',
        description: 'The next-generation widget.',
        price: 29.99,
        image: 'https://example.com/widget_c.png',
      ),
      Product(
        id: '4',
        name: 'Widget D',
        description: 'The ultimate widget.',
        price: 49.99,
        image: 'https://example.com/widget_d.png',
      ),
    ],
  ),
    Vendor(
      id: '3',
      name: 'Innoson Group',
      description: 'A leading supplier of Automobiles parts.',
      vendorImage: 'assets/icons/products/innoson.jpg',
      products: [
        Product(
          id: '1',
          name: 'Widget A',
          description: 'The classic widget.',
          price: 9.99,
          image: 'assets/icons/products/benzlig.png',
        ),
        Product(
          id: '2',
          name: 'Widget B',
          description: 'The deluxe widget.',
          price: 19.99,
          image: 'assets/icons/products/2bike.png',
        ),
        Product(
          id: '3',
          name: 'Widget C',
          description: 'The deluxe widget.',
          price: 14.99,
          image: 'assets/icons/products/jet.png',
        ),
        Product(
          id: '4',
          name: 'Widget D',
          description: 'The deluxe widget.',
          price: 11.99,
          image: 'assets/icons/products/Keke.png',
        ),
      ],
    ),
    Vendor(
      id: '4',
      name: 'Gmart Group',
      description: 'A leading supplier of Automobiles parts.',
      vendorImage: 'assets/icons/products/innoson.jpg',
      products: [
        Product(
          id: '1',
          name: 'Widget A',
          description: 'The classic widget.',
          price: 9.99,
          image: 'assets/icons/products/benzlig.png',
        ),
        Product(
          id: '2',
          name: 'Widget B',
          description: 'The deluxe widget.',
          price: 19.99,
          image: 'assets/icons/products/2bike.png',
        ),
        Product(
          id: '3',
          name: 'Widget C',
          description: 'The deluxe widget.',
          price: 14.99,
          image: 'assets/icons/products/jet.png',
        ),
        Product(
          id: '4',
          name: 'Widget D',
          description: 'The deluxe widget.',
          price: 11.99,
          image: 'assets/icons/products/Keke.png',
        ),
      ],
    ),
    Vendor(
      id: '5',
      name: 'Kotec Group',
      description: 'A leading supplier of Automobiles parts.',
      vendorImage: 'assets/icons/products/kotec.jpg',
      products: [
        Product(
          id: '1',
          name: 'Widget A',
          description: 'The classic widget.',
          price: 9.99,
          image: 'assets/icons/products/benzlig.png',
        ),
        Product(
          id: '2',
          name: 'Widget B',
          description: 'The deluxe widget.',
          price: 19.99,
          image: 'assets/icons/products/2bike.png',
        ),
        Product(
          id: '3',
          name: 'Widget C',
          description: 'The deluxe widget.',
          price: 14.99,
          image: 'assets/icons/products/jet.png',
        ),
        Product(
          id: '4',
          name: 'Widget D',
          description: 'The deluxe widget.',
          price: 11.99,
          image: 'assets/icons/products/Keke.png',
        ),
      ],
    ),
];
