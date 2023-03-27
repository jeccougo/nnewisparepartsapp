import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../model/product.dart';
import '../detail/keke_detail_screen.dart';


class MotorTab extends StatefulWidget {
  final List<Motor> motors;
  const MotorTab({super.key, required this.motors});


  @override
  State<MotorTab> createState() => _MotorTabState();
}

class _MotorTabState extends State<MotorTab> {
  late final datas = motors;

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
      delegate: SliverChildBuilderDelegate(_buildPopularItem,
          childCount: widget.motors.length),
    );
  }

  Widget _buildPopularItem(BuildContext context, int index) {
    return MotorProductCard(
      motors: widget.motors[index],
      index: index,
      quantity: widget.motors.length,
    );
  }
}



typedef MotorProductCardOnTaped = void Function(Product motors);

class MotorProductCard extends StatelessWidget {
  final cartController = Get.put(BikeCartController());

  MotorProductCard({super.key,this.ontap, required this.motors, required this.index, required this.quantity});

  final Motor motors;
  final int index;
  final MotorProductCardOnTaped? ontap;
  final int quantity;




  @override
  Widget build(BuildContext context) {
    // final data = datas[index % datas.length];
    const borderRadius = BorderRadius.all(Radius.circular(20));
    return InkWell(
      borderRadius: borderRadius,
      onTap: () => ontap?.call(motors),
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
                      Get.to(() => KekeDetailScreen(
                          product: motors,
                          controller: cartController,
                          index: index, quantity: quantity),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.downToUp);
                    },
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          motors.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),),
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
                  motors.name,
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
                '\N${motors.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF212121)),
              ),
            ],
          ),
          const SizedBox(height: 5),

         // const SizedBox(height: 10),
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
            cartController.addProductToCart(motors[index]);
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






