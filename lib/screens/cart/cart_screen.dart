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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/button.dart';
import '../../controller/bike_cart_controller.dart';
import '../../model/cartmodel.dart';
import '../../model/popular.dart';
import '../../size_config.dart';

class CartScreen extends StatefulWidget {

  CartScreen({Key? key,}) : super(key: key);
  static String route() => '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController  = Get.put(BikeCartController());

  final BikeCartController controller = Get.find();

  var cartTotal = 0;

  CartModel cartModel = CartModel();


  @override
  void initState() {
    super.initState();
    // checkCartTotal();
  }


  void checkCartTotal() {
    var _cartTotal = cartModel.cartTotal;
    if(_cartTotal != 0 ) {
      cartTotal = _cartTotal;
    }
    else {
      cartTotal = 0000;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('Cart',
          style: TextStyle(
            color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold),),
      ),
      floatingActionButton:  Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(10),
              //       height: getProportionateScreenWidth(40),
              //       width: getProportionateScreenWidth(40),
              //       decoration: BoxDecoration(
              //         color: Color(0xFFF5F6F9),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Icon(
              //         Icons.arrow_forward_ios,
              //         size: 12,
              //         color: Colors.black,
              //       ),
              //     ),
              //     Spacer(),
              //     Text("Add voucher code"),
              //     const SizedBox(width: 10),
              //     Icon(
              //       Icons.arrow_forward_ios,
              //       size: 12,
              //       color: Colors.black,
              //     )
              //   ],
              // ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: controller.total,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Check Out",
                      press: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: Obx(() {
        return ListView.builder(
          itemCount: cartController.products.length,
          itemBuilder: (context, index) {
            return CartScreenCard(
              controller: cartController,
              index: index,
              product: cartController.products.keys.toList()[index],
              quantity: cartController.products.values.toList()[index],
            );
          },
        );

      }
      ),

    );
  }
}
class CartScreenCard extends StatefulWidget {
  final BikeCartController controller;
  final Product product;
  final int index;
  final int quantity;
  CartScreenCard({
    Key? key,
    required this.controller,
    required this.index,
    required this.product,
    required this.quantity}) : super(key: key);

  @override
  State<CartScreenCard> createState() => _CartScreenCardState();
}

class _CartScreenCardState extends State<CartScreenCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
              ),
              child: Image.asset(widget.product.image),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.product.title,
                style: TextStyle(fontSize: 20),),
              Text('Quantity: ${widget.quantity}',
                style: TextStyle(fontSize: 20),),
              Text('Price: \$${widget.product.price}',
                style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  widget.controller.removeProductFromCart(widget.product);

                },
                icon: Icon(Icons.remove_circle),
              ),
              Text('${widget.quantity}'),
              IconButton(
                onPressed: () {
                  widget.controller.addProductToCart(widget.product);
                },
                icon: Icon(Icons.add_circle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

