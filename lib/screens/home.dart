import 'package:flutter/material.dart';
import 'package:pets_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20, 
              children: [
                HomeHeader(), 
                SpecialOffersSection(), 
                CategorySection(), 
                BestSellerSection(), 
                VerticalSpace(height: 90), 
              ],
            ),
          ),
          // Fixed bottom navigation bar
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: NavBar(
              navBarItems: [
                NavBarData(icon: Icons.home_filled),
                NavBarData(icon: Icons.shopping_bag_outlined),
                NavBarData(icon: Icons.favorite_border),
                NavBarData(icon: Icons.message_outlined),
                NavBarData(icon: Icons.person_outline),
              ],
              onItemChanged: (int newPosition) {
                // Handle navigation item change
              },
            ),
          ),
        ],
      ),
    );
  }
}
