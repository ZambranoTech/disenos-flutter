import 'package:disenos_app/presentation/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SlidesShowProvider extends ConsumerStatefulWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final Color backgroundColor;
  final double bulletPrimario;
  final double bulletSecundario;
  
  const SlidesShowProvider({
    super.key, 
    required this.slides,
    this.puntosArriba = false, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey, 
    this.backgroundColor = Colors.transparent,
    this.bulletPrimario = 12,
    this.bulletSecundario= 12,
  });

  @override
  SlidesShowState createState() => SlidesShowState();
}

class SlidesShowState extends ConsumerState<SlidesShowProvider> {

  @override
  void initState() {
    super.initState();
    
    Future.microtask(() {
      ref.read(pageProvider.notifier).loadValues(
        widget.puntosArriba,
        widget.colorPrimario,
        widget.colorSecundario,
        widget.backgroundColor,
        widget.bulletPrimario,
        widget.bulletSecundario
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    final page = ref.watch(pageProvider);

    return Scaffold(
      backgroundColor: page.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (widget.puntosArriba) _Dots(widget.slides.length),
              
              Expanded(
                child: _Slides(widget.slides)
              ),

              if (!widget.puntosArriba) _Dots(widget.slides.length),
      
            ],
      
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends ConsumerWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context, ref) {

    final page = ref.watch(pageProvider);

    final tamano = (page.currentPage >= index -0.5 && page.currentPage < index + 0.5)
      ? page.bulletPrimario
      : page.bulletSecundario;

    return Container(
      width: tamano,
      height: tamano,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (page.currentPage >= index -0.5 && page.currentPage < index + 0.5)
          ? page.colorPrimario 
          : page.colorSecundario,
      ),
    );
  }
}


class _Slides extends ConsumerStatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  _SlidesState createState() => _SlidesState();
}

class _SlidesState extends ConsumerState<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    
    pageViewController.addListener(() {
      if ( pageViewController.page == null ) return;
      ref.read(pageProvider.notifier).changePage(pageViewController.page!);
    });

  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList()
      ),
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