import 'package:flutter/material.dart';
import 'package:pets_app/theme/colors.dart';


/// Custom search bar composed of a text input and a filter button.
class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SearchBar(), 
        FilterBox(),
      ],
    );
  }
}

/// A box containing a filter icon.
class FilterBox extends StatelessWidget {
  const FilterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.format_list_bulleted_rounded,
        color: Appcolors.primaryColor,
      ),
    );
  }
}

/// An expanded search input field with rounded corners and an icon.
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Appcolors.secondaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Appcolors.primaryColor,
            size: 30,
          ),
          label: Text('Search'),
          floatingLabelBehavior: FloatingLabelBehavior.never, // Keeps label inside when focused
        ),
      ),
    );
  }
}
