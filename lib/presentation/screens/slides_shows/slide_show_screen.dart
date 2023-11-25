import 'package:disenos_app/presentation/widgets/slides_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
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
