import 'package:flutter/material.dart';


class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          )
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
      ),
      child: MaterialButton(
        color: Colors.red.shade300,
        onPressed: () {},
        child: const Text('Create New List', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 3),),
      )
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({super.key});


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   title: Text('Hola mundo'),
        //   backgroundColor: Colors.red,
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 170,
            maxheight: 200,
            child: Container(
              alignment: Alignment.topLeft,
              color: colors.background,
              child: const _Titutlo(),
            )
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100,)
          ])
        )

      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight, 
    required this.maxheight, 
    required this.child
  });


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight  || 
           minheight != oldDelegate.minheight  ||
           child     != oldDelegate.child;
  }



}

class _ListaTareas extends StatelessWidget {

    final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]
      )
       );
  }
}

class _Titutlo extends StatelessWidget {
  const _Titutlo();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('New', style: TextStyle(fontSize: 45),),
            
            Stack(
              children: [
                const SizedBox(width: 100,),
                Positioned(
                  bottom: 14,
                  child: Container(
                    width: 160,
                    height: 6,
                    color: Colors.red.withOpacity(0.3),
                  ),
                ),

                Text('List', style: TextStyle(fontSize: 45, color: Colors.red.shade700, fontWeight: FontWeight.bold ),),
                

              ]
              
              )
          ],
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {

  final String text;
  final Color color;


  const _ListItem(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(text, style: const TextStyle(color:  Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      padding: const EdgeInsets.all(30),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}