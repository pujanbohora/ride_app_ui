import 'package:flutter/material.dart';
import '../widgets/carousel_card.dart';
import '../widgets/community_section.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/tab_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined, size: 30,),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined, size: 30,),
      label: 'Order',
    ),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundColor: Colors.cyan,
        // radius: 30,
        child: Icon(
          Icons.location_on_outlined,
          color:Colors.white,
           size: 30,
        ),
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline, size: 30,),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
      label: '',
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00BCD4),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Hi, Michael',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchBarWidget(),
            ),
            const SizedBox(height: 16),
            TabNavigation(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView(
                  padding: const EdgeInsets.only(top: 16),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child:CustomCarousel()
                    ),
                    const SizedBox(height: 24),
                    CommunitySection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          items: items),
    );
  }
}
