import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/bike_cart_controller.dart';
import '../../image_loader.dart';
import '../../model/popular.dart';
import '../../size_config.dart';
import '../cart/cart_screen.dart';
import '../home/home.dart';
import '../orders/orders_screen.dart';
import '../profile/profile_screen.dart';
import '../wallet/wallet_screen.dart';


class NavbarItem {
  final String lightIcon;
  final String boldIcon;
  final String label;

  NavbarItem({required this.lightIcon, required this.boldIcon, required this.label});

  BottomNavigationBarItem item(bool isbold) {
    return BottomNavigationBarItem(
      icon: ImageLoader.imageAsset(isbold ? boldIcon : lightIcon),
      label: label,
    );
  }

  BottomNavigationBarItem get light => item(false);
  BottomNavigationBarItem get bold => item(true);
}

class ButtomNavbarScreen extends StatefulWidget {
  static const route = '/bnav';

   ButtomNavbarScreen({super.key});

  @override
  State<ButtomNavbarScreen> createState() => _ButtomNavbarScreenState();
}

class _ButtomNavbarScreenState extends State<ButtomNavbarScreen> {
  int _select = 0;
  final cartController  = Get.put(BikeCartController());


  final screens = [
    const HomeScreen(
      title: '',
    ),
    CartScreen(),
    OrderScreen(title: 'Orders'),
    WalletScreen(title: 'Wallet'),
    //const ProfileScreen(),
  ];

  static Image generateIcon(String path) {
    return Image.asset(
      '${ImageLoader.rootPaht}/buttomnav/$path',
      width: 24,
      height: 24,
    );
  }

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      activeIcon: Icon(Icons.home_filled),
      label: 'Market',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      activeIcon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.notifications_none),
      activeIcon: Icon(Icons.notifications_none),
      label: 'Orders',
    ),
     const BottomNavigationBarItem(
       icon: Icon(Icons.notifications_none),
       activeIcon: Icon(Icons.notifications_none),
       label: 'Wallet',
     ),
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.person),
    //   activeIcon: Icon(Icons.person),
    //   label: 'Profile',
    // ),
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: screens[_select],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: ((value) => setState(() => _select = value)),
        currentIndex: _select,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
        selectedItemColor: const Color(0xFFFFC402),
        unselectedItemColor: const Color(0xFF9E9E9E),
      ),
    );
  }
}
