import 'package:flutter/material.dart';
import 'package:pets_app/data/dummy_data.dart';
import 'package:pets_app/theme/colors.dart';
import 'package:pets_app/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Section that displays special offers with a carousel.
class SpecialOffersSection extends StatelessWidget {
  const SpecialOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: const [
        SectionTitle(title: 'Special Offers'),
        SpecialOffersCarousel(),
      ],
    );
  }
}

/// A carousel widget to display special offers with a page controller.
class SpecialOffersCarousel extends StatefulWidget {
  const SpecialOffersCarousel({super.key});

  @override
  State<SpecialOffersCarousel> createState() => _SpecialOffersCarouselState();
}

class _SpecialOffersCarouselState extends State<SpecialOffersCarousel> {
  final PageController _pageController = PageController(); // Page controller for carousel

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        // Carousel showing special offer cards
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: offerImages.length, // Number of offer images
            itemBuilder: (context, index) {
              final image = offerImages[index]; 
              // Display each special offer card with an image
              return SpecialOfferCard(
                offerImage: image["offerImage"] ?? AssetImage('assets/default_image.jpg'),
              );
            },
          ),
        ),
        // Page indicator to show current page in carousel
        SmoothPageIndicator(
          controller: _pageController, 
          count: offerImages.length, 
          effect: ScaleEffect(
            activeDotColor: Appcolors.primaryColor, 
            dotHeight: 8,
            dotWidth: 8,
          ),
        )
      ],
    );
  }
}
