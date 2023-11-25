import 'package:disenos_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter - Teléfono'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: const ListMenuItems(),
    );
  }
}

