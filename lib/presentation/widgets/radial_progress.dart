import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress({
    super.key, 
    required this.porcentaje, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey,
    this.grosorPrimario = 10,
    this.grosorSecundario = 4
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with TickerProviderStateMixin {
  
  late AnimationController controller;
  late double porcentajeAnterior;
  
  @override
  void initState() {
    super.initState();
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    print('$porcentajeAnterior - ${widget.porcentaje} - $diferenciaAnimar');
    porcentajeAnterior = widget.porcentaje;
    
    return AnimatedBuilder(
      animation: controller, 
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(8),
          width: 180,
          height: 180,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress( 
            ((widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value)), 
            widget.colorPrimario, 
            widget.colorSecundario,
            widget.grosorPrimario,
            widget.grosorSecundario
          ),
          ),
        );
      },
    );

    
  }

}

class _MiRadialProgress extends CustomPainter {

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;



  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario
    );


  @override
  void paint(Canvas canvas, Size size) {

    //Circulo Completado
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Gradiente Arco
    Gradient gradiente = LinearGradient(
      colors: [
        colorPrimario,
        Colors.orange,
        Colors.purple
      ],
      stops: const [
        0.5,
        0.7,
        1
      ]
    );

    Rect rect = Rect.fromCircle(
      center: const Offset(0, 0), 
      radius: 180,

    );


    // arco
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke
      ..shader      = gradiente.createShader(rect) 
      ..color       = colorPrimario;

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
