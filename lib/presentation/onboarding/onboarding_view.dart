import 'package:clean_architecture/presentation/resources/constanta_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onboardingTitle1,
            AppStrings.onboardingSupTitle1, ImageAssets.onboardingImage1),
        SliderObject(AppStrings.onboardingTitle2,
            AppStrings.onboardingSupTitle2, ImageAssets.onboardingImage2),
        SliderObject(AppStrings.onboardingTitle3,
            AppStrings.onboardingSupTitle3, ImageAssets.onboardingImage3),
        SliderObject(AppStrings.onboardingTitle4,
            AppStrings.onboardingSupTitle4, ImageAssets.onboardingImage4),
      ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: _list.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(_list[index]);
            }),
        bottomSheet: Container(
            color: ColorManager.white,
            // height: AppSize.s100,
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppPadding.p8),
                    child: TextButton(
                        onPressed: () {
                          print("OP");
                        },
                        child: Text(
                          AppStrings.skip,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.displayMedium,
                        )),
                  )),
              _getBottomSheetWidget()
            ])),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(getPreviousIndex(),
                      duration: Duration(
                          milliseconds: AppConstants.sliderAnimationTime),
                      curve: Curves.bounceInOut);
                },
                child: SizedBox(
                    width: AppSize.s20,
                    height: AppSize.s20,
                    child: SvgPicture.asset(
                      ImageAssets.leftArrowIcon,
                    ))),
          ),
          for (int i = 0; i < _list.length; i++) ...[
            Padding(
              padding: EdgeInsets.all(AppPadding.p8),
              child: _getProperCircle(i),
            )
          ],
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(getNextIndex(),
                      duration: Duration(
                          milliseconds: AppConstants.sliderAnimationTime),
                      curve: Curves.bounceInOut);
                },
                child: SizedBox(
                    width: AppSize.s20,
                    height: AppSize.s20,
                    child: SvgPicture.asset(
                      ImageAssets.rightArrowIcon,
                    ))),
          )
        ],
      ),
    );
  }

  int getPreviousIndex() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int getNextIndex() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIcon);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIcon);
    }
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}
