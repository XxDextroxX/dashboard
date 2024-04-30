import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends ConsumerStatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  DrawerWidgetState createState() => DrawerWidgetState();
}

class DrawerWidgetState extends ConsumerState<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(indexHomePageProvider);
    final indexIntance = ref.watch(indexHomePageProvider.notifier);
    final userModel = UserModel.instance();
    final user = userModel.getData();
    return NavigationDrawer(
        elevation: 1,
        selectedIndex: index,
        onDestinationSelected: (value) {
          indexIntance.changeIndex(value);
          _getRoute(value);
        },
        children: [
          HeaderDrawer(
            userModel: user,
          ),
          ..._items(),
        ]);
  }

  void _getRoute(
    int index,
  ) {
    if (index != 4) {
      Navigator.of(context).pop();
    }
    switch (index) {
      case 0:
        context.push(PathRouter.controlExpenses);
      case 1:
        context.push(PathRouter.ordersBuys);
        break;
      case 2:
        context.push(PathRouter.editProfile);
      case 3:
        context.push(PathRouter.theme);
        break;
      case 4:
        CustomDialogs.generalDialog(
          context: context,
          title: 'Cerrar Sesión',
          content: '¿Desea cerrar sesión?',
          onPressed: () async {
            await GeneralUtils.logout(context);
            CustomDialogs.generalDialog(
              // ignore: use_build_context_synchronously
              context: context,
              title: 'Cerrar Sesión',
              content: '¿Desea cerrar sesión?',
              onPressed: () {
                GeneralUtils.logout(context);
              },
            );
          },
        );
        break;
      default:
    }
  }

  List<Widget> _items() {
    return [
      const NavigationDrawerDestination(
        label: Text('Control de gastos'),
        icon: Icon(Icons.attach_money),
      ),
      const NavigationDrawerDestination(
        label: Text('Ordenes de compra'),
        icon: Icon(Icons.shopping_cart),
      ),
      const NavigationDrawerDestination(
        label: Text('Perfil'),
        icon: Icon(Icons.person),
      ),
      const NavigationDrawerDestination(
        label: Text('Tema'),
        icon: Icon(Icons.palette),
      ),
      const NavigationDrawerDestination(
        label: Text('Cerrar Sesión'),
        icon: Icon(Icons.exit_to_app),
      ),
    ];
  }
}
