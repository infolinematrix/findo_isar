import 'package:flutter/material.dart';

// Widget buildChip(String label, Color color) {
//   return Chip(
//     labelPadding: const EdgeInsets.all(2.0),
//     avatar: CircleAvatar(
//       backgroundColor: Colors.white70,
//       child: Text(label[0].toUpperCase()),
//     ),
//     label: Text(
//       label,
//       style: const TextStyle(
//         color: Colors.white,
//       ),
//     ),
//     backgroundColor: color,
//     elevation: 6.0,
//     shadowColor: Colors.grey[60],
//     padding: const EdgeInsets.all(8.0),
//   );
// }

Chip buildChip(String label, Color color) {
  return Chip(
    labelPadding: const EdgeInsets.all(2.0),
    avatar: CircleAvatar(
      backgroundColor: Colors.white70,
      child: Text(label[0].toUpperCase()),
    ),
    label: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.green,
    elevation: 0.0,
    shadowColor: Colors.grey[60],
    padding: const EdgeInsets.all(8.0),
  );
}
