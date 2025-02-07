import 'package:flutter/material.dart';
import 'package:inventory_management/screens/cart_sceen.dart';
import 'package:inventory_management/screens/categories_screen.dart';
import 'package:inventory_management/screens/user_profile_screen.dart';
import 'package:inventory_management/views/home_page.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const CategoriesScreen(),
    const CartScreen(),
    const UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items: List.generate(4, (index) {
          return BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (_selectedIndex ==
                    index) // Show the indicator only for the selected tab
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 4,
                      width: 24,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Icon(
                    _getIcon(index),
                    size: 28,
                  ),
                ),
              ],
            ),
            label: _getLabel(index),
          );
        }),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.category;
      case 2:
        return Icons.shopping_cart;
      case 3:
        return Icons.account_circle;
      default:
        return Icons.home;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Categories";
      case 2:
        return "Cart";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
