import 'package:amit_shope/Screens/cart/cart_screen.dart';
import 'package:amit_shope/Screens/category/categories.dart';
import 'package:amit_shope/Screens/home/all_products.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [AllProducts(),Categories(),CartScreen()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,

              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,

              ),
              label: "Categories"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,

            ),
            label: "Cart",
          ),

        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,

      ),
    );
  }

}
