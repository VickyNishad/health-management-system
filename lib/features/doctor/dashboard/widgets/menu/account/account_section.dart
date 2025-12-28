import 'package:flutter/material.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/account/account_table.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/account/acctable.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/account/refund.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  // 0 for Accounts, 1 for Refund Request
  int selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Blue Statistics & Bank Details Header
        AccountsHeader(),

        const SizedBox(height: 30),

        // 2. Tab Navigation Buttons
        Row(
          children: [
            _buildTabButton("Accounts", 0),
            const SizedBox(width: 10),
            _buildTabButton("Refund Request", 1),
          ],
        ),

        const SizedBox(height: 20),

        // 3. Search Bar
        _buildSearchBar(),

        const SizedBox(height: 16),

        // 4. Dynamic Table (Changes based on tab)
        selectedTab == 0 ? AccountsDataTable() : RefundTable(),
      ],
    );
  }

  Widget _buildTabButton(String label, int index) {
    bool isActive = selectedTab == index;
    return InkWell(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF007BFF) : const Color(0xFFF3F4F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 300,
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFE9EEF4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.black54),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}
