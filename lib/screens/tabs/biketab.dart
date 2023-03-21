// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:nnewi_spare_parts_market/model/popular.dart';
//
// import '../../controller/bike_cart_controller.dart';
// import '../../model/cartmodel.dart';
// import '../../model/popular.dart';
// import '../detail/details_screen.dart';
//
//
// class BikeTab extends StatefulWidget {
//   final List<Bike> bikes;
//
//   BikeTab({Key? key, required this.bikes}) : super(key: key);
//
//   @override
//   State<BikeTab> createState() => _BikeTabState();
// }
//
// class _BikeTabState extends State<BikeTab> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//       child: GridView.builder(
//         itemCount: bikes.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 0,
//           crossAxisSpacing: 0,
//           childAspectRatio: 1 / 1.3,
//         ),
//         itemBuilder: (context, int index) => Padding(
//           padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
//           child: BikeCard(
//             bikes: widget.bikes[index],
//             index: index,
//             quantity: widget.bikes.length,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BikeCard extends StatelessWidget {
//   final cartController = Get.put(BikeCartController());
//
//   BikeCard({
//     super.key,
//     required this.index,
//     required this.quantity, required this.bikes,
//   });
//
//   final Product bikes;
//   final double borderRadius = 12;
//   final int index;
//   final int quantity;
//
//   CartModel cartModel = CartModel();
//
//   @override
//   Widget build(BuildContext context) {
//     const borderRadius = BorderRadius.all(Radius.circular(20));
//     return InkWell(
//       borderRadius: borderRadius,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           InkWell(
//             child: GestureDetector(
//               onTap: () {
//                 Get.to(() => ShopDetailScreen(
//                   product: bikes,
//                   controller: cartController,
//                   index: index,
//                   quantity: quantity,
//                 ),
//                     duration: Duration(milliseconds: 500),
//                     transition: Transition.downToUp);
//               },
//               child: Container(
//                   height: 150,
//                   width: 500,
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Image.asset(
//                     bikes.image,
//                     fit: BoxFit.contain,
//                   )),
//             ),
//           ),
//           Container(
//             height: 80,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//             ),
//
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 10),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       bikes.name,
//                       style: const TextStyle(
//                         color: Color(0xFF212121),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         cartController.addProductToCart(bikes[index]);
//
//                       },
//                       child: Container(
//                         height: 30,
//                         width: 30,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(6)),
//                           color: Colors.black,
//                         ),
//                         child: const Icon(
//                           Icons.add,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//
//                 const SizedBox(height: 5),
//                 Text(
//                 '\N${bikes.price}',
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
//                 )
//               ],
//             ),
//           ),
//
//
//
//         ],
//       ),
//     );
//
//   }
// }
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:nnewi_spare_parts_market/model/popular.dart';
// //
// // import '../../model/kekemodel.dart';
// // import '../detail/details_screen.dart';
// // import '../detail/keke_detail_screen.dart';
// //
// //
// // class KekeTab extends StatefulWidget {
// //   const KekeTab({Key? key}) : super(key: key);
// //
// //   @override
// //   State<KekeTab> createState() => _KekeTabState();
// // }
// //
// // class _KekeTabState extends State<KekeTab> {
// //   final kekemodel = kekeProducts;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GridView.builder(
// //         itemCount: kekemodel.length,
// //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           crossAxisSpacing: 15,
// //           childAspectRatio: 1 / 1.3,
// //         ),
// //         itemBuilder: (context, index) => Padding(
// //           padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
// //           child: BikeCard(
// //             kekemodels: kekemodel[index],
// //           ),
// //         ));
// //     // return GridView.builder(
// //     //     itemCount: products.length,
// //     //
// //     //     padding: const EdgeInsets.all(12),
// //     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //     //       crossAxisCount: 2,
// //     //       childAspectRatio: 1 / 1.5,),
// //     //        itemBuilder: (context, index) => BikeCard(
// //     //          product: products[index],
// //     //          press: () => Navigator.pushNamed(context, ShopDetailScreen.route(), arguments: products),),);
// //   }
// // }
// //
// //
// //
// //
// // class BikeCard extends StatelessWidget {
// //   const BikeCard({
// //     super.key,
// //      required this.kekemodels,
// //
// //   });
// //
// //   final KekeModel kekemodels;
// //   final double borderRadius = 12;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     const borderRadius = BorderRadius.all(Radius.circular(20));
// //     return Padding(
// //       padding: const EdgeInsets.all(5),
// //       child: InkWell(
// //         borderRadius: borderRadius,
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Container(
// //             //   decoration: const BoxDecoration(
// //             //     borderRadius: borderRadius,
// //             //     color: Colors.redAccent,
// //             //   ),
// //             //   // child: Stack(
// //             //   //   children: [
// //             //   //     Icon(Icons.abc),
// //             //   //     Positioned(
// //             //   //       top: 16,
// //             //   //       right: 16,
// //             //   //       child: Image.asset('assets/icons/not_collected@2x.png', width: 28, height: 28),
// //             //   //     ),
// //             //   //   ],
// //             //   // ),
// //             // ),
// //             //const SizedBox(height: 12),
// //
// //             InkWell(
// //
// //               child: GestureDetector(
// //                 onTap: () => Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => KekeDetailScreen(
// //                         kekemodels: kekemodels,
// //                       ),
// //                     )),
// //
// //                 child: Container(
// //                     height: 150,
// //                     width: 200,
// //                     decoration: BoxDecoration(
// //                         color: Colors.grey.shade100,
// //                         borderRadius: BorderRadius.circular(12)
// //                     ),
// //                     child: Image.asset(kekemodels.image,
// //                       fit: BoxFit.contain,
// //                     )),
// //               ),
// //             ),
// //             Container(
// //               height: 80,
// //               decoration: const BoxDecoration(
// //                 color: Colors.white,
// //               ),
// //
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const SizedBox(height: 10),
// //
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(
// //                         kekemodels.title,
// //                         style: const TextStyle(
// //                           color: Color(0xFF212121),
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 18,
// //                         ),
// //                       ),
// //                       Column(
// //                         children: [
// //                           Container(
// //                             height: 30,
// //                             width: 30,
// //                             decoration: const BoxDecoration(
// //                               borderRadius: BorderRadius.all(Radius.circular(6)),
// //                               color: Colors.black,
// //                             ),
// //                             child: const Icon(
// //                               Icons.add,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 5),
// //                   // Row(
// //                   //   children: const [
// //                   //
// //                   //     //Image.asset('assets/icons/start@2x.png', width: 20, height: 20),
// //                   //
// //                   //     // SizedBox(width: 8),
// //                   //     // // const Text(
// //                   //     // //   '|',
// //                   //     // //   style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF616161), fontSize: 14),
// //                   //     // // ),
// //                   //     // SizedBox(width: 8),
// //                   //     // Container(
// //                   //     //   decoration: BoxDecoration(
// //                   //     //     borderRadius: const BorderRadius.all(Radius.circular(6)),
// //                   //     //     color: const Color(0xFF101010).withOpacity(0.08),
// //                   //     //   ),
// //                   //     //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
// //                   //     //   child: const Text(
// //                   //     //     'sold',
// //                   //     //     style: TextStyle(
// //                   //     //       color: Color(0xFF35383F),
// //                   //     //       fontWeight: FontWeight.w500,
// //                   //     //       fontSize: 10,
// //                   //     //     ),
// //                   //     //   ),
// //                   //     // ),
// //                   //   ],
// //                   // ),
// //                   const SizedBox(height: 5),
// //                   Text(
// //                     '\N${kekemodels.price}',
// //                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
// //                   )
// //                 ],
// //               ),
// //             ),
// //
// //
// //
// //           ],
// //         ),
// //       ),
// //     );
// //
// //     //         // donut picture
// //     //         Padding(
// //     //           padding:
// //     //           const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
// //     //           child: Image.asset(imageName),
// //     //         ),
// //     //
// //     //         // donut flavor
// //     //         Text(
// //     //           donutFlavor,
// //     //           style: TextStyle(
// //     //             fontWeight: FontWeight.bold,
// //     //             fontSize: 16,
// //     //           ),
// //     //         ),
// //     //         const SizedBox(height: 4),
// //     //         Text(
// //     //           'Dunkins',
// //     //           style: TextStyle(color: Colors.grey[600]),
// //     //         ),
// //     //
// //     //         // love icon + add button
// //     //         Padding(
// //     //           padding: const EdgeInsets.all(12.0),
// //     //           child: Row(
// //     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //     //             children: [
// //     //               // love icon
// //     //               Icon(
// //     //                 Icons.favorite,
// //     //                 color: Colors.pink[400],
// //     //               ),
// //     //
// //     //               // plus button
// //     //               Container(
// //     //                 height: 30,
// //     //                 width: 30,
// //     //                 decoration: BoxDecoration(
// //     //                     color: donutColor[800],
// //     //                     borderRadius: BorderRadius.circular(5)
// //     //                 ),
// //     //                 child: Icon(
// //     //                   Icons.add,
// //     //                   color: Colors.white,
// //     //                 ),
// //     //               ),
// //     //             ],
// //     //           ),
// //     //         )
// //     //       ],
// //     //     ),
// //     //   ),
// //     // );
// //   }
// // }
// //
// //
// //



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/cart_controller.dart';

import '../../model/product.dart';
import '../detail/details_screen.dart';
import '../utils/likeicon.dart';
import '../utils/starrating.dart';


class BikeTab extends StatefulWidget {
  final List<Bike> bikes;
  const BikeTab({super.key, required this.bikes});


  @override
  State<BikeTab> createState() => _BikeTabState();
}

class _BikeTabState extends State<BikeTab> {
  late final datas = bikes;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // appBar: FRAppBar.defaultAppBar(
      //   context,
      //   title: 'Most Popular',
      //   actions: [
      //     IconButton(
      //       icon: Image.asset('assets/icons/search@2x.png', scale: 2.0),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
        slivers: [
        // SliverPadding(
        //   padding: padding,
        //   sliver: SliverList(
        //     delegate: SliverChildBuilderDelegate(
        //       ((context, index) => const MostPupularCategory()),
        //       childCount: 1,
        //     ),
        //   ),
        // ),
        SliverPadding(
          padding: padding,
          sliver: _buildPopulars(),
        ),
        const SliverAppBar(flexibleSpace: SizedBox(height: 24))
      ]),
    );
  }

  Widget _buildPopulars() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15,
          mainAxisExtent: 250),
      delegate: SliverChildBuilderDelegate(_buildPopularItem, childCount: widget.bikes.length),
    );
  }

  Widget _buildPopularItem(BuildContext context, int index) {
    return BikeProductCard(
      bikes: widget.bikes[index],
      index: index,
      quantity: widget.bikes.length,
    );
  }
}



