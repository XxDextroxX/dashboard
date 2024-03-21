import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
        actions: [
          IconButton(
            onPressed: () {
              CustomDialogs.generalDialog(
                context: context,
                title: 'Cerrar Sesión',
                content: '¿Desea cerrar sesión?',
                onPressed: () {
                  GeneralUtils.logout(context);
                },
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      // drawer: const CustomDrawer(),
      body: const _FormProfile(),
    );
  }
}

class _FormProfile extends ConsumerStatefulWidget {
  const _FormProfile({super.key});

  @override
  FormProfileState createState() => FormProfileState();
}

class FormProfileState extends ConsumerState<_FormProfile> {
  late final LoadingButtonController _btnController;
  bool isVisibleOldPassword = true;
  bool isVisibleNewPassword = true;

  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = UserModel.instance();
    final registerUserIntance = ref.watch(registerUserProvider.notifier);
    final changePassword = ref.watch(changeNewPasswordProvider);
    final changePasswordIntance = ref.watch(changeNewPasswordProvider.notifier);
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomInputs(
                initialValue: userModel.name,
                errorText: null,
                hintText: 'Nombre',
                prefixIcon: const Icon(
                  Icons.person,
                ),
                onChanged: (value) {
                  userModel.name = value;
                }),
            const SizedBox(
              height: 20,
            ),
            CustomInputs(
                initialValue: userModel.lastName,
                errorText: null,
                hintText: 'Apellido',
                prefixIcon: const Icon(
                  Icons.person,
                ),
                onChanged: (value) {
                  userModel.lastName = value;
                }),
            const SizedBox(
              height: 20,
            ),
            const Text('Advertencia:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Llene estos campos solo si desea actualizar su contraseña.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            CustomInputs(
              maxLines: 1,
              obscureText: isVisibleOldPassword,
              hintText: 'Antigua contraseña',
              prefixIcon: const Icon(
                Icons.password,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisibleOldPassword = !isVisibleOldPassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  )),
              errorText: changePassword.oldPassword?.errorMessage,
              onChanged: changePasswordIntance.setOldPassword,
            ),
            const SizedBox(height: 20),
            CustomInputs(
              maxLines: 1,
              obscureText: isVisibleNewPassword,
              hintText: 'Nueva contraseña',
              prefixIcon: const Icon(
                Icons.lock,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisibleNewPassword = !isVisibleNewPassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  )),
              errorText: changePassword.password?.errorMessage,
              onChanged: changePasswordIntance.setPassword,
            ),
            const SizedBox(
              height: 20,
            ),
            _buttonUpdateUser(context, registerUserIntance, changePassword,
                changePasswordIntance),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonUpdateUser(
      BuildContext context,
      RegisterUser registerUserIntance,
      ChangePassword changePassword,
      ChangeNewPassword changePasswordIntance) {
    return CustomLoadingButton(
        primaryColor: Theme.of(context).primaryColor,
        color: Colors.white,
        text: 'Guardar',
        icon: Icons.save,
        btnController: _btnController,
        onPressed: () async {
          final userModel = UserModel.instance();
          if (userModel.name != null && userModel.lastName != null) {
            final usersModel =
                UsersModel(name: userModel.name, lastName: userModel.lastName);
            if (changePassword.oldPassword?.value == null &&
                changePassword.password?.value == null) {
              await registerUserIntance.updateUser(
                  usersModel, context, changePasswordIntance);
            } else {
              await registerUserIntance.updateUser(
                  usersModel, context, changePasswordIntance,
                  oldPassword: changePassword.oldPassword?.value,
                  password: changePassword.password?.value);
              // changePasswordIntance.reset();
            }
          } else {
            // ignore: use_build_context_synchronously
            AnimatedSnackBar.material('Los campos no pueden estar vacios',
                    type: AnimatedSnackBarType.error,
                    mobileSnackBarPosition: MobileSnackBarPosition.bottom)
                .show(context);
          }
          _btnController.success();
          _btnController.reset();
        });
  }
}
