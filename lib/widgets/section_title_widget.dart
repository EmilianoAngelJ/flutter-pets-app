import 'package:flutter/material.dart';
import 'package:pets_app/theme/colors.dart';

/// A reusable section header widget with a title and a "See All" action.
class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Title left, action right
        children: [
          // Section title text
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // "See All" clickable text
          InkWell(
            onTap: () {
              // "See All" navigation
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'See All',
                style: TextStyle(
                  color: Appcolors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
