import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Image(image: AssetImage(ImageAssets.splashLogo),),

    );
  }
}