//
// import 'package:flutter/material.dart';
//
// class ProductUtils {
//   static Widget priceText(double unitPrice, double fontsize) {
//     return Text(
//       '฿${_formatPrice(unitPrice)}',
//       style: const TextStyle(
//         fontSize: fontsize,
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
//
//   static String _formatPrice(double price) {
//     return price.toString().replaceAllMapped(
//       RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
//           (Match m) => '${m[1]},',
//     );
//   }
// }
//
