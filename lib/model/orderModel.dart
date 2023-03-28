import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? orderNumber;
  String? userId;
  String? customerName;
  String? customerPhone;
  String? deliveryAddress;
  int? numberOfItems;
  Timestamp? dateOfOrder;
  String? statusOfOrder;
  int? totalForOrder;

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
      dateOfOrder: map['dateOfOrder'],
      statusOfOrder: map['statusOfOrder'] ?? '',
      //totalForOrder: int.parse(map['totalForOrder'] ?? 0),
    );
  }

  ///converts the Timestamp in each session to a DateTime Object
  DateTime? get dateTime => dateOfOrder!.toDate();
}
