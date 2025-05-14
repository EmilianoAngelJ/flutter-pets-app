import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pets_app/providers/index_provider.dart';
import 'package:pets_app/theme/colors.dart';

/// Signature for the callback when the selected navigation item changes.
typedef OnItemChanged = void Function(int newPosition);

/// A custom bottom navigation bar with animated selection and Riverpod integration.
class NavBar extends ConsumerStatefulWidget {
  final OnItemChanged onItemChanged;
  final List<NavBarData> navBarItems;

  const NavBar({
    super.key,
    required this.onItemChanged,
    required this.navBarItems,
  });

  @override
  ConsumerState<NavBar> createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 24),
      padding: EdgeInsets.symmetric(horizontal: 6),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Generate nav items dynamically
          ...widget.navBarItems.map((item) {
            final index = widget.navBarItems.indexOf(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  ref.read(indexProvider.notifier).state = index + 2; // Example logic
                });
                widget.onItemChanged(_selectedIndex);
              },
              child: NavBarItem(
                key: UniqueKey(),
                data: item,
                isSelected: index == _selectedIndex,
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// A single navigation item with animated background size and color.
class NavBarItem extends StatefulWidget {
  final NavBarData data;
  final bool isSelected;

  const NavBarItem({
    super.key,
    required this.data,
    required this.isSelected,
  });

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> sizeAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );

    // Animate size for selected item
    sizeAnimation = Tween<double>(
      begin: 0,
      end: widget.isSelected ? 54 : 26,
    ).animate(_controller)
      ..addListener(() => setState(() {}));

    // Animate background color
    colorAnimation = ColorTween(
      begin: widget.isSelected ? Colors.black : Appcolors.secondaryColor,
      end: widget.isSelected ? Appcolors.secondaryColor : Colors.black,
    ).animate(_controller)
      ..addListener(() => setState(() {}));

    // Start animation if selected initially
    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 54,
      child: Stack(
        children: [
          // Animated background circle
          Align(
            alignment: Alignment.center,
            child: Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              decoration: widget.isSelected
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: colorAnimation.value,
                    )
                  : null,
            ),
          ),
          // Icon (changes color based on selection)
          Align(
            alignment: Alignment.center,
            child: Icon(
              widget.data.icon,
              color: widget.isSelected
                  ? Appcolors.primaryColor
                  : Colors.grey,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// Model representing a nav item.
class NavBarData {
  final IconData? icon;
  final String? iconPath;

  NavBarData({this.icon, this.iconPath}) {
    assert(icon != null || iconPath != null, "Icon or IconPath must be set.");
  }
}
