import 'package:flutter/material.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/invoice/invoice_page.dart';
// Ensure your InvoiceDetailModal is correctly imported here
// import 'package:medicque_app/invoice_detail_modal.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  // Mock Data
  final List<Map<String, String>> invoices = [
    {
      "id": "#Inv-0001",
      "name": "Adrian Marshall",
      "date": "11 Nov 2024",
      "booked": "10 Nov 2024",
      "amount": "\$150.00",
    },
    {
      "id": "#Inv-0002",
      "name": "Kelly Smith",
      "date": "12 Nov 2024",
      "booked": "11 Nov 2024",
      "amount": "\$200.00",
    },
    {
      "id": "#Inv-0003",
      "name": "Samuel L.",
      "date": "15 Nov 2024",
      "booked": "13 Nov 2024",
      "amount": "\$300.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F9FB),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Invoices",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00234B),
              ),
            ),
            const SizedBox(height: 24),
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildTableCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Invoices...",
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: const Icon(Icons.search, size: 20, color: Colors.blue),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildTableCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Table Header background color fix
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width - 300,
                ),
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(
                    const Color(0xFFF0F7FF),
                  ),
                  dataRowMaxHeight: 70,
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00234B),
                  ),
                  columns: const [
                    DataColumn(label: Text('Invoice ID')),
                    DataColumn(label: Text('Patient Name')),
                    DataColumn(label: Text('Appointment Date')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: invoices.map((inv) => _buildDataRow(inv)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(Map<String, String> inv) {
    return DataRow(
      cells: [
        DataCell(
          InkWell(
            onTap: () => _showInvoiceDetail(inv),
            child: Text(
              inv['id']!,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue.shade50,
                child: const Icon(Icons.person, size: 15, color: Colors.blue),
              ),
              const SizedBox(width: 10),
              Text(
                inv['name']!,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        DataCell(Text(inv['date']!)),
        DataCell(
          Text(
            inv['amount']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Row(
            children: [
              _buildIconButton(
                Icons.visibility_outlined,
                Colors.blue,
                () => _showInvoiceDetail(inv),
              ),
              const SizedBox(width: 8),
              _buildIconButton(
                Icons.print_outlined,
                Colors.grey.shade600,
                () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, size: 18, color: color),
        onPressed: onPressed,
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(8),
      ),
    );
  }

  void _showInvoiceDetail(Map<String, String> data) {
    // Note: Ensure your InvoiceDetailModal class is ready to accept 'invoiceData'
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          // child: InvoiceDetailModal(invoiceData: data), // Uncomment when modal is ready
          child: Padding(
            padding: const EdgeInsets.all(20),
            // child: InvoiceDetailModal(),
            child: InvoiceDialog(),
          ),
        ),
      ),
    );
  }
}
