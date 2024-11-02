import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/app_style.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({super.key, required this.hintText, this.onSelected, required this.dropdownMenuEntries, this.initialSelection});
  final String hintText ;
  final void Function(String?)? onSelected;
  final String? initialSelection;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;

  @override
  Widget build(BuildContext context) {
    return   DropdownMenu<String>(
        width: MediaQuery.of(context).size.width * 0.45,
        initialSelection:initialSelection,
        hintText: '${hintText}'.tr,
        textStyle: textStyle.Bold16,
        inputDecorationTheme: InputDecorationTheme(
            border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
            )
        ),
        onSelected: onSelected,
        dropdownMenuEntries:dropdownMenuEntries

    );
  }
}
