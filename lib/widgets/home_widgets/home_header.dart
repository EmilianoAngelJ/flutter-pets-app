import 'package:flutter/material.dart';
import 'package:pets_app/theme/colors.dart';
import '../widgets.dart';

/// Header section of the home screen with location, notification icon, and search bar.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: _boxDecoration(), // Rounded bottom corners with primary color
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top row: Location on the left, Notifications on the right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LocationWidgets(),
                NotificationsWidget()
              ],
            ),
            const CustomSearchbar(),
          ],
        ),
      ),
    );
  }

  /// Returns a box decoration with rounded bottom and background color
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Appcolors.primaryColor,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    );
  }
}

/// Bell icon with background box for showing notifications
class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Appcolors.backgroundColor.withAlpha(80), // Semi-transparent bg
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          // Handle notification click
        }, 
        icon: Icon(
          Icons.notifications,
          size: 30,
          color: Appcolors.secondaryColor,
        ),
      ),
    );
  }
}

/// Displays location with dropdown arrow and pin icon
class LocationWidgets extends StatelessWidget {
  const LocationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            color: Appcolors.secondaryColor.withAlpha(200),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 28,
              color: Appcolors.terciaryColor,
            ),
            const HorizontalSpace(width: 5),
            Text(
              'New York, USA',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Appcolors.secondaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle location change
              }, 
              visualDensity: VisualDensity.compact,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Appcolors.terciaryColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}