typedef BikeProductCardOnTaped = void Function(Product bikes);

class BikeProductCard extends StatelessWidget {
  final cartController = Get.put(BikeCartController());

  BikeProductCard({super.key,this.ontap, required this.bikes, required this.index, required this.quantity});

  final Bike bikes;
  final int index;
  final BikeProductCardOnTaped? ontap;
  final int quantity;




  @override
  Widget build(BuildContext context) {
    // final data = datas[index % datas.length];
    const borderRadius = BorderRadius.all(Radius.circular(20));
    return InkWell(
      borderRadius: borderRadius,
      onTap: () => ontap?.call(bikes),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: borderRadius,
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(() => ShopDetailScreen(
                          product: bikes,
                          controller: cartController,
                          index: index,),

                          duration: Duration(milliseconds: 500),
                          transition: Transition.downToUp);
                    },
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          bikes.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                // Positioned(
                //   top: 5,
                //   right: 5,
                //   child: LikeButton(),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              FittedBox(
                child: Text(
                  bikes.name,
                  style: const TextStyle(
                    color: Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              _buildSoldPoint(4.5, 6937),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\N${bikes.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Color(0xFF212121)),
              ),

            ],
          ),


        ],
      ),
    );
  }

  Widget _buildSoldPoint(double star, int sold) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
    final product = bikes[index];
    if (product != null) {
    cartController.addProductToCart(product);
    }
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
    );
  }
}








