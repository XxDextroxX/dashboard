import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewUsers extends ConsumerStatefulWidget {
  const ViewUsers({super.key, required this.model});
  final UsersModel model;

  @override
  ViewUsersState createState() => ViewUsersState();
}

class ViewUsersState extends ConsumerState<ViewUsers> {
  @override
  Widget build(BuildContext context) {
    final listUsersIntance = ref.watch(listUsersProvider.notifier);
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(widget.model.name ?? ''),
      subtitle: Text('Rol: ${widget.model.role}'),
      trailing: Switch(
          value: !widget.model.isDeleted!,
          onChanged: (value) {
            if (value) {
              CustomDialogs.generalDialog(
                context: context,
                title: 'Activar Usuario',
                content: '¿Desea activar el usuario?',
                onPressed: () async {
                  final response = await listUsersIntance.adminUser(
                      widget.model.email ?? '', value, context);
                  if (response) {
                    // ignore: use_build_context_synchronously
                    await listUsersIntance.setUsersList(context);
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              );
            } else {
              CustomDialogs.generalDialog(
                context: context,
                title: 'Desactivar Usuario',
                content: '¿Desea desactivar el usuario?',
                onPressed: () async {
                  final response = await listUsersIntance.adminUser(
                      widget.model.email ?? '', value, context);
                  if (response) {
                    // ignore: use_build_context_synchronously
                    await listUsersIntance.setUsersList(context);
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              );
            }
          }),
    );
  }
}
