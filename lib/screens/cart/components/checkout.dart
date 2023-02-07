// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:nnewi_spare_parts_market/model/cartmodel.dart';
//
// import '../../../components/button.dart';
// import '../../../controller/bike_cart_controller.dart';
// import '../../../size_config.dart';
//
// class CheckoutCard extends StatelessWidget {
//   final BikeCartController controller = Get.find();
//
//    CheckoutCard({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         vertical: getProportionateScreenWidth(15),
//         horizontal: getProportionateScreenWidth(30),
//       ),
//       // height: 174,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, -15),
//             blurRadius: 20,
//             color: Color(0xFFDADADA).withOpacity(0.15),
//           )
//         ],
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Row(
//             //   children: [
//             //     Container(
//             //       padding: EdgeInsets.all(10),
//             //       height: getProportionateScreenWidth(40),
//             //       width: getProportionateScreenWidth(40),
//             //       decoration: BoxDecoration(
//             //         color: Color(0xFFF5F6F9),
//             //         borderRadius: BorderRadius.circular(10),
//             //       ),
//             //       child: Icon(
//             //         Icons.arrow_forward_ios,
//             //         size: 12,
//             //         color: Colors.black,
//             //       ),
//             //     ),
//             //     Spacer(),
//             //     Text("Add voucher code"),
//             //     const SizedBox(width: 10),
//             //     Icon(
//             //       Icons.arrow_forward_ios,
//             //       size: 12,
//             //       color: Colors.black,
//             //     )
//             //   ],
//             // ),
//             SizedBox(height: getProportionateScreenHeight(20)),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     text: "Total:\n",
//                     children: [
//                       TextSpan(
//                         text: cartModel.t,
//                         style: TextStyle(fontSize: 16, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(
//                   width: getProportionateScreenWidth(190),
//                   child: DefaultButton(
//                     text: "Check Out",
//                     press: () {},
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }