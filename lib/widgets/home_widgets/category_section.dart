import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_app/data/dummy_data.dart';
import 'package:pets_app/theme/colors.dart';
import 'package:pets_app/widgets/widgets.dart';

/// Displays the category section with a title and horizontal scroll of icons.
class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10, 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Category'),
        CategoryCarousel(), 
      ],
    );
  }
}

/// Scrollable row of circular icons representing product categories.
class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115, 
      child: ListView.builder(
        itemCount: dummyCategories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 6),
        itemBuilder: (context, index) {
          final category = dummyCategories[index];
          return Column(
            spacing: 5, 
            children: [
              Container(
                height: 80,
                width: 80,
                margin: EdgeInsets.symmetric(horizontal: 9),
                decoration: BoxDecoration(
                  color: Appcolors.secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: FaIcon(
                    category["categoryIcon"],
                    color: Appcolors.primaryColor,
                    size: 32,
                  ),
                ),
              ),
              Text(category["categoryName"]), 
            ],
          );
        },
      ),
    );
  }
}
