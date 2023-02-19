class OrderModel {
  final String? orderNumber;
  final String? userId;
  final String? customerName;
  final String? customerPhone;
  final String? deliveryAddress;
  final int? numberOfItems;
  final DateTime? dateOfOrder;
  final String? statusOfOrder;
  final String? totalForOrder;

  OrderModel({
    this.orderNumber,
    this.userId,
    this.customerName,
    this.customerPhone,
    this.deliveryAddress,
    this.numberOfItems,
    this.dateOfOrder,
    this.statusOfOrder,
    this.totalForOrder
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderNumber: map['orderNumber'] ?? '',
      userId: map['userId'] ?? '',
      customerName: map['customerName'] ?? '',
      customerPhone: map['customerPhone'] ?? '',
      deliveryAddress: map['deliveryAddress'] ?? '',
      numberOfItems: map['numberOfItems'] ?? 0,
      dateOfOrder: map['dateOfOrder'] != null ? DateTime.parse(map['dateOfOrder']) : null,
      statusOfOrder: map['statusOfOrder'] ?? '',
      totalForOrder: map['totalOrOrder'] ?? '',
    );
  }
}
