// import 'package:flutter/material.dart';

// class RefundTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Tab Buttons
//         Row(
//           children: [
//             _tab("Accounts", false),
//             const SizedBox(width: 10),
//             _tab("Refund Request", true),
//           ],
//         ),
//         const SizedBox(height: 24),
//         // Search Bar
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Container(
//             width: 250,
//             height: 40,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: const Icon(Icons.search, color: Colors.black54),
//           ),
//         ),
//         const SizedBox(height: 16),
//         // Data Table
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade200),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DataTable(
//             headingRowColor: WidgetStateProperty.all(const Color(0xFFE9EEF4)),
//             columns: const [
//               DataColumn(label: Text('ID')),
//               DataColumn(label: Text('Patient')),
//               DataColumn(label: Text('Appointment Date')),
//               DataColumn(label: Text('Payment')),
//               DataColumn(label: Text('Status')),
//               DataColumn(label: Text('Action')),
//             ],
//             rows: [
//               _row(
//                 "#AC-1234",
//                 "Edalin Hendry",
//                 "24 Mar 2024 - 10:30 AM",
//                 "\$300",
//                 "Paid",
//               ),
//               _row(
//                 "#AC-1235",
//                 "Shanta Neill",
//                 "28 Mar 2024 - 11:15 AM",
//                 "\$250",
//                 "Paid",
//               ),
//               _row(
//                 "#AC-1236",
//                 "Anthony Tran",
//                 "02 Apr 2024 - 04:15 PM",
//                 "\$380",
//                 "Paid",
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   DataRow _row(
//     String id,
//     String patient,
//     String date,
//     String amount,
//     String status,
//   ) {
//     return DataRow(
//       cells: [
//         DataCell(Text(id, style: const TextStyle(color: Colors.blue))),
//         DataCell(
//           Row(
//             children: [
//               const CircleAvatar(
//                 radius: 14,
//                 backgroundImage: NetworkImage('https://via.placeholder.com/50'),
//               ),
//               const SizedBox(width: 10),
//               Text(patient),
//             ],
//           ),
//         ),
//         DataCell(Text(date)),
//         DataCell(Text(amount)),
//         DataCell(
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: Colors.teal,
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Text(
//               status,
//               style: const TextStyle(color: Colors.white, fontSize: 12),
//             ),
//           ),
//         ),
//         DataCell(
//           Row(
//             children: [
//               _actionIcon(Icons.link),
//               const SizedBox(width: 8),
//               _actionIcon(Icons.check, color: Colors.green),
//               const SizedBox(width: 8),
//               _actionIcon(Icons.close, color: Colors.red),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _actionIcon(IconData icon, {Color color = Colors.grey}) {
//     return Container(
//       padding: const EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Icon(icon, size: 14, color: color),
//     );
//   }

//   Widget _tab(String label, bool active) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: active ? const Color(0xFF007BFF) : Colors.grey[100],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(color: active ? Colors.white : Colors.black87),
//       ),
//     );
//   }
// }
