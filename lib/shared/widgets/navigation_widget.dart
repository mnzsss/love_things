import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../controllers/navigation_controller.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  final controller = NavigationController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: AppColors.primary,
            ),
            onPressed: () {
              controller.setPage(0);
              setState(() {});
            },
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.add_box_outlined,
                color: AppColors.background,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.description_outlined,
              color: AppColors.body,
            ),
            onPressed: () {
              controller.setPage(1);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
