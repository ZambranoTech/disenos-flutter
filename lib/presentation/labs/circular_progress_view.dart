import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressView extends StatefulWidget {
  const CircularProgressView({super.key});

  @override
  State<CircularProgressView> createState() => _CircularProgressViewState();
}

class _CircularProgressViewState extends State<CircularProgressView> with TickerProviderStateMixin{

  late AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800)
    );

    controller.addListener(() {
      
      // print('valor controller: ${controller.value}');
      setState(() {
      porcentaje  = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });

    });
    
    super.initState();
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress( porcentaje ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          
          nuevoPorcentaje += 10;
          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          controller.forward( from: 0.0 );

          setState(() {});
        },
        child: const Icon(Icons.refresh_outlined, color: Colors.white,),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final double porcentaje;

  _MiRadialProgress(this.porcentaje);


  @override
  void paint(Canvas canvas, Size size) {

    //Circulo Completado
    final paint = Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * ( porcentaje / 100 );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintArco
    );


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}