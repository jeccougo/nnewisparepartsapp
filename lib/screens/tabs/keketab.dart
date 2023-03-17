// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:nnewi_spare_parts_market/model/popular.dart';
//
// import '../../model/kekemodel.dart';
// import '../detail/details_screen.dart';
// import '../detail/keke_detail_screen.dart';
//
//
// class KekeTab extends StatefulWidget {
//   const KekeTab({Key? key}) : super(key: key);
//
//   @override
//   State<KekeTab> createState() => _KekeTabState();
// }
//
// class _KekeTabState extends State<KekeTab> {
//   final kekemodel = kekeProducts;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: kekemodel.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 15,
//           childAspectRatio: 1 / 1.3,
//         ),
//         itemBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
//           child: BikeCard(
//             kekemodels: kekemodel[index],
//           ),
//         ));
//     // return GridView.builder(
//     //     itemCount: products.length,
//     //
//     //     padding: const EdgeInsets.all(12),
//     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     //       crossAxisCount: 2,
//     //       childAspectRatio: 1 / 1.5,),
//     //        itemBuilder: (context, index) => BikeCard(
//     //          product: products[index],
//     //          press: () => Navigator.pushNamed(context, ShopDetailScreen.route(), arguments: products),),);
//   }
// }
//
//
//
//
// class BikeCard extends StatelessWidget {
//   const BikeCard({
//     super.key,
//      required this.kekemodels,
//
//   });
//
//   final KekeModel kekemodels;
//   final double borderRadius = 12;
//
//   @override
//   Widget build(BuildContext context) {
//     const borderRadius = BorderRadius.all(Radius.circular(20));
//     return Padding(
//       padding: const EdgeInsets.all(5),
//       child: InkWell(
//         borderRadius: borderRadius,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Container(
//             //   decoration: const BoxDecoration(
//             //     borderRadius: borderRadius,
//             //     color: Colors.redAccent,
//             //   ),
//             //   // child: Stack(
//             //   //   children: [
//             //   //     Icon(Icons.abc),
//             //   //     Positioned(
//             //   //       top: 16,
//             //   //       right: 16,
//             //   //       child: Image.asset('assets/icons/not_collected@2x.png', width: 28, height: 28),
//             //   //     ),
//             //   //   ],
//             //   // ),
//             // ),
//             //const SizedBox(height: 12),
//
//             InkWell(
//
//               child: GestureDetector(
//                 onTap: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => KekeDetailScreen(
//                         kekemodels: kekemodels,
//                       ),
//                     )),
//
//                 child: Container(
//                     height: 150,
//                     width: 200,
//                     decoration: BoxDecoration(
//                         color: Colors.grey.shade100,
//                         borderRadius: BorderRadius.circular(12)
//                     ),
//                     child: Image.asset(kekemodels.image,
//                       fit: BoxFit.contain,
//                     )),
//               ),
//             ),
//             Container(
//               height: 80,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//               ),
//
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 10),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         kekemodels.title,
//                         style: const TextStyle(
//                           color: Color(0xFF212121),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Container(
//                             height: 30,
//                             width: 30,
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(6)),
//                               color: Colors.black,
//                             ),
//                             child: const Icon(
//                               Icons.add,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   // Row(
//                   //   children: const [
//                   //
//                   //     //Image.asset('assets/icons/start@2x.png', width: 20, height: 20),
//                   //
//                   //     // SizedBox(width: 8),
//                   //     // // const Text(
//                   //     // //   '|',
//                   //     // //   style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF616161), fontSize: 14),
//                   //     // // ),
//                   //     // SizedBox(width: 8),
//                   //     // Container(
//                   //     //   decoration: BoxDecoration(
//                   //     //     borderRadius: const BorderRadius.all(Radius.circular(6)),
//                   //     //     color: const Color(0xFF101010).withOpacity(0.08),
//                   //     //   ),
//                   //     //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   //     //   child: const Text(
//                   //     //     'sold',
//                   //     //     style: TextStyle(
//                   //     //       color: Color(0xFF35383F),
//                   //     //       fontWeight: FontWeight.w500,
//                   //     //       fontSize: 10,
//                   //     //     ),
//                   //     //   ),
//                   //     // ),
//                   //   ],
//                   // ),
//                   const SizedBox(height: 5),
//                   Text(
//                     '\N${kekemodels.price}',
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
//                   )
//                 ],
//               ),
//             ),
//
//
//
//           ],
//         ),
//       ),
//     );
//
//     //         // donut picture
//     //         Padding(
//     //           padding:
//     //           const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
//     //           child: Image.asset(imageName),
//     //         ),
//     //
//     //         // donut flavor
//     //         Text(
//     //           donutFlavor,
//     //           style: TextStyle(
//     //             fontWeight: FontWeight.bold,
//     //             fontSize: 16,
//     //           ),
//     //         ),
//     //         const SizedBox(height: 4),
//     //         Text(
//     //           'Dunkins',
//     //           style: TextStyle(color: Colors.grey[600]),
//     //         ),
//     //
//     //         // love icon + add button
//     //         Padding(
//     //           padding: const EdgeInsets.all(12.0),
//     //           child: Row(
//     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //             children: [
//     //               // love icon
//     //               Icon(
//     //                 Icons.favorite,
//     //                 color: Colors.pink[400],
//     //               ),
//     //
//     //               // plus button
//     //               Container(
//     //                 height: 30,
//     //                 width: 30,
//     //                 decoration: BoxDecoration(
//     //                     color: donutColor[800],
//     //                     borderRadius: BorderRadius.circular(5)
//     //                 ),
//     //                 child: Icon(
//     //                   Icons.add,
//     //                   color: Colors.white,
//     //                 ),
//     //               ),
//     //             ],
//     //           ),
//     //         )
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
//
//
//



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nnewi_spare_parts_market/screens/login/login.dart';
import '../../controller/cart_controller.dart';
import '../../model/product.dart';
import '../detail/keke_detail_screen.dart';
import '../utils/starrating.dart';


