import 'package:disenos_app/config/helpers/sizes.dart';
import 'package:disenos_app/presentation/widgets/pinterest_bottom_navigation.dart';
import 'package:disenos_app/presentation/widgets/pinterest_masonry.dart';
import 'package:flutter/material.dart';


class PinterestScreen extends StatelessWidget {
  const PinterestScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    bool isLargeWidth = false;

    if (isLikeTabletWidth(size)) {
      isLargeWidth = true;
    }

    return Scaffold(
      body: Center(
        child: Stack(
            children: [
              const PinterestMasonry(),
              Positioned(
                bottom: 10,
                child: SizedBox(
                  width: isLargeWidth ? size.width-300 : size.width,
                  child: Align(
                    child: PinterestMenu(
                      items: [
                        PinterestButton(onPressed: () { print('opción 1'); }, icon: Icons.pie_chart),
                        PinterestButton(onPressed: () { print('opción 2'); }, icon: Icons.search),
                        PinterestButton(onPressed: () { print('opción 3'); }, icon: Icons.notifications),
                        PinterestButton(onPressed: () { print('opción 4'); }, icon: Icons.person_pin_rounded),
                      ],
                      activeColor: colors.primary,
                      backgroundColor: colors.background,
                      ))
                  )
              )
            ],
          ),
     ),
   );
  }
}