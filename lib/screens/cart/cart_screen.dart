// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class CartScreen extends StatelessWidget {
//
//   const CartScreen({super.key});
//
//   static String route() => '/cart';
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: IconThemeData(
//           color: Colors.grey[800],
//         ),
//       ),
//       body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Let's order fresh items for you
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Text(
//                   "My Cart",
//                   style: GoogleFonts.notoSerif(
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//
//               // list view of cart
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: ListView.builder(
//                     itemCount: 10,
//                     padding: EdgeInsets.all(12),
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(8)),
//                           child: ListTile(
//                             leading: Image.asset(
//                               'ytyt',
//                               // value.cartItems[index][2],
//                               height: 36,
//                             ),
//                             title: Text(
//                               'ytyt',
//                               // value.cartItems[index][0],
//                               style: const TextStyle(fontSize: 18),
//                             ),
//                             subtitle: Text(
//                               'ytyt',
//                               // '\$' + value.cartItems[index][1],
//                               style: const TextStyle(fontSize: 12),
//                             ),
//                             trailing: IconButton(
//                               icon: const Icon(Icons.cancel),
//                               onPressed: (){}
//                                   // Provider.of<CartModel>(context, listen: false)
//                                   //     .removeItemFromCart(index),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//
//               // total amount + pay now
//
//               Padding(
//                 padding: const EdgeInsets.all(36.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.green,
//                   ),
//                   padding: const EdgeInsets.all(24),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Total Price',
//                             style: TextStyle(color: Colors.green[200]),
//                           ),
//
//                           const SizedBox(height: 8),
//                           // total price
//                           Text(
//                             'ytyt',
//                             // '\$${value.calculateTotal()}',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       // pay now
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.green.shade200),
//                           borderRadius: BorderRadius.circular(28),
//                         ),
//                         padding: const EdgeInsets.all(12),
//                         child: Row(
//                           children: const [
//                             Text(
//                               'Pay Now',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios,
//                               size: 16,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//
//       );
//
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/button.dart';
import '../../controller/cart_controller.dart';
import '../../model/product.dart';

import '../../size_config.dart';
import '../login/login.dart';
import '../utils/checkoutfinal.dart';

class CartScreen extends StatefulWidget {

  CartScreen({Key? key,}) : super(key: key);
  final BikeCartController cartController = Get.find<BikeCartController>();


  static String route() => '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController  = Get.put(BikeCartController());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  late String _orderNumber;

  final BikeCartController controller = Get.find();

  var cartTotal = 0;
  bool isCartEmpty = true;



  @override
  void initState() {
    super.initState();
  }

  Future<void> disposeCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cartItems');
    await cartController.clearCart;
  }

  Future showConfirmationDialog() async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Order"),
          content: Text("Are you sure you want to place this order?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: Text("Confirm"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }


  Future<void> addCartToFirestore() async {
    final CollectionReference cartsCollection =
    FirebaseFirestore.instance.collection('carts');
    final currentUser = FirebaseAuth.instance.currentUser;
    final products = widget.cartController.products;
    //final numberOfItems = widget.cartController.products.lenght;


    // Generate a unique order number
    final orderNumber = '${Timestamp.now().millisecondsSinceEpoch}-${currentUser?.uid}';

    // Save the order number to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('orderNumber', orderNumber);
    _orderNumber = orderNumber;

    // Convert each Bike object to a map
    final productsAsMaps =
    products.entries.map((entry) => entry.key.toMap()).toList();

    final int quantityOfItems = products.length;

    try {
      await cartsCollection.doc(orderNumber).set({
        'orderNumber': orderNumber,
        'userId': currentUser?.uid,
        'dateOfOrder': FieldValue.serverTimestamp(),
        'items': products.entries
            .map((entry) => {'product': entry.key.toMap(), 'quantity': entry.value})
            .toList(),
        'numberOfItems': quantityOfItems,
        'totalForOrder': widget.cartController.total,
        'statusOfOrder': 'pending',
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }





  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // Check if the cart is empty
    if (cartController.products.isEmpty) {
      isCartEmpty = true;
    } else {
      isCartEmpty = false;
    }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: const [

            Text('Cart',
              style: TextStyle(
                color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),),
          ],
        ),
      ),

      body: SizedBox(
        height: getProportionateScreenHeight(620),
        child: Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cartController.products.length,
            itemBuilder: (context, index) {
              return CartScreenCard(
                controller: cartController,
                index: index,
                product: cartController.products.keys.toList()[index],
                quantity: cartController.products.values.toList()[index],
                model: '',
                type: '',

              );
            },
          );

        }
        ),
      ),

      floatingActionButton:  Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(5),
          horizontal: getProportionateScreenWidth(30),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: getProportionateScreenHeight(5)),

            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: widget.cartController.total.toString(),
                          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),

                  ),

                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Check Out",
                      press: cartController.products.isEmpty
                          ? null
                          : () async {
                        if (currentUser == null) {
                          Get.to(() => LoginPage());
                        } else {
                          bool confirmed = await showConfirmationDialog();
                          if (confirmed) {
                            await addCartToFirestore();
                            cartController.clearCart();
                            Get.to(() => CheckoutForm(orderNumber: _orderNumber));
                          }
                        }
                      },
                      disabled: cartController.products.isEmpty,
                    ),
                  ),

                ],
            ),
              );
            }
            ),
          ],
        ),
      ),

    );
  }
}
class CartScreenCard extends StatefulWidget {
  final BikeCartController controller;
  final Product product;
  final String model;
  final String type;
  final int index;
  final int quantity;
  const CartScreenCard({
    Key? key,
    required this.controller,
    required this.index,
    required this.product,
    required this.quantity, required this.model, required this.type,}) : super(key: key);

  @override
  State<CartScreenCard> createState() => _CartScreenCardState();
}

class _CartScreenCardState extends State<CartScreenCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset(widget.product.image),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name,
                  style: TextStyle(fontSize: 18),),
                Text('Quantity: ${widget.quantity}',
                  style: TextStyle(fontSize: 14),),
                Text('Price: \N${widget.product.price.toString()}',
                  style: TextStyle(fontSize: 14),),
                SizedBox(height: 10,),

              ],
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.controller.removeProductFromCart(widget.product);

                    },
                    icon: Icon(Icons.remove_circle),
                  ),
                 Text('${widget.quantity}',),
                  IconButton(
                    onPressed: () {
                      widget.controller.addProductToCart(widget.product);
                    },
                    icon: Icon(Icons.add_circle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

