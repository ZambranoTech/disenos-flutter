import 'package:disenos_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem {
  final String title;
  final String? subTitle;
  final String link;
  final IconData icon;
  final Widget widget;

  const MenuItem({
    required this.title,
    this.subTitle,
    required this.link,
    required this.icon,
    required this.widget
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Slideshow',
      link: '/slide-show',
      icon: Icons.co_present,
      widget: SlideShowScreen()
  ),

  MenuItem(
      title: 'Emergencia',
      link: '/emergency',
      icon: FontAwesomeIcons.truckMedical,
       widget: EmergencyScreen()
  ),

  MenuItem(
      title: 'Encabezados',
      link: '/headers',
      icon: FontAwesomeIcons.heading,
      widget: HeadersScreen()
  ),

  MenuItem(
      title: 'Cuadro animado',
      link: '/animations',
      icon: Icons.animation_rounded,
      widget: CuadradoAnimado()
  ),

  MenuItem(
      title: 'Barra Progreso',
      link: '/progress-radio',
      icon: Icons.animation_rounded,
      widget: GraficasCircularScreen()
  ),

  MenuItem(
      title: 'Pinterest',
      link: '/pinterest',
      icon: FontAwesomeIcons.pinterest,
      widget: PinterestScreen()
  ),

  MenuItem(
      title: 'Slivers',
      link: '/slivers',
      icon: FontAwesomeIcons.mobileRetro,
      widget: SliverScreen()
  ),
  

];
