import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nnewi_spare_parts_market/model/popular.dart';

import '../../controller/bike_cart_controller.dart';
import '../../model/cartmodel.dart';
import '../../model/popular.dart';
import '../detail/details_screen.dart';


class BikeTab extends StatefulWidget {
  const BikeTab({Key? key}) : super(key: key);

  @override
  State<BikeTab> createState() => _BikeTabState();
}

class _BikeTabState extends State<BikeTab> {
  final products = homePopularProducts;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 1 / 1.3,
          ),
          itemBuilder: (context, int index) => Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: BikeCard(
              product: products[index],
              index: index,
            ),
          )),
    );
    // return GridView.builder(
    //     itemCount: products.length,
    //
    //     padding: const EdgeInsets.all(12),
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       childAspectRatio: 1 / 1.5,),
    //        itemBuilder: (context, index) => BikeCard(
    //          product: products[index],
    //          press: () => Navigator.pushNamed(context, ShopDetailScreen.route(), arguments: products),),);
  }
}




class BikeCard extends StatelessWidget {
  final cartController  = Get.put(BikeCartController());

   BikeCard({
    super.key,
    required this.product, required this.index,

  });

  final Product product;
  final double borderRadius = 12;
  final int index;

  CartModel cartModel = CartModel();



  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(20));
    return InkWell(
      borderRadius: borderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     borderRadius: borderRadius,
          //     color: Colors.redAccent,
          //   ),
          //   // child: Stack(
          //   //   children: [
          //   //     Icon(Icons.abc),
          //   //     Positioned(
          //   //       top: 16,
          //   //       right: 16,
          //   //       child: Image.asset('assets/icons/not_collected@2x.png', width: 28, height: 28),
          //   //     ),
          //   //   ],
          //   // ),
          // ),
          //const SizedBox(height: 12),

          InkWell(

            child: GestureDetector(
              onTap:  () {
                Get.to(() => ShopDetailScreen(
                  product: product,
                  controller: cartController,
                  // index: index,
                  // quantity: 5,

                ),
                    duration: Duration(seconds: 1),
                transition: Transition.downToUp);
              },

              child: Container(
                height: 150,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Image.asset(product.image,
                  fit: BoxFit.contain,
                  )),
            ),
          ),
          Container(
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        color: Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      children: [

                        GestureDetector(
                          onTap: () {
                            cartController.addProductToCart(homePopularProducts[index]);

                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              color: Colors.black,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Row(
                //   children: const [
                //
                //     //Image.asset('assets/icons/start@2x.png', width: 20, height: 20),
                //
                //     // SizedBox(width: 8),
                //     // // const Text(
                //     // //   '|',
                //     // //   style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF616161), fontSize: 14),
                //     // // ),
                //     // SizedBox(width: 8),
                //     // Container(
                //     //   decoration: BoxDecoration(
                //     //     borderRadius: const BorderRadius.all(Radius.circular(6)),
                //     //     color: const Color(0xFF101010).withOpacity(0.08),
                //     //   ),
                //     //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                //     //   child: const Text(
                //     //     'sold',
                //     //     style: TextStyle(
                //     //       color: Color(0xFF35383F),
                //     //       fontWeight: FontWeight.w500,
                //     //       fontSize: 10,
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),
                const SizedBox(height: 5),
                Text(
                '\N${product.price}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
                )
              ],
            ),
          ),



        ],
      ),
    );

    //         // donut picture
    //         Padding(
    //           padding:
    //           const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
    //           child: Image.asset(imageName),
    //         ),
    //
    //         // donut flavor
    //         Text(
    //           donutFlavor,
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 16,
    //           ),
    //         ),
    //         const SizedBox(height: 4),
    //         Text(
    //           'Dunkins',
    //           style: TextStyle(color: Colors.grey[600]),
    //         ),
    //
    //         // love icon + add button
    //         Padding(
    //           padding: const EdgeInsets.all(12.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               // love icon
    //               Icon(
    //                 Icons.favorite,
    //                 color: Colors.pink[400],
    //               ),
    //
    //               // plus button
    //               Container(
    //                 height: 30,
    //                 width: 30,
    //                 decoration: BoxDecoration(
    //                     color: donutColor[800],
    //                     borderRadius: BorderRadius.circular(5)
    //                 ),
    //                 child: Icon(
    //                   Icons.add,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}



