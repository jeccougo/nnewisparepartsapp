import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/bike_cart_controller.dart';
import '../../model/popular.dart';
import '../../model/productmodel.dart';
import '../../size_config.dart';

class KekeDetailScreen extends StatefulWidget {
  final cartController  = Get.put(BikeCartController());
  final BikeCartController? controller;
  final int? index;
  final int? quantity;

  final ProductModel? product;
   KekeDetailScreen({super.key, required this.product, this.controller, this.index, this.quantity,

  });

  static String route() => '/keke_detail';

  @override
  State<KekeDetailScreen> createState() => _KekeDetailScreenState();
}

class _KekeDetailScreenState extends State<KekeDetailScreen> {
  final cartController  = Get.put(BikeCartController());
  late final BikeCartController? controller;


  bool _iscollected = false;

  get index => 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: getProportionateScreenHeight(428),
                  leading: IconButton(
                    icon: Image.asset('assets/icons/back@2x.png', scale: 2),
                    onPressed: () => Navigator.pop(context),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: const Color(0xFFeeeeee),
                      child: Image.asset(widget.product!.image.toString(),
                        fit: BoxFit.contain,
                      )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ..._buildTitle(),
                        const SizedBox(height: 16),
                        _buildLine(),
                        const SizedBox(height: 16),
                        ..._buildDescription(),
                        const SizedBox(height: 24),
                       // _buildQuantity(),
                        const SizedBox(height: 15),
                  SizedBox(
                    height: 300,
                    // child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: widget.product!.moreProductImages.length,
                    //   itemBuilder: (context, index) {
                    //     return SizedBox(
                    //       width: 150,
                    //       height: 50,
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(15),
                    //         child: Image.asset(
                    //           widget.product!.moreProductImages[index],
                    //           fit: BoxFit.contain,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                  )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _buldFloatBar()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTitle() {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           FittedBox(
            child: Text(
                 widget.product!.name.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
          // IconButton(
          //   onPressed: () => setState(() => _iscollected = !_iscollected),
          //   icon: Image.asset('assets/icons/${_iscollected ? 'bold' : 'light'}/heart@2x.png'),
          //   iconSize: 28,
          // ),
        ],
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(6)),
          //     color: Color(0xFFeeeeee),
          //   ),
          //   child: const Text(
          //     '9,742 sold',
          //     style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          //   ),
          // ),
          //const SizedBox(width: 16),
          Image.asset('assets/icons/start@2x.png', height: 20, width: 20),
          const SizedBox(width: 8),
          const Text(
            '4.8',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ];
  }

  Widget _buildLine() {
    return Container(height: 1, color: const Color(0xFFEEEEEE));
  }

  List<Widget> _buildDescription() {
    return [
      const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
       ExpandableText(
        widget.product!.image.toString(),
        expandText: 'view more',
        collapseText: 'view less',
        linkStyle: TextStyle(color: Color(0xFF424242), fontWeight: FontWeight.bold),
      ),
    ];
  }

  // Widget _buildQuantity() {
  //   return Row(
  //     children: [
  //       const Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
  //       const SizedBox(width: 20),
  //       Container(
  //         decoration: const BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(24)),
  //           color: Color(0xFFF3F3F3),
  //         ),
  //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  //         child: Material(
  //           color: Colors.transparent,
  //           child: Row(
  //             children: [
  //               InkWell(
  //                 child: Image.asset('assets/icons/detail/minus@2x.png', scale: 2),
  //                 onTap: () {
  //                   if (_quantity <= 0) return;
  //                   setState(() => _quantity -= 1);
  //                 },
  //               ),
  //               const SizedBox(width: 20),
  //               Text('$_quantity',
  //                   style: const TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 18,
  //                   )),
  //               const SizedBox(width: 20),
  //               InkWell(
  //                 child: Image.asset('assets/icons/detail/plus@2x.png', scale: 2),
  //                 onTap: () => setState(() => _quantity += 1),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buldFloatBar() {
    buildAddCard() => Container(
          height: 58,
          width: getProportionateScreenWidth(258),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(29)),
            color: const Color(0xFF101010),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 8),
                blurRadius: 20,
                color: const Color(0xFF101010).withOpacity(0.25),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(29)),
              // splashColor: const Color(0xFFEEEEEE),
              onTap: () {
                widget.controller?.addProductToCart(widget.product!);
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/detail/bag@2x.png', scale: 2),
                  const SizedBox(width: 16),
                  const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            _buildLine(),
            const SizedBox(height: 21),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('Total price', style: TextStyle(color: Color(0xFF757575), fontSize: 12)),
                    SizedBox(height: 6),
                    Text(
                      '\N${widget.product?.price}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
                    ),
                  ],
                ),
                buildAddCard()
              ],
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}

// class ExpandableText extends StatefulWidget {
//   ExpandableText({this.text = ""});
//   //text is the total text of our expandable widget
//   final String text;
//   @override
//   _ExpandableTextState createState() => _ExpandableTextState();
// }

// class _ExpandableTextState extends State<ExpandableText> {
//   static const viewMore = ' view more...';
//   static const fixedLength = 50;
//   late String textToDisplay;
//   @override
//   void initState() {
//     //if the text has more than a certain number of characters, the text we display will consist of that number of characters;
//     //if it's not longer we display all the text
//     print(widget.text.length);

//     //we arbitrarily chose 25 as the length
//     textToDisplay = widget.text.length > 25 ? widget.text.substring(0, 25) + viewMore : widget.text;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Text(textToDisplay),
//       onTap: () {
//         //if the text is not expanded we show it all
//         if (widget.text.length > 25 && textToDisplay.length <= (25 + viewMore.length)) {
//           setState(() {
//             textToDisplay = widget.text;
//           });
//         }
//         //else if the text is already expanded we contract it back
//         else if (widget.text.length > 25) {
//           setState(() {
//             textToDisplay = widget.text.substring(0, 25) + viewMore;
//           });
//         }
//       },
//     );
//   }
// }
