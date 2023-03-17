import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nnewi_spare_parts_market/model/product.dart';
import 'package:nnewi_spare_parts_market/screens/home/most_popular.dart';
import 'package:nnewi_spare_parts_market/screens/home/search_field.dart';
import 'package:nnewi_spare_parts_market/screens/home/special_offer.dart';
import 'package:nnewi_spare_parts_market/screens/home/texttobuy.dart';
import 'package:nnewi_spare_parts_market/screens/orders/AllOrders.dart';

import '../../controller/cart_controller.dart';
import '../../size_config.dart';
import '../detail/details_screen.dart';
import '../mostpopular/most_popular_screen.dart';
import '../profile/profile_screen.dart';
import '../special_offers/special_offers_screen.dart';
import '../tabs/biketab.dart';
import '../tabs/keketab.dart';
import '../tabs/motortab.dart';
import '../utils/mytab.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  static String route() => '/home';
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cartController  = Get.put(BikeCartController());



  List<Widget> myTabs = [
    //food tab
    MyTab(tabName: 'Motor cycle'),
    //coffee tab
    MyTab(tabName: 'Keke'),
    //bakery tab
    MyTab(tabName: 'Motor parts'),
    //drinks tab
  ];
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(15, 0, 15, 0);
    SizeConfig().init(context);

    return DefaultTabController(
      length: myTabs.length,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight,
                child: Column(
                  children: [
                    //HomeAppBar(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(15),
                          getProportionateScreenHeight(15),
                          getProportionateScreenWidth(15),
                          0),
                    //child:  SearchField(),
                    ),
                    Padding(
                      padding: padding,
                      child: SpecialOffers(
                          onTapSeeAll: () =>
                              _onTapSpecialOffersSeeAll(context)),
                    ),
                    Padding(
                      padding: padding,
                      child: MostPopularTitle(
                          onTapseeAll: () => _onTapMostPopularSeeAll(context)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(5),
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(0)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            indicator: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            tabs: myTabs,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            BikeTab( bikes: bikes,),

                                KekeTab(kekes: kekes,),

                                MotorTab(motors: motors,),


                              ]),
                        ),

                      ],
                    ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              Get.to(() => const TexttoBuy());
            },
            child: Icon(
              Icons.chat,
              color: Colors.black,
            ),
          ),

        ),
      ),
    );
  }
  void _onTapSpecialOffersSeeAll(BuildContext context) {
    Navigator.pushNamed(context, SpecialOfferScreen.route());
  }

  void _onTapMostPopularSeeAll(BuildContext context) {
    Navigator.pushNamed(context, MostPopularScreen.route());
  }


}





AppBar buildAppBar(BuildContext context) {
  final cartController  = Get.put(BikeCartController());

  return AppBar(
    toolbarHeight: 80,
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    //foregroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllOrderScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: GestureDetector(
              onTap: () {
                Get.to(ProfileScreen());
              },
              child: const CircleAvatar(
                backgroundColor: Colors.amber,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Welcome to 👋',
                style: TextStyle(
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
              ),
              Text(
                'Nkwo Nnewi',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),

        GestureDetector(
            onTap: () async {
              final query = await showSearch(context: context, delegate: SearchBar(cartController.bikes));
              if (query != null) {
                cartController.search(query);
              }
            },
            child: Icon(Icons.search)),
        // GestureDetector(
        //   onTap: () async {
        //     print('Number of bikes: ${cartController.bikes.length}');
        //     final query = await showSearch(context: context, delegate: SearchBar(cartController.bikes));
        //     if (query != null) {
        //       cartController.search(query);
        //     }
        //   },
        //   child: Icon(
        //         Icons.search,
        //         color: Colors.black,
        //
        //
        //   ),
        // ),

        //const SizedBox(width: 5),
        //LikeButton(),
      ],
    ),

  );
}




class SearchBar extends SearchDelegate<String> {
  final List<Product> searchResults;

  SearchBar(this.searchResults);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';        },      ),    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final cartController  = Get.put(BikeCartController());

    final matchingBikes = bikes
        .where((bike) => bike.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return SizedBox(
      height: 900,
      child: ListView.builder(
        itemCount: matchingBikes.length,
        itemBuilder: (context, index) {
          final item = matchingBikes[index];
          return ListTile(
            title: Text(
              item.name,
              style: TextStyle(color: Colors.red),
            ),
            subtitle: Text(item.name),
            onTap: () {
              // Navigate to the details screen for the selected bike
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopDetailScreen(
                    product: item,
                    controller: cartController,
                    index: index, ),
                ),
              );
            },
          );
        },
      ),
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final cartController  = Get.put(BikeCartController());

    final suggestions = bikes.where((bike) => bike.name.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = suggestions[index];

        return ListTile(
          title: Text(item.name),
          onTap: () {
            // Navigate to the details screen for the selected bike
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopDetailScreen(
                  product: item,
                  controller: cartController,
                  index: index, ),
              ),
            );
          },
        );
      },
    );
  }
}

