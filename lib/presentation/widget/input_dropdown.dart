import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  final List<String> items;
  final String? hint;
  final Function(String?) onChange;
  final String? value;
  const InputDropdown(
      {Key? key,
      required this.items,
      this.hint,
      required this.onChange,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: DropdownButtonFormField2(
        isExpanded: true,
        hint: Text(
          hint ?? "",
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 25,
        buttonHeight: 45,
        buttonPadding: const EdgeInsets.only(left: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style:  const TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black),
                  ),
                ))
            .toList(),
        value: value,
        validator: (value) {
          return null;
        },
        onChanged: onChange,
        style: const TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black),
        onSaved: (value) {},
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
