import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Static list of dummy pet categories with associated FontAwesome icons.
/// Useful for UI elements like category selectors or filters.
const List<Map<String, dynamic>> dummyCategories = [
  {
    "categoryName": "Dog",
    "categoryIcon": FontAwesomeIcons.dog
  },
  {
    "categoryName": "Cat",
    "categoryIcon": FontAwesomeIcons.cat
  },
  {
    "categoryName": "Bird",
    "categoryIcon": FontAwesomeIcons.crow
  },
  {
    "categoryName": "Fish",
    "categoryIcon": FontAwesomeIcons.fish
  },
  {
    "categoryName": "Frog",
    "categoryIcon": FontAwesomeIcons.frog
  }
];

/// Local asset images used for displaying promotional offers.
/// Can be used in sliders or banners on the homepage.
const List<Map<String, AssetImage>> offerImages = [
  {
    "offerImage": AssetImage('assets/offer_images/offer_4.jpg')
  },
  {
    "offerImage": AssetImage('assets/offer_images/offer_3.jpg')
  },
  {
    "offerImage": AssetImage('assets/offer_images/offer_2.jpg')
  },
  {
    "offerImage": AssetImage('assets/offer_images/offer_1.jpg')
  }
];

/// Static list of best-selling product previews, with name and image path.
/// Ideal for populating a featured or trending section in the UI.
const List<Map<String, String>> bestSellerProducts = [
  {
    "productName": "Dog Food",
    "productImage": "assets/products/product_1.png"
  },
  {
    "productName": "Black Sweater",
    "productImage": "assets/products/product_2.heic"
  },
  {
    "productName": "Blue Overall",
    "productImage": "assets/products/product_3.heic"
  },
  {
    "productName": "Brown Jacket",
    "productImage": "assets/products/product_4.heic"
  }
];
