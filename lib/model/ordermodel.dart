class Product {
  String id;
  String name;
  String description;
  String imageUrl;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'imageUrl': imageUrl,
    'price': price,
  };
}

class CartItem {
  Product product;
  int amount;

  CartItem({required this.product, required this.amount});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() => {
    'product': product.toJson(),
    'amount': amount,
  };
}

class Order {
  String id;
  String customerId;
  List<CartItem> items;
  double totalCost;
  DateTime date;
  String status;
  String deliveryAddress;

  Order({
    required this.id,
    required this.customerId,
    required this.items,
    required this.totalCost,
    required this.date,
    required this.status,
    required this.deliveryAddress,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemJsonList = json['items'];
    List<CartItem> items =
    itemJsonList.map((itemJson) => CartItem.fromJson(itemJson)).toList();

    return Order(
      id: json['id'],
      customerId: json['customerId'],
      items: items,
      totalCost: json['totalCost'].toDouble(),
      date: DateTime.parse(json['date']),
      status: json['status'],
      deliveryAddress: json['deliveryAddress'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'customerId': customerId,
    'items': items.map((item) => item.toJson()).toList(),
    'totalCost': totalCost,
    'date': date.toIso8601String(),
    'status': status,
    'deliveryAddress': deliveryAddress,
  };
}