// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:intl/intl.dart';
//
// class InputTimeField extends StatelessWidget {
//   final DateTime date;
//   final Function(DateTime date) onChange;
//   final bool isEnable;
//
//   const InputTimeField({
//     Key? key,
//     required this.date,
//     required this.onChange,
//     this.isEnable = true,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (!isEnable) {
//           DatePicker.showTimePicker(context,
//               showTitleActions: true,
//               currentTime: date,
//               locale: LocaleType.it,
//               onConfirm: (time) => onChange(time));
//         }
//       },
//       child: Container(
//         height: 50,
//         alignment: Alignment.centerLeft,
//         decoration: BoxDecoration(
//           border: Border.all(width: 1, color: Colors.grey.shade300),
//           color: isEnable ? Colors.grey.shade100 : null,
//           borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Text(
//             DateFormat('hh:mm').format(date),
//             style: const TextStyle(
//                 fontSize: 12.0, height: 2.0, color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }
