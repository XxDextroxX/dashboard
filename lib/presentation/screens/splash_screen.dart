import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    final useCaseAuth = ref.read(registerUserProvider.notifier);
    await useCaseAuth.checkStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LoadingAnimationWidget.threeArchedCircle(
                size: 200, color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(height: 60),
          const Text(
            'Verificando sesión....',
            style: TextStyle(fontSize: 25, fontFamily: 'NimbusSans'),
          ),
        ],
      ),
    );
  }
}
