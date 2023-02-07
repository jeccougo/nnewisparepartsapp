
class CartModel {
  var cartTotal;

  CartModel({
    this.cartTotal,
});

  factory CartModel.fromJson(json) {
    return CartModel(
      cartTotal: json['cartTotal']
    );
  }
}