class KekeTab extends StatefulWidget {
  final List<Keke> kekes;
  const KekeTab({super.key, required this.kekes});


  @override
  State<KekeTab> createState() => _KekeTabState();
}

class _KekeTabState extends State<KekeTab> {
  late final datas = kekes;

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
          physics: BouncingScrollPhysics(),
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
      delegate: SliverChildBuilderDelegate(_buildPopularItem, childCount: widget.kekes.length),
    );
  }

  Widget _buildPopularItem(BuildContext context, int index) {
    return KekeProductCard(
      kekes: widget.kekes[index],
      index: index,
      quantity: widget.kekes.length,
    );
  }
}



typedef KekeProductCardOnTaped = void Function(Product kekes);

class KekeProductCard extends StatelessWidget {
  final cartController = Get.put(BikeCartController());

  KekeProductCard({super.key,this.ontap, required this.kekes, required this.index, required this.quantity});

  final Keke kekes;
  final int index;
  final KekeProductCardOnTaped? ontap;
  final int quantity;




  @override
  Widget build(BuildContext context) {
    // final data = datas[index % datas.length];
    const borderRadius = BorderRadius.all(Radius.circular(20));
    return InkWell(
      borderRadius: borderRadius,
      onTap: () => ontap?.call(kekes),
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
                      Get.to(() => LoginPage(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.downToUp);
                    },
                    child: Image.asset(kekes.image, width: 182, height: 182)),
                // Positioned(
                //   top: 16,
                //   right: 16,
                //   child: Image.asset('assets/icons/not_collected@2x.png', width: 28, height: 28),
                // )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              FittedBox(
                child: Text(
                  kekes.name,
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
                '\N${kekes.price.toStringAsFixed(2)}',
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
    final product = kekes[index];
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






