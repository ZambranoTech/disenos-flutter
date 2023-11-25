// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = StateNotifierProvider<PageNotifier, PageState>((ref) {
  return PageNotifier();
});


class PageNotifier extends StateNotifier<PageState> {
  PageNotifier(): super(PageState());

  loadValues(bool puntosArriba, Color colorPrimario, Color colorSecundario, Color backgroundColor, double bulletPrimario, double bulletSecundario) {
    state = state.copyWith(
      puntosArriba: puntosArriba,
      colorPrimario: colorPrimario,
      colorSecundario: colorSecundario,
      backgroundColor: backgroundColor,
      bulletPrimario: bulletPrimario,
      bulletSecundario: bulletSecundario,
    );
  }

  changePage(double page) {
    state = state.copyWith(
      currentPage: page
    );
  }
  
}

class PageState {

  final double currentPage;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final Color backgroundColor;
  final double bulletPrimario;
  final double bulletSecundario;

  PageState({
    this.currentPage = 0, 
    this.puntosArriba = false, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey, 
    this.backgroundColor = Colors.transparent,
    this.bulletPrimario = 12, 
    this.bulletSecundario = 12,
  });

  

  PageState copyWith({
    double? currentPage,
    bool? puntosArriba,
    Color? colorPrimario,
    Color? colorSecundario,
    Color? backgroundColor,
    double? bulletPrimario,
    double? bulletSecundario,
  }) => PageState(
      currentPage: currentPage ?? this.currentPage,
      puntosArriba: puntosArriba ?? this.puntosArriba,
      colorPrimario: colorPrimario ?? this.colorPrimario,
      colorSecundario: colorSecundario ?? this.colorSecundario,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      bulletPrimario: bulletPrimario ?? this.bulletPrimario,
      bulletSecundario: bulletSecundario ?? this.bulletSecundario,
    );
  
}
