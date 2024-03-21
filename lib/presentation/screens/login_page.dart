import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: size.width,
                  height: size.height,
                  color: Theme.of(context).primaryColor,
                )),
            Positioned(
              left: 80,
              top: 100,
              child: _lottieAssets(AssetsName.dashboard, 250),
            ),
            _container(size),
          ],
        ),
      ),
    );
  }

  Widget _lottieAssets(String path, double height) {
    return Lottie.asset(
      path,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget _container(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
      child: CustomPaint(
          painter: _BackgroundPainter(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.5,
                ),
                const _Forms(),
              ],
            ),
          )),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // paint.color = Colors.black;
    paint.color = Colors.white.withOpacity(0.1);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    final path = Path();
    path.lineTo(0, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.50,
        size.width * 0.5, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.40, size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _Forms extends ConsumerStatefulWidget {
  const _Forms();

  @override
  FormsState createState() => FormsState();
}

class FormsState extends ConsumerState<_Forms> {
  bool obscureText = true;
  bool obscureTextRepeat = true;
  late final LoadingButtonController _btnController;

  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authUser = ref.watch(registerUserProvider);
    final authUserInstance = ref.watch(registerUserProvider.notifier);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomInputs(
            colorStyle: Colors.white,
            errorText: authUser.email.errorMessage,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Correo electronico',
            prefixIcon: const Icon(
              Icons.email_outlined,
            ),
            onChanged: authUserInstance.setEmail,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomInputs(
              obscureText: obscureText,
              colorStyle: Colors.white,
              maxLines: 1,
              errorText: authUser.password.errorMessage,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Contraseña',
              prefixIcon: const Icon(Icons.password),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: obscureText
                      ? Colors.white
                      : Theme.of(context).primaryColorDark,
                ),
              ),
              onChanged: authUserInstance.setPassword),
          const SizedBox(
            height: 20,
          ),
          _buttonLogin(authUserInstance),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    context.push(PathRouter.forgetPassword);
                  },
                  child: const Text('¿Olvidastes tu contraseña?',
                      style: TextStyle(
                        color: Colors.white,
                      )))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttonLogin(RegisterUser authUserInstance) {
    return CustomLoadingButton(
        primaryColor: Colors.transparent,
        color: Colors.white,
        text: 'Login',
        icon: Icons.login,
        btnController: _btnController,
        onPressed: () async {
          await authUserInstance.login(context);
          _btnController.success();
          _btnController.reset();
        });
  }
}
