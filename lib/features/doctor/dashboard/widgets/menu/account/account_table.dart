import 'package:flutter/material.dart';

class AccountsHeader extends StatelessWidget {
  const AccountsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF000D2D), // Dark navy background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Statistics
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Statistics",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _statBox(
                          "Total Balance",
                          "\$900",
                          Icons.account_balance_wallet,
                          Colors.greenAccent,
                        ),
                        const SizedBox(width: 12),
                        _statBox(
                          "Earned",
                          "\$906",
                          Icons.monetization_on,
                          Colors.orange,
                        ),
                        const SizedBox(width: 12),
                        _statBox(
                          "Requested",
                          "\$50",
                          Icons.help_outline,
                          Colors.pinkAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Bank Details
              Expanded(flex: 2, child: _buildBankDetails()),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Last Payment request : 24 Mar 2023",
            style: TextStyle(color: Colors.white54, fontSize: 13),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00B7D4),
              // shape: RoundedRectanglePlatform.stadiumCursor(),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Request Payment",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statBox(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 16),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bank Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _bankRow("Bank Name", "Citi Bank Inc"),
        _bankRow("Account Number", "5396 5250 1908 XXXX"),
        _bankRow("Branch Name", "London"),
        _bankRow("Account Name", "Darren"),
        const SizedBox(height: 12),
        const Text(
          "Edit Details | Other Accounts",
          style: TextStyle(color: Colors.blueAccent, fontSize: 13),
        ),
      ],
    );
  }

  Widget _bankRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
