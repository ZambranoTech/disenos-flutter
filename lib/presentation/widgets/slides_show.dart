import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SlidesShow extends StatefulWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final Color backgroundColor;
  
  const SlidesShow({
    super.key, 
    required this.slides,
    this.puntosArriba = false, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey, 
    this.backgroundColor = Colors.transparent,
  });

  @override
  State<SlidesShow> createState() => _SlidesShowState();
}

class _SlidesShowState extends State<SlidesShow> {

  double currentPage = 0;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      if (pageController.page == null) return;
      setState(() {
        currentPage = pageController.page!;
      });
    });

  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (widget.puntosArriba) _Dots(widget.slides.length, widget.colorPrimario, widget.colorSecundario, currentPage),
              
              Expanded(
                child: _Slides(widget.slides, pageController)
              ),

              if (!widget.puntosArriba) _Dots(widget.slides.length, widget.colorPrimario, widget.colorSecundario, currentPage),
      
            ],
      
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;
  final Color colorPrimario;
  final Color colorSecundario;
  final double currentPage;

  const _Dots(this.totalSlides, this.colorPrimario, this.colorSecundario, this.currentPage);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index, colorPrimario, colorSecundario, currentPage)),
      ),
    );
  }
}

class _Dot extends ConsumerWidget {

  final int index;
  final Color colorPrimario;
  final Color colorSecundario;
  final double currentPage;

  const _Dot(this.index, this.colorPrimario, this.colorSecundario, this.currentPage);

  @override
  Widget build(BuildContext context, ref) {

    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (currentPage >= index -0.5 && currentPage < index + 0.5)
          ? colorPrimario 
          : colorSecundario,
      ),
    );
  }
}


class _Slides extends StatelessWidget {
  final List<Widget> slides;
  final PageController controller;

  const _Slides(this.slides, this.controller);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: slides.map((slide) => _Slide(slide)).toList()
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide( this.slide );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      height: double.infinity,
      child: slide,
    );
  }
}