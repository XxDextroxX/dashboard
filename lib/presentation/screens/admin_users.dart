import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class AdminUsers extends ConsumerStatefulWidget {
  const AdminUsers({super.key});

  @override
  AdminUsersState createState() => AdminUsersState();
}

class AdminUsersState extends ConsumerState<AdminUsers> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    final listUsersIntance = ref.read(listUsersProvider.notifier);
    await listUsersIntance.setUsersList(context);
  }

  @override
  Widget build(BuildContext context) {
    final listUsers = ref.watch(listUsersProvider);
    final listUsersIntance = ref.watch(listUsersProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Administrar Usuarios'),
          actions: [
            IconButton(
              onPressed: () async {
                await listUsersIntance.setUsersList(context);
              },
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () {
                CustomDialogs.generalDialog(
                  context: context,
                  title: 'Cerrar Sesión',
                  content: '¿Desea cerrar sesión?',
                  onPressed: () async {
                    await GeneralUtils.logout(context);
                  },
                );
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _adminUsers(context);
            },
            child: const Icon(Icons.add)),
        body: listUsers.isEmpty
            ? const Center(child: Text('No hay usuarios'))
            : ListView.builder(
                itemCount: listUsers.length,
                itemBuilder: (context, index) {
                  return ViewUsers(
                    model: listUsers[index],
                  );
                }));
  }

  _adminUsers(
    BuildContext context,
  ) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.6,
              child: _Forms());
        });
  }
}

class _Forms extends ConsumerStatefulWidget {
  const _Forms({super.key});

  @override
  FormsStateRegister createState() => FormsStateRegister();
}

class FormsStateRegister extends ConsumerState<_Forms> {
  late final LoadingButtonController _btnController;
  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listCenters = ref.watch(listCenterCostsProvider(context));
    final registerUsersInstance = ref.watch(registerUsersProvider.notifier);
    final listUsersIntance = ref.watch(listUsersProvider.notifier);
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CustomInputs(
          hintText: 'Email',
          prefixIcon: const Icon(
            Icons.email,
          ),
          onChanged: registerUsersInstance.changeEmail,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomInputs(
          hintText: 'Nombre',
          prefixIcon: const Icon(
            Icons.person,
          ),
          onChanged: registerUsersInstance.changeName,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: DropDownSearch(
            showSearchBox: false,
            selectedItem: 'Seleccione Rol',
            items: const [
              'admin',
              'supervisor',
            ],
            labelText: 'Rol',
            onChanged: (value) {
              registerUsersInstance.changeRole(value ?? 'Administrador');
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: listCenters.when(
              data: (data) => DropDownSearch<String>(
                    showSearchBox: true,
                    selectedItem: 'Seleccione Centro',
                    items: (data['centers'] as List<CenterCosts>)
                        .map((e) => e.descripcionCuenta ?? '')
                        .toList(),
                    dropdownBuilder: (BuildContext context, String? item) {
                      return Text(item ?? '');
                    },
                    labelText: 'Centro de Costos',
                    onChanged: (value) {
                      final listCenters = data['centers'] as List<CenterCosts>;
                      final center = listCenters.firstWhere(
                          (element) => element.descripcionCuenta == value);
                      registerUsersInstance
                          .changeLinkedCenterCodemp(center.codigoEmpresa ?? '');
                      registerUsersInstance.changeLinkedCenterCodcuenta(
                          center.codigoCuenta ?? '');
                    },
                  ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator()),
        ),
        const SizedBox(
          height: 20,
        ),
        _butonCreateActive(context, registerUsersInstance, listUsersIntance),
      ],
    );
  }

  Widget _butonCreateActive(BuildContext context,
      RegisterUsers registerUsersInstance, ListUsers listUsersIntance) {
    return CustomLoadingButton(
        primaryColor: Theme.of(context).primaryColor,
        color: Colors.white,
        text: 'Crear activo',
        icon: Icons.add,
        btnController: _btnController,
        onPressed: () async {
          final response = await registerUsersInstance.createUser(context);
          if (response) {
            // ignore: use_build_context_synchronously
            await listUsersIntance.setUsersList(context);
            _btnController.success();
          }
          _btnController.reset();
        });
  }
}
