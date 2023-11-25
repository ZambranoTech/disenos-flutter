import 'package:disenos_app/presentation/providers/app_theme_provider.dart';
import 'package:disenos_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final theme = ref.watch(appThemeProvider);

    return  Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const _Avatar(),
            const SizedBox(height: 20,),
            const Expanded(child: ListMenuItems()),
            ListTile(
              leading: const Icon(Icons.lightbulb_outline),
              title: const Text('Modo Oscuro'),
              trailing: Switch(
                value: theme.isDarkMode, 
                onChanged: (value) {
                  ref.read(appThemeProvider.notifier).toggleDarkMode();
                }
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_to_home_screen_outlined),
              title: const Text('Tema Custom'),
              trailing: Switch(
                value: theme.isCustomTheme, 
                onChanged: (value) {
                  ref.read(appThemeProvider.notifier).toggleCustomTheme();
                }
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 200,
      child: CircleAvatar(
        child: Text(
          'JGZ',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
