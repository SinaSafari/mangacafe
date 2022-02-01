import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:mangacafe_v2/router/app_router.dart';
import 'package:mangacafe_v2/modules/intro/constants.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final List<Slide> slides = [
    Slide(
      title: IntroConstants.slideOneTitle,
      description: IntroConstants.slideOneDescription,
      pathImage: IntroConstants.slideOneImage,
    ),
    Slide(
      title: IntroConstants.slideTwoTitle,
      description: IntroConstants.slideTwoDescription,
      pathImage: IntroConstants.slideTwoImage,
    ),
    Slide(
      title: IntroConstants.slideThreeTitle,
      description: IntroConstants.slideThreeDescription,
      pathImage: IntroConstants.slideThreeImage,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntroSlider(
        backgroundColorAllSlides: Colors.red[700],
        renderSkipBtn: const Text(IntroConstants.skipBtnTitle),
        renderNextBtn: const Text(
          IntroConstants.nextBtnTitle,
          style: TextStyle(color: Colors.white),
        ),
        renderDoneBtn: Text(
          IntroConstants.doneBtnTitle,
          style: TextStyle(color: Colors.red[700]),
        ),
        doneButtonStyle: myButtonStyle(),
        skipButtonStyle: myButtonStyle(),
        // colorDoneBtn: Colors.white,
        colorActiveDot: Colors.white,
        sizeDot: 8.0,
        typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
        listCustomTabs: renderListCustomTabs(),
        scrollPhysics: const BouncingScrollPhysics(),
        onDonePress: () {
          Navigator.of(context).pushReplacementNamed(AppRouter.homeScreen);
        },
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    currentSlide.pathImage!,
                    matchTextDirection: true,
                    height: 60,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    currentSlide.title!,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor: MaterialStateProperty.all<Color>(Colors.red),
    );
  }
}
