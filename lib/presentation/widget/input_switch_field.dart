// import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';
//
// class InputSwitchField extends StatelessWidget {
//   final String title;
//   final TextStyle titleStyle;
//   final double space;
//   final double textLength;
//   final bool status;
//   final Function(bool) onChange;
//   const InputSwitchField({
//     Key? key,
//     required this.title,
//     this.titleStyle =
//         const TextStyle(fontSize: 12),
//     this.space = 20,
//     this.textLength = 190,
//     required this.status,
//     required this.onChange,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: textLength,
//           child: Text(
//             title,
//             style: titleStyle,
//           ),
//         ),
//         SizedBox(width: space),
//         FlutterSwitch(
//           width: 30.0,
//           height: 15.0,
//           valueFontSize: 0.0,
//           toggleSize: 10.0,
//           value: status,
//           borderRadius: 30.0,
//           padding: 2.0,
//           showOnOff: true,
//           onToggle: (val) => onChange(val),
//         ),
//       ],
//     );
//   }
// }
