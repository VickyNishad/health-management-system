import 'package:flutter/material.dart';

// --- Theme Colors for the Invoice ---
const Color kPrimaryColor = Color(
  0xFF2196F3,
); // A bright blue for the logo and buttons
const Color kLightTextColor = Color(0xFF757575); // Lighter text for labels
const Color kDarkTextColor = Color(0xFF212121); // Darker text for main info
const Color kDividerColor = Color(0xFFEEEEEE); // Light grey for separators

class InvoiceDialog extends StatelessWidget {
  const InvoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // The shape mimics the slightly rounded corners of the dialog in the image
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      // The ClipRRect is used to give the internal content the same rounded corners
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // --- 1. Header (Title and Download Button) ---
              _buildHeader(context),
              // --- 2. Date and Invoice/Payment Info Header ---
              _buildInvoiceInfoSection(),
              // --- 3. Billing From/To and Payment Method ---
              _buildBillingAndPaymentSection(),
              // --- 4. Invoice Details Table ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Text(
                  'Invoice Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kDarkTextColor,
                  ),
                ),
              ),
              _buildInvoiceDetailsTable(),
              // --- 5. Totals (Subtotal, Discount, Total Amount) ---
              _buildTotalsSection(),
              // --- 6. Other Information Section ---
              _buildOtherInformationSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for the Top Header
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).scaffoldBackgroundColor, // Use a light background
        border: const Border(
          bottom: BorderSide(color: kDividerColor, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            'View Invoice',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // In a real app, this would dismiss the dialog
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  // Helper method for the Date, Logo, and Download button row
  Widget _buildInvoiceInfoSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
      child: Column(
        children: [
          // Date Row (Top right in the image)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                '21 Mar 2024',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8.0),
              const Icon(
                Icons.print_outlined,
                size: 20,
                color: kLightTextColor,
              ),
              const SizedBox(width: 16.0),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 20),
                label: const Text('Download'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          // Logo Row and Invoice/Payment Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Doccure Logo (Simplified with Text/Icon)
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text(
                      'DOCCURE',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: kPrimaryColor,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Icon(
                      Icons.monitor_heart_outlined,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
              // Invoice Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: kDarkTextColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Invoice No : ',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '#INV005',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: kDarkTextColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Issued: ',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '21 Mar 2024',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method for Billing and Payment Info
  Widget _buildBillingAndPaymentSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Billing From
          Expanded(
            child: _buildInfoColumn(
              title: 'Billing From',
              name: 'Edalin Hendry',
              addressLine1: '806 Twin Willow Lane,',
              addressLine2: 'Newyork, USA',
            ),
          ),
          const SizedBox(width: 16.0),
          // Billing To
          Expanded(
            child: _buildInfoColumn(
              title: 'Billing To',
              name: 'Richard Wilson',
              addressLine1: '299 Star Trek Drive',
              addressLine2: 'Florida, 32405, USA',
            ),
          ),
          const SizedBox(width: 16.0),
          // Payment Method
          Expanded(
            child: _buildInfoColumn(
              title: 'Payment Method',
              name: 'Debit Card',
              addressLine1: 'XXXXXXXXXXXX-2541',
              addressLine2: 'HDFC Bank',
              isPayment: true,
            ),
          ),
        ],
      ),
    );
  }

  // Generic column builder for Billing/Payment Info
  Widget _buildInfoColumn({
    required String title,
    required String name,
    required String addressLine1,
    required String addressLine2,
    bool isPayment = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kDarkTextColor,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          addressLine1,
          style: const TextStyle(fontSize: 14, color: kLightTextColor),
        ),
        Text(
          addressLine2,
          style: const TextStyle(fontSize: 14, color: kLightTextColor),
        ),
      ],
    );
  }

  // Helper method for the Invoice Details Table
  Widget _buildInvoiceDetailsTable() {
    // Custom table header row style to match the image's background/padding
    const TextStyle headerStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: kDarkTextColor,
      fontSize: 14,
    );

    const TextStyle cellStyle = TextStyle(
      fontWeight: FontWeight.normal,
      color: kLightTextColor,
      fontSize: 14,
    );

    return Container(
      decoration: BoxDecoration(border: Border.all(color: kDividerColor)),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(4), // Description
          1: FlexColumnWidth(1.5), // Quantity
          2: FlexColumnWidth(1.5), // VAT
          3: FlexColumnWidth(2), // Total
        },
        children: [
          // Table Header
          TableRow(
            decoration: const BoxDecoration(
              color: Color(0xFFF7F7F7), // Light background for header row
            ),
            children: [
              _buildTableCell(
                'Description',
                style: headerStyle,
                isHeader: true,
              ),
              _buildTableCell('Quantity', style: headerStyle, isHeader: true),
              _buildTableCell('VAT', style: headerStyle, isHeader: true),
              _buildTableCell('Total', style: headerStyle, isHeader: true),
            ],
          ),
          // Table Row 1
          TableRow(
            children: [
              _buildTableCell('General Consultation', style: cellStyle),
              _buildTableCell('1', style: cellStyle),
              _buildTableCell('\$0', style: cellStyle),
              _buildTableCell('\$150', style: cellStyle),
            ],
          ),
          // Table Row 2
          TableRow(
            children: [
              _buildTableCell('Video Call', style: cellStyle),
              _buildTableCell('1', style: cellStyle),
              _buildTableCell('\$0', style: cellStyle),
              _buildTableCell('\$100', style: cellStyle),
            ],
          ),
        ],
      ),
    );
  }

  // Generic cell builder for the table
  Widget _buildTableCell(
    String text, {
    required TextStyle style,
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
      child: Text(
        text,
        style: style,
        textAlign: isHeader ? TextAlign.left : TextAlign.left,
      ),
    );
  }

  // Helper method for the Totals section
  Widget _buildTotalsSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildTotalRow('Subtotal:', '\$350', isBold: false),
          _buildTotalRow('Discount:', '-10%', isBold: false),
          _buildTotalRow(
            'Total Amount:',
            '\$315',
            isBold: true,
            color: kDarkTextColor,
          ),
        ],
      ),
    );
  }

  // Generic row builder for Totals
  Widget _buildTotalRow(
    String label,
    String value, {
    required bool isBold,
    Color color = kLightTextColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for the Other Information section
  Widget _buildOtherInformationSection() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F7), // Light background for this section
        border: Border(top: BorderSide(color: kDividerColor, width: 1.0)),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Other information',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kDarkTextColor,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'An account of the present illness, which includes the circumstances surrounding the onset of recent health changes and the chronology of subsequent events that have led the patient to seek medicine',
            style: TextStyle(fontSize: 14, color: kLightTextColor),
          ),
        ],
      ),
    );
  }
}
