import 'package:birindirm_deneme/screens/splash_view/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashViewModel>().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [FlutterLogo(), Center(child: CircularProgressIndicator())],
        ),
      ),
    );
  }
}
