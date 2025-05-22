import 'package:flutter/material.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({super.key});

  @override
  State<TabNavigation> createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: const Color(0xFF263238),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem('Ride', 0),
          _buildTabItem('Delivery', 1),
          _buildTabItem('Eats', 2),
          _buildTabItem('Flights', 3),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white ,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}
