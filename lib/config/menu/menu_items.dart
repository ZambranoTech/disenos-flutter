import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem {
  final String title;
  final String? subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    this.subTitle,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Slideshow',
      link: '/slide-show',
      icon: Icons.co_present
  ),

  MenuItem(
      title: 'Emergencia',
      link: '/emergency',
      icon: FontAwesomeIcons.truckMedical
  ),

  MenuItem(
      title: 'Encabezados',
      link: '/headers',
      icon: FontAwesomeIcons.heading
  ),

  MenuItem(
      title: 'Cuadro animado',
      link: '/animations',
      icon: Icons.animation_rounded
  ),

  MenuItem(
      title: 'Barra Progreso',
      link: '/progress-radio',
      icon: Icons.animation_rounded
  ),

  MenuItem(
      title: 'Pinterest',
      link: '/pinterest',
      icon: FontAwesomeIcons.pinterest
  ),

  MenuItem(
      title: 'Slivers',
      link: '/slivers',
      icon: FontAwesomeIcons.mobileRetro
  ),
  

];
