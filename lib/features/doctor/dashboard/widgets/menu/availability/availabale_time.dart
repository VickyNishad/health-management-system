import 'package:flutter/material.dart';

class AvailableTimingsPage extends StatefulWidget {
  const AvailableTimingsPage({super.key});

  @override
  State<AvailableTimingsPage> createState() => _AvailableTimingsPageState();
}

class _AvailableTimingsPageState extends State<AvailableTimingsPage> {
  String selectedType = "Clinic Availability";
  String selectedDay = "Monday";

  // Example data structure for slots
  List<String> mondaySlots = [
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Timings",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D1B3E),
          ),
        ),
        const SizedBox(height: 25),

        // 1. TOP TOGGLE BUTTONS (General vs Clinic)
        Row(
          children: [
            _toggleBtn("General Availability"),
            const SizedBox(width: 15),
            _toggleBtn("Clinic Availability"),
          ],
        ),
        const SizedBox(height: 25),

        // 2. CLINIC SELECTION CARD
        if (selectedType == "Clinic Availability") _buildClinicSelector(),

        const SizedBox(height: 25),

        // 3. SLOTS SECTION
        Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Available Slots",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              const Text(
                "Select Available days",
                style: TextStyle(color: Colors.blueGrey, fontSize: 13),
              ),
              const SizedBox(height: 10),

              // Day Selection Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                    "Sunday",
                  ].map((day) => _dayChip(day)).toList(),
                ),
              ),

              const SizedBox(height: 30),

              // Time Slots Area
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDay,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => _showAddSlotDialog(
                                context,
                              ), // Trigger the modal
                              child: const Text(
                                "Add Slots",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            // TextButton(
                            //   onPressed: () {},
                            //   child: const Text(
                            //     "Add Slots",
                            //     style: TextStyle(color: Colors.blue),
                            //   ),
                            // ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Delete All",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: mondaySlots
                          .map((time) => _timeSlot(time))
                          .toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Fees Input
              const Text(
                "Appointment Fees (\$)",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "254",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                ),
              ),

              const SizedBox(height: 30),

              // Bottom Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                      elevation: 0,
                    ),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A3E1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper: Clinic Selection Box
  Widget _buildClinicSelector() {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Clinic",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.local_hospital, color: Colors.blue),
                SizedBox(width: 10),
                Text("The Family Dentistry Clinic"),
                Spacer(),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper: Day Chip
  Widget _dayChip(String day) {
    bool isSelected = selectedDay == day;
    return GestureDetector(
      onTap: () => setState(() => selectedDay = day),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : const Color(0xFFF8F9FE),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade200,
          ),
        ),
        child: Text(
          day,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Helper: Time Slot Item
  Widget _timeSlot(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.access_time, size: 16, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Text(time, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // Helper: Top Toggle Button
  Widget _toggleBtn(String text) {
    bool isSelected = selectedType == text;
    return ElevatedButton(
      onPressed: () => setState(() => selectedType = text),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        elevation: 0,
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text),
    );
  }
}

void _showAddSlotDialog(BuildContext context) {
  String selectedSpace = "Space 4"; // Default value from your image

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: 700, // Desktop-style width
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- HEADER ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add New Slot",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D1B3E),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.blueGrey,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 20),

                  // --- START & END TIME ROW ---
                  Row(
                    children: [
                      Expanded(
                        child: _buildInputLabelField("Start Time", "16:00 PM"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildInputLabelField("End Time", "Select Time"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // --- INTERVALS & DURATIONS ROW ---
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdownField(
                          "Appointment Intervals",
                          "10 Minutes",
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildDropdownField(
                          "Appointment Durations",
                          "30 Minutes",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // --- ASSIGN SPACES (Radio Selection) ---
                  const Text(
                    "Assign Appointment Spaces",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [1, 2, 3, 4].map((i) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: "Space $i",
                            groupValue: selectedSpace,
                            activeColor: Colors.blue,
                            onChanged: (val) =>
                                setDialogState(() => selectedSpace = val!),
                          ),
                          Text(
                            "Space $i",
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 15),
                        ],
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // --- DIALOG FOOTER BUTTONS ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE8EAF6),
                          foregroundColor: Colors.black87,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("Cancel"),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00A3E1),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

// --- HELPER METHODS FOR INPUTS ---

Widget _buildInputLabelField(String label, String hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      const SizedBox(height: 8),
      TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
      ),
    ],
  );
}

Widget _buildDropdownField(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: [
              value,
            ].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
            onChanged: (val) {},
          ),
        ),
      ),
    ],
  );
}
