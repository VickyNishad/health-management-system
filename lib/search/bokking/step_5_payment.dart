import 'package:flutter/material.dart';
import 'package:medicque_app/search/bokking/booking_data.dart';

class Step5Payment extends StatefulWidget {
  final BookingData data;
  final VoidCallback onNext;

  const Step5Payment({super.key, required this.data, required this.onNext});

  @override
  State<Step5Payment> createState() => _Step5PaymentState();
}

class _Step5PaymentState extends State<Step5Payment> {
  String _selectedMethod = 'Credit Card';

  final Map<String, int> fees = {
    "Echocardiograms": 200,
    "Booking Fees": 20,
    "Tax": 18,
    "Discount": -15,
  };

  int get _total => fees.values.fold(0, (sum, item) => sum + item);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Side: Payment Gateway
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Payment Gateway",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildPaymentMethodButton('Credit Card', Icons.credit_card),
                  _buildPaymentMethodButton('Paypal', Icons.payment),
                  _buildPaymentMethodButton('Stripe', Icons.payments),
                ],
              ),
              const SizedBox(height: 20),
              // Card Input Fields
              const TextField(
                decoration: InputDecoration(
                  labelText: "Card Holder Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Card Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.credit_card),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Expire Date",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "CVV",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),

        // Right Side: Booking Summary
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Booking Info",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildSummaryDetail(
                  "Date & Time",
                  "${widget.data.selectedTimeSlot}, 15, Oct 2025",
                ),
                _buildSummaryDetail(
                  "Appointment Type",
                  "Clinic (${widget.data.clinicName})",
                ),
                const Divider(height: 20),
                const Text(
                  "Payment Info",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...fees.entries
                    .map((e) => _buildFeeRow(e.key, e.value))
                    .toList(),
                const Divider(height: 20),
                _buildTotalRow(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: widget.onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text(
                    "Confirm & Pay",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodButton(String method, IconData icon) {
    bool isSelected = _selectedMethod == method;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () => setState(() => _selectedMethod = method),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Text(method),
        ),
      ),
    );
  }

  Widget _buildSummaryDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildFeeRow(String item, int price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item),
          Text(
            '${price >= 0 ? '\$' : '-\$'}${price.abs()}',
            style: TextStyle(color: price < 0 ? Colors.red : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            '\$$_total',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
