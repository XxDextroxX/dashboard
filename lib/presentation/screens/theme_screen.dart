import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeScreen extends ConsumerWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tema'),
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text('Tema por defecto',
                  style: Theme.of(context).textTheme.titleLarge),
              trailing: IconButton.filledTonal(
                  onPressed: () {
                    theme.setSeedColor(const Color(0xFF01579B));
                    GeneralUtils.setColorTheme(0xFF01579B);
                  },
                  icon: const Icon(Icons.color_lens)),
            ),
            ListTile(
              title: Text('Cambiar tema',
                  style: Theme.of(context).textTheme.titleLarge),
              trailing: IconButton.filledTonal(
                  onPressed: () {
                    _selectColor(theme, context);
                  },
                  icon: const Icon(Icons.color_lens)),
            ),
          ],
        ));
  }

  _selectColor(AppTheme theme, BuildContext context) {
    showModalBottomSheet(
        // isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialColorPicker(
                physics: const NeverScrollableScrollPhysics(),
                allowShades: true,
                colors: fullMaterialColors,
                onColorChange: (color) async {
                  theme.setSeedColor(color);
                  await GeneralUtils.setColorTheme(color.value);
                },
                selectedColor: Colors.blue,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: GeneralUtils.customButton(Theme.of(context).primaryColor,
                    Colors.transparent, 'Aceptar'),
              )
            ],
          );
        });
  }
}
