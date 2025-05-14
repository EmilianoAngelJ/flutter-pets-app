import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pets_app/providers/index_provider.dart';
import 'package:pets_app/theme/colors.dart';

/// Displays a special offer card with an image and several buttons for interaction.
class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({super.key, required this.offerImage});

  final AssetImage offerImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 150,
      decoration: BoxDecoration(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // Positioned image with curved clipping
          Positioned(
            right: 0,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: offerImage, 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Overlay content: buttons and text
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OffersButton(),
                OffersText(),
                OrderButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom clipper for the offer image, creating a curve effect.
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.6, 0);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.5, size.width * 0.6, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// "Order Now" button at the bottom of the special offer card.
class OrderButton extends StatelessWidget {
  const OrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Appcolors.primaryColor,
      ),
      child: Text(
        'Order Now', 
        style: TextStyle(color: Appcolors.secondaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// Section displaying the offer's text and discount information.
class OffersText extends StatelessWidget {
  const OffersText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 180,
      child: Stack(
        children: [
          // "Get Special Offer" label
          const Text(
            'Get Special Offer',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          
          // "Up to" text positioned below the main label
          Positioned(
            left: 0,
            bottom: 20,
            child: const Text(
              'Up to',
              style: TextStyle(fontSize: 16),
            ),
          ),
          
          // Percentage value from Riverpod's indexProvider
          Positioned(
            left: 48,
            bottom: -5,
            child: Consumer(
              builder: (context, ref, child) {
                final index = ref.watch(indexProvider);
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                    '${index}0',
                    key: ValueKey<int>(index),
                    style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  )
                );
              },
            ),
          ),
          
          // Small percentage icon inside a circular badge
          Positioned(
            left: 85,
            bottom: 7,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.percent, size: 10),
            ),
          ),
        ],
      ),
    );
  }
}

/// Button leading to offers on accessories.
class OffersButton extends StatelessWidget {
  const OffersButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(              
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Appcolors.backgroundColor,
      ),
      child: const Text(
        'Offers on accessories', 
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
