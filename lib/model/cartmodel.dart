class CartModel {
  final String id;
  final String name;
  final String image;
  final String model;
  final double price;
  final int quantity;

  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.model,
    required this.price,
    required this.quantity,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      model: map['model'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'model': model,
      'price': price,
      'quantity': quantity,
    };
  }
}
