import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class ForgetPasswordPage extends ConsumerStatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  ForgetPasswordPageState createState() => ForgetPasswordPageState();
}

class ForgetPasswordPageState extends ConsumerState<ForgetPasswordPage> {
  late final LoadingButtonController _btnController;

  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final passwordIntance =
        ref.watch(validatePasswordRecoveryProvider.notifier);
    final password = ref.watch(validatePasswordRecoveryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar contraseña'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInputs(
              errorText: password.errorMessage,
              hintText: 'Ingrese su correo electronico',
              prefixIcon: const Icon(
                Icons.email,
              ),
              suffixIcon: null,
              onChanged: passwordIntance.setEmail,
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomLoadingButton(
                    primaryColor: Theme.of(context).primaryColor,
                    text: 'ENVIAR',
                    icon: Icons.send,
                    btnController: _btnController,
                    onPressed: () async {
                      await passwordIntance.getCode(context);
                      _btnController.success();
                      _btnController.reset();
                    })),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya tienes un token?'),
                TextButton(
                    onPressed: () {
                      context.push(PathRouter.resetPassword);
                    },
                    child: const Text('Toca aquí'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
