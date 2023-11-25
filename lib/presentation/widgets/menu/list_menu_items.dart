import 'package:disenos_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListMenuItems extends StatelessWidget {
  const ListMenuItems({super.key});

  @override
  Widget build(BuildContext context) {

    const items = appMenuItems;

    final colors = Theme.of(context).colorScheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(
        color: colors.primary,
      ),
      itemBuilder: (BuildContext context, int index) {  
        final item = items[index];

        return _Item(item: item);
      },

      
      
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Icon(item.icon),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(item.title),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: () => context.push(item.link)
    );
  }
}