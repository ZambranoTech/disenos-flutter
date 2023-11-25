
import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only( 
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter()
      ),
    );
  }
}


class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, size.height * 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter()
      ),
    );
  }
}


class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);



    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter()
      ),
    );
  }
}


class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}


class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter()
      ),
    );
  }
}


class _HeaderCurvoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo( size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    // path.quadraticBezierTo( size.width * 0.5, size.height * 0.20, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(colors: colors)
      ),
    );
  }
}


class _HeaderWavePainter extends CustomPainter{

  final ColorScheme colors;

  _HeaderWavePainter({required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades
    paint.color = colors.primary;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo( size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo( size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter()
      ),
    );
  }
}


class _HeaderWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 100.0), 
      radius: 180
    );

    final Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.pink.shade300,
        Colors.purple,
        Colors.pink,
      ],
      stops: const [
        0.2,
        0.1,
        1.0
      ]
    );
    
    final paint = Paint()
      ..shader = gradiente.createShader(rect);

    // Propiedades
    // paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo( size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo( size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String subtitle;
  final String title;
  final Color color1;
  final Color color2;

  const IconHeader({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.subtitle , 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground(color1, color2),

        const Positioned(
          top: 40,
          right: 20,
          child: Icon(Icons.more_vert_rounded, color: Colors.white, size: 30,)
        ),

        Positioned(
          top: -60,
          left: -90,
          child: Icon(
            icon,
            color: Colors.white.withOpacity(0.2),
            size: 250,
          )
        ),

        Column(
          children: [
              const SizedBox(height: 80, width: double.infinity,),
              Text('Haz solicitado', style: TextStyle(fontSize: 20, color: colorBlanco ),),
              const SizedBox(height: 20,),
              Text('Asistencia Médica', style: TextStyle(fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold ),),
              const SizedBox(height: 10,),
              Icon( icon, color: Colors.white, size: 100,)
          ],
        )

      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2,
          ]
        ),

      ),
    );
  }
}
