import 'package:disenos_app/presentation/providers/navigation_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class PinterestMasonry extends StatelessWidget {
  const PinterestMasonry({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PinterestGrid(),
     ),
   );
  }
}

class PinterestGrid extends ConsumerStatefulWidget {
  const PinterestGrid({super.key});

  @override
  PinterestGridState createState() => PinterestGridState();
}

class PinterestGridState extends ConsumerState<PinterestGrid> {

  final List<int> items = List.generate(200, (index) => index);
  final scrollController = ScrollController();
  double lastScroll = 0;


  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      double currentScroll = scrollController.position.pixels;
      
      ref.read(navigationProvider.notifier).changeShow(
        shouldShowNavigation(currentScroll, lastScroll)
      );
    
      lastScroll = scrollController.position.pixels;
      
    });

  }

  bool shouldShowNavigation(double currentScroll, double lastScroll) {
    return currentScroll < lastScroll;
  }



  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return GridView.custom(
      physics: const ClampingScrollPhysics(),
      controller: scrollController,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [
          QuiltedGridTile(3, 2),
          QuiltedGridTile(2, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _PinterestItem(index: index,),
        childCount: items.length
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ),
      ),
    );
  }
}