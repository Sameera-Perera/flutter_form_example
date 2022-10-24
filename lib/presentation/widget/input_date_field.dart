import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_demo/core/extensions/date_time_extension.dart';

class InputDateField extends StatelessWidget {
  final DateTime? date;
  final Function(DateTime date) onChange;
  final String? hint;
  const InputDateField(
      {Key? key, this.date,
      required this.onChange,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          currentTime: date,
          onConfirm: (time) => onChange(time),
        );
      },
      child: Container(
        height: 45,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            date == null ? hint??"": date!.formatDate(),
            style: date == null? const TextStyle(fontWeight: FontWeight.w200, fontSize: 11): const TextStyle(
                fontSize: 12.0, height: 2.0, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
