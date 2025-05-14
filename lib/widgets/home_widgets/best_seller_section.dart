import 'package:flutter/material.dart';
import 'package:pets_app/data/dummy_data.dart';
import 'package:pets_app/theme/colors.dart';
import 'package:pets_app/widgets/widgets.dart';

/// Displays the "Best Seller Products" section with a title and grid view.
class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15, 
      children: [
        SectionTitle(title: 'Best Seller Products'),
        ProductsGridView(), // Grid of best-selling product cards
      ],
    );
  }
}

/// A grid of product cards generated from dummy data.
class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), 
        shrinkWrap: true, // Allows grid to size based on content
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.95, // Slightly taller than wide
        ),
        itemCount: bestSellerProducts.length,
        itemBuilder: (context, index) {
          final product = bestSellerProducts[index];
          return BestSellerProductCard(
            image: product["productImage"].toString(),
            productName: product["productName"].toString(),
          );
        },
      ),
    );
  }
}

/// Displays a single best-selling product inside a styled card.
class BestSellerProductCard extends StatelessWidget {
  const BestSellerProductCard({
    super.key,
    required this.image,
    required this.productName,
  });

  final String image;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: 120, 
            ),
          ),
          Text(
            productName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
