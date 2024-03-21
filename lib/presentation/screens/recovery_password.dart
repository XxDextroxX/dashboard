import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}

class ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  late final LoadingButtonController _btnController;

  bool isVisiblePassword = true;
  bool isVisibleConfirmPassword = true;

  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resetPassword = ref.watch(resetPasswordProvider);
    final resetPasswordInstance = ref.watch(resetPasswordProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reiniciar contraseña'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomInputs(
              errorText: resetPassword.code.errorMessage,
              hintText: 'Ingrese su codigo de verificación',
              prefixIcon: const Icon(
                Icons.token,
              ),
              suffixIcon: null,
              onChanged: resetPasswordInstance.setCode,
            ),
            const SizedBox(height: 20),
            CustomInputs(
              errorText: resetPassword.password.errorMessage,
              maxLines: 1,
              obscureText: isVisiblePassword,
              hintText: 'Ingrese su nueva contraseña',
              prefixIcon: const Icon(
                Icons.password,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisiblePassword = !isVisiblePassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  )),
              onChanged: resetPasswordInstance.setPassword,
            ),
            const SizedBox(height: 20),
            CustomInputs(
              maxLines: 1,
              obscureText: isVisibleConfirmPassword,
              errorText: resetPassword.confirmPassword.value !=
                      resetPassword.password.value
                  ? 'Las contraseñas no coinciden'
                  : null,
              hintText: 'Confirme su nueva contraseña',
              prefixIcon: const Icon(
                Icons.lock,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisibleConfirmPassword = !isVisibleConfirmPassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  )),
              onChanged: resetPasswordInstance.setConfirmPassword,
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
                      await resetPasswordInstance.resetPassword(context);
                      _btnController.success();
                      _btnController.reset();
                    })),
          ],
        ),
      ),
    );
  }
}
