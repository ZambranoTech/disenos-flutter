import 'package:disenos_app/presentation/widgets/slides_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool isLarge = false;
    if ( MediaQuery.of(context).size.height > 500 ) {
      isLarge = true;
    } 

    final children = [
      const MiSlidesShow(),
        Expanded(
          child: SlidesShow(
            backgroundColor: Colors.red,
            colorPrimario: Colors.white,
            slides: [
              SvgPicture.asset('assets/svgs/slide-1.svg'),
              SvgPicture.asset('assets/svgs/slide-2.svg'),
              SvgPicture.asset('assets/svgs/slide-3.svg'),
              SvgPicture.asset('assets/svgs/slide-4.svg'),
              SvgPicture.asset('assets/svgs/slide-5.svg'),
            ],
          ),
        ),
    ];

    if (isLarge) {
       return Column(
      children: children,
    );
    }
      return Row(
        children: children,
      );
   
  }
}

class MiSlidesShow extends StatelessWidget {
  const MiSlidesShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlidesShow(
        backgroundColor: Colors.purple,
        colorPrimario: Colors.white,
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}
