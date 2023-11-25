import 'package:disenos_app/presentation/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularScreen extends StatefulWidget {
  const GraficasCircularScreen({super.key});

  @override
  State<GraficasCircularScreen> createState() => _GraficasCircularScreenState();
}

class _GraficasCircularScreenState extends State<GraficasCircularScreen> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RadialProgress( porcentaje: porcentaje, grosorPrimario: 10, grosorSecundario: 4, colorPrimario: Colors.purple, ),
                RadialProgress( porcentaje: porcentaje, grosorPrimario: 10, grosorSecundario: 4, colorPrimario: Colors.orange, ),
              ],
            ),
            const SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RadialProgress( porcentaje: porcentaje, grosorPrimario: 10, grosorSecundario: 4, colorPrimario: Colors.red, ),
                RadialProgress( porcentaje: porcentaje, grosorPrimario: 10, grosorSecundario: 4, colorPrimario: Colors.blue, ),
              ],
            )
            
      
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;

            if (porcentaje > 100 ) {
              porcentaje = 0;
            }

          });

        },
        child: const Icon(Icons.refresh),
        
      ),
    );
  }
}