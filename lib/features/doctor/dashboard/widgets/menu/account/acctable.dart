import 'package:flutter/material.dart';

class AccountsDataTable extends StatelessWidget {
  const AccountsDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(
          const Color(0xFFE9EEF4),
        ), // Light blue-grey header
        dataRowHeight: 60,
        headingTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF2D3748),
        ),
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Requested Date')),
          DataColumn(label: Text('Account No')),
          DataColumn(label: Text('Credited On')),
          DataColumn(label: Text('Amount')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Action')),
        ],
        rows: [
          _buildAccountRow(
            "#AC-1234",
            "24 Mar 2024",
            "5396 5250 1908 XXXX",
            "26 Mar 2024",
            "\$300",
            "Completed",
            Colors.teal,
          ),
          _buildAccountRow(
            "#AC-1235",
            "28 Mar 2024",
            "8833 8942 9013 XXXX",
            "30 Mar 2024",
            "\$400",
            "Completed",
            Colors.teal,
          ),
          _buildAccountRow(
            "#AC-1236",
            "02 Apr 2024",
            "8920 4041 4725 XXXX",
            "04 Apr 2024",
            "\$350",
            "Cancelled",
            Colors.red,
          ),
          _buildAccountRow(
            "#AC-1237",
            "10 Apr 2024",
            "5730 4892 0492 XXXX",
            "12 Apr 2024",
            "\$220",
            "Pending",
            Colors.orange,
          ),
          _buildAccountRow(
            "#AC-1238",
            "16 Apr 2024",
            "7922 9024 5824 XXXX",
            "18 Apr 2024",
            "\$470",
            "Completed",
            Colors.teal,
          ),
        ],
      ),
    );
  }

  DataRow _buildAccountRow(
    String id,
    String requestedDate,
    String accountNo,
    String creditedOn,
    String amount,
    String status,
    Color statusColor,
  ) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            id,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(Text(requestedDate)),
        DataCell(Text(accountNo)),
        DataCell(Text(creditedOn)),
        DataCell(
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Icon(Icons.link, size: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
