// import 'package:flutter/material.dart';
//
// import 'package:nnewi_spare_parts_market/screens/home/search_field.dart';
// import 'package:nnewi_spare_parts_market/screens/home/special_offer.dart';
//
// import '../../components/product_card.dart';
// import '../../model/popular.dart';
// import '../detail/detail_screen.dart';
// import '../mostpopular/most_popular_screen.dart';
// import '../special_offers/special_offers_screen.dart';
// import 'hearder.dart';
// import 'most_popular.dart';
//
// class HomeScreen extends StatefulWidget {
//   final String title;
//
//   static String route() => '/home';
//
//   const HomeScreen({super.key, required this.title});
//
//   @override
//   State<StatefulWidget> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late final datas = homePopularProducts;
//
//   @override
//   Widget build(BuildContext context) {
//     const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           const SliverPadding(
//             padding: EdgeInsets.only(top: 24),
//             sliver: SliverAppBar(
//               pinned: true,
//               flexibleSpace: HomeAppBar(),
//             ),
//           ),
//           SliverPadding(
//             padding: padding,
//             sliver: SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 ((context, index) => _buildBody(context)),
//                 childCount: 1,
//               ),
//             ),
//           ),
//           SliverPadding(
//             padding: padding,
//             sliver: _buildPopulars(),
//           ),
//           const SliverAppBar(flexibleSpace: SizedBox(height: 24))
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBody(BuildContext context) {
//     return Column(
//       children: [
//         const SearchField(),
//         const SizedBox(height: 24),
//         SpecialOffers(onTapSeeAll: () => _onTapSpecialOffersSeeAll(context)),
//         const SizedBox(height: 24),
//         MostPopularTitle(onTapseeAll: () => _onTapMostPopularSeeAll(context)),
//         const SizedBox(height: 24),
//         const MostPupularCategory(),
//       ],
//     );
//   }
//
//   Widget _buildPopulars() {
//     return SliverGrid(
//       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 185,
//         mainAxisSpacing: 24,
//         crossAxisSpacing: 16,
//         mainAxisExtent: 285,
//       ),
//       delegate: SliverChildBuilderDelegate(_buildPopularItem, childCount: datas.length),
//     );
//   }
//
//   Widget _buildPopularItem(BuildContext context, int index) {
//     final data = datas[index % datas.length];
//     return ProductCard(
//       data: data,
//       ontap: (data) => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ShopDetailScreen()),
//       ),
//     );
//   }
//
//   void _onTapMostPopularSeeAll(BuildContext context) {
//     Navigator.pushNamed(context, MostPopularScreen.route());
//   }
//
//   void _onTapSpecialOffersSeeAll(BuildContext context) {
//     Navigator.pushNamed(context, SpecialOfferScreen.route());
//   }
// }




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nnewi_spare_parts_market/model/popular.dart';
import 'package:nnewi_spare_parts_market/screens/home/most_popular.dart';
import 'package:nnewi_spare_parts_market/screens/home/search_field.dart';
import 'package:nnewi_spare_parts_market/screens/home/special_offer.dart';

import '../../constants.dart';
import '../../model/kekemodel.dart';
import '../../size_config.dart';
import '../mostpopular/most_popular_screen.dart';
import '../profile/profile_screen.dart';
import '../special_offers/special_offers_screen.dart';
import '../tabs/biketab.dart';
import '../tabs/keketab.dart';
import '../tabs/motortab.dart';
import '../utils/likeicon.dart';
import '../utils/mytab.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  static String route() => '/home';
  const HomeScreen({Key? key, required this.title}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    const padding = EdgeInsets.fromLTRB(24, 0, 24, 0);
    SizeConfig().init(context);


    return DefaultTabController(
      length: myTabs.length,
      child: SafeArea(

        child: Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 1000,
                child: Column(
                      children: [
                        //HomeAppBar(),
                         Padding(
                           padding: padding,
                           child: SearchField(),
                         ),
                        Padding(
                          padding: padding,
                          child: SpecialOffers(onTapSeeAll: () => _onTapSpecialOffersSeeAll(context)),
                        ),

                        Padding(
                          padding: padding,
                          child: MostPopularTitle(onTapseeAll: () => _onTapMostPopularSeeAll(context)),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: TabBar(
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.black12,
                                indicator: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                  tabs: myTabs),
                            ),
                          ),
                        ),

                        Expanded(
                          child: TabBarView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                //foodpage
                                BikeTab( bikes: bikes,),

                                //KekeTab(),
                                KekeTab(kekes: kekes,),

                                MotorTab(),


                              ]),
                        ),

                      ],
                    ),
              ),
            ],
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
  return AppBar(
    toolbarHeight: 80,
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    //foregroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // InkWell(
        //   borderRadius: const BorderRadius.all(Radius.circular(24)),
        //   onTap: () => Navigator.pushNamed(context, ProfileScreen.route()),
        //   child: const CircleAvatar(
        //     //backgroundImage: AssetImage('$kIconPath/me.png'),
        //     backgroundColor: Colors.amber,
        //
        //     radius: 24,
        //   ),
        // ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Welcome to 👋',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Ime Afia',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
        IconButton(
          iconSize: 28,
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        const SizedBox(width: 5),
        //LikeButton(),
      ],
    ),

  );
}


