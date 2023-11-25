import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function() onPressed;

  const BotonGordo({super.key, required this.icon, required this.text, required this.color1, required this.color2, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FadeInLeft(
        duration: const Duration(milliseconds: 500),
        child: Stack(
          children: [
            _BotonGordoBackground(icon, color1, color2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: ListTile(
                    leading: FaIcon(icon, color: Colors.white, size: 40,),
                    title: Text(text, style: TextStyle(color: Colors.white),),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground(this.icon, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color1, color2]),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(2, 6),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(15)
      ),
      child:  ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon, 
                size: 150, 
                color: Colors.white.withOpacity(0.2),
              ) 
            )
          ],
        ),
      )
    );
  }
}
