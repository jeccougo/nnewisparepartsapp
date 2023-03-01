import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

import '../../model/product.dart';
import '../../size_config.dart';

class MotorDetailScreen extends StatefulWidget {
  final cartController  = Get.put(BikeCartController());
  final BikeCartController? controller;
  final int? index;
  final int? quantity;

  final Product? product;
  MotorDetailScreen({super.key, this.product, this.controller, this.index, this.quantity,

  });

  static String route() => '/motor_detail';

  @override
  State<MotorDetailScreen> createState() => _MotorDetailScreenState();
}

class _MotorDetailScreenState extends State<MotorDetailScreen> {
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
                        child: Image.asset(widget.product!.image,
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
                        // SizedBox(
                        //   height: 300,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: widget.product!.images.length,
                        //     itemBuilder: (context, index) {
                        //       return SizedBox(
                        //         width: 150,
                        //         height: 50,
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(15),
                        //           child: Image.asset(
                        //             widget.product!.moreProductImages[index],
                        //             fit: BoxFit.contain,
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // )
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
              widget.product!.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
          IconButton(
            onPressed: () => setState(() => _iscollected = !_iscollected),
            icon: Image.asset('assets/icons/${_iscollected ? 'bold' : 'light'}/heart@2x.png'),
            iconSize: 28,
          ),
        ],
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Color(0xFFeeeeee),
            ),
            child: const Text(
              '9,742 sold',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 16),
          Image.asset('assets/icons/start@2x.png', height: 20, width: 20),
          const SizedBox(width: 8),
          const Text(
            '4.8 (6,573 reviews)',
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
        widget.product!.image,
        expandText: 'view more',
        collapseText: 'view less',
        linkStyle: TextStyle(color: Color(0xFF424242), fontWeight: FontWeight.bold),
      ),
    ];
  }


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
                  children: const [
                    Text('Total price', style: TextStyle(color: Color(0xFF757575), fontSize: 12)),
                    SizedBox(height: 6),
                    Text('\$280.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
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

