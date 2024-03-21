import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownSearch<T> extends StatelessWidget {
  const DropDownSearch(
      {super.key,
      required this.items,
      required this.labelText,
      this.onChanged,
      this.selectedItem,
      this.dropdownBuilder,
      this.compareFn,
      this.showSearchBox = true});
  final List<T> items;
  final String labelText;
  final void Function(T?)? onChanged;
  final bool showSearchBox;
  final Widget Function(BuildContext, T?)? dropdownBuilder;
  final T? selectedItem;
  final bool Function(T, T)? compareFn;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
        compareFn: compareFn,
        dropdownBuilder: dropdownBuilder,
        popupProps: PopupProps.menu(
            showSelectedItems: true, showSearchBox: showSearchBox),
        items: items,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: labelText,
            hintText: labelText,
          ),
        ),
        onChanged: onChanged,
        selectedItem: selectedItem);
  }
}
