import 'package:ecommerce_admin/controller/products/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({
    super.key, required this.onChanged,required this.items, this.value, required this.text,
  });

  final void Function(int?)? onChanged;
  final  List<DropdownMenuItem<int>>? items;
  final int? value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          hint: Text(text),
          isExpanded: true,
          isDense: true,
          padding: EdgeInsets.all(8),
          value: value,
          onChanged:onChanged,
          items: items
        ),
      ),
    );
  }
}

