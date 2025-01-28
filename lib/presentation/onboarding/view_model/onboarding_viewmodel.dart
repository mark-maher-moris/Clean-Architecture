import 'dart:async';

import 'package:clean_architecture/domain/models.dart';
import 'package:clean_architecture/presentation/base/base_view_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewmodelInputs, OnboardingViewmodelOutputs {
  StreamController _streamController = StreamController<SliderViewObject>();
  int _currentIndex = 0;

  late final List<SliderObject> _list;

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_currentIndex, _list.length, _list[_currentIndex]));
  }

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
  void test() {}
}

mixin OnboardingViewmodelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}
mixin OnboardingViewmodelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
