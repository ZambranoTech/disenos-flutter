import 'package:disenos_app/config/helpers/sizes.dart';
import 'package:disenos_app/presentation/widgets/boton_gordo.dart';
import 'package:disenos_app/presentation/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});


  @override
  Widget build(BuildContext context) {

    bool isLarge = false;
    if (isLikeTabletHeight(MediaQuery.of(context).size)) {
      isLarge = true;
    } 

    final items = <ItemBoton>[
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
];

    return  Scaffold(
      body: Column(
        children: [
          isLarge ? const HeaderView() : const SizedBox(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: items
                .map((item) => BotonGordo(
                    icon: item.icon,
                    text: item.text,
                    color1: item.color1,
                    color2: item.color2,
                    onPressed: () {}))
                .toList()
              ),
          ),
          
        ] 
      )
      
   );
  }
}

class ItemBoton {

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.text, this.color1, this.color2 );
}

class HeaderView extends StatelessWidget {
  const HeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: Icons.add_rounded,
      title: 'Asistencia Médica',
      subtitle: 'Haz solicitado',
      color1: Colors.blue.shade800,
      color2: Colors.blue.shade400,
    );
  }
}