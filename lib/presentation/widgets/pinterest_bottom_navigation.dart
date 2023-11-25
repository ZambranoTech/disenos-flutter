import 'package:disenos_app/presentation/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends ConsumerWidget {

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  
  const PinterestMenu({
    super.key,
    this.backgroundColor = Colors.white, 
    this.activeColor = Colors.black, 
    this.inactiveColor = Colors.grey, 
    required this.items
  });

  
  @override
  Widget build(BuildContext context, ref) {

    final size = MediaQuery.of(context).size;

    final show = ref.watch(navigationProvider).show;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: show ? 1.0 : 0,
      child: IgnorePointer(
        ignoring: !show,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.07,
              width: size.height * (items.length * 0.06) ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: -5,
                  )
                ]
              
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  items.length,
                  (index) => _PinterestButton(activeColor, inactiveColor, index: index, pinterestButton: items[index],)
                ),
              ),
              
            ),
          ),
        ),
      ),
    );
  }
}

class _PinterestButton extends ConsumerWidget {

  final int index;
  final PinterestButton pinterestButton;
  final Color activeColor;
  final Color inactiveColor;

  const _PinterestButton(this.activeColor, this.inactiveColor, {required this.index, required this.pinterestButton});

  @override
  Widget build(BuildContext context, ref) {

    final navigation = ref.watch(navigationProvider);

    return GestureDetector(
      onTap: () {
      ref.read(navigationProvider.notifier).changeIndex(index);
      pinterestButton.onPressed();
      },
      child: Icon(
        size: (navigation.currentIndex == index) ? 40 : 35,
        pinterestButton.icon,
        color: (navigation.currentIndex == index) ? activeColor : inactiveColor,
      ),
    );
  }
}