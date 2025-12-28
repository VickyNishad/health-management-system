import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/prifile_image.dart';

class MyPatientsPage extends StatefulWidget {
  const MyPatientsPage({super.key});

  @override
  State<MyPatientsPage> createState() => _MyPatientsPageState();
}

class _MyPatientsPageState extends State<MyPatientsPage> {
  String activeTab = "Active";

  @override
  Widget build(BuildContext context) {
    return Container(
      // Use constraints.maxHeight to tell the container exactly how tall to be
      // height: constraints.maxHeight,
      // width: constraints.maxWidth,
      color: const Color(0xFFF8F9FB),
      child: SingleChildScrollView(
        physics:
            const AlwaysScrollableScrollPhysics(), // Ensures it scrolls correctly
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Patients",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildFilterHeader(),
            const SizedBox(height: 20),
            _buildPatientGrid(), // GridView is already shrinkWrapped, so this should work now
          ],
        ),
      ),
    );
  }

  // --- Header Tabs & Filters ---
  Widget _buildFilterHeader() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [_buildTab("Active", "200"), _buildTab("InActive", "22")],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIconDropdown(
              Icons.calendar_today_outlined,
              "12/08/2025 - 12/14/2025",
            ),
            const SizedBox(width: 12),
            _buildIconDropdown(Icons.tune, "Filter By"),
          ],
        ),
      ],
    );
  }

  Widget _buildTab(String label, String count) {
    bool isActive = activeTab == label;
    return GestureDetector(
      onTap: () => setState(() => activeTab = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF007EF4) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isActive
                    ? Colors.white.withOpacity(0.2)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                count,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Responsive Grid of Cards ---
  Widget _buildPatientGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 1200
            ? 3
            : (constraints.maxWidth > 800 ? 3 : 1);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 220, // Controls height of cards
          ),
          itemCount: activeTab == "Active" ? 6 : 2,
          itemBuilder: (context, index) => _buildPatientCard(index),
        );
      },
    );
  }

  Widget _buildPatientCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ProfileImage(
                  imagePath: "assets/images/doctor_img.png",
                  isCircle: false,
                  size: 50,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#Apt0001",
                        style: TextStyle(color: Colors.blue, fontSize: 11),
                      ),
                      Text(
                        "Adrian Marshall",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Age : 42 | Male | AB+",
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F7FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                _buildInfoRow(Icons.access_time, "11 Nov 2024 10.45 AM"),
                const SizedBox(height: 6),
                _buildInfoRow(Icons.location_on_outlined, "Alabama, USA"),
              ],
            ),
          ),
          const Spacer(),
          const Divider(height: 1),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 14,
                  color: Colors.grey,
                ),
                SizedBox(width: 6),
                Text(
                  "Last Booking",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Spacer(),
                Text(
                  "27 Feb 2024",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF00234B)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF00234B),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconDropdown(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
