import 'package:disenos_app/presentation/providers/app_layout_tablet_provider.dart';
import 'package:disenos_app/presentation/screens/screens.dart';
import 'package:disenos_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTabletScreen extends ConsumerWidget {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

     final colors = Theme.of(context).colorScheme;
    
    final layout = ref.watch(appLayoutProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter - Tablet'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: Row(
        children: [
          const SizedBox(
            width: 300,
            height: double.infinity,
            child: ListMenuItems(),
          ),

          Container(
            width: 1,
            height: double.infinity,
            color: colors.secondary,
          ),

          Expanded(child: layout)
        ],
      ),
    );
  }
}

