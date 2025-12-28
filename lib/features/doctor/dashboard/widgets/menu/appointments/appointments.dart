import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/prifile_image.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  bool isGridView = false;
  String selectedTab = "Upcoming";
  String? selectedAptId; // Logic for viewing details
  String searchQuery = "";

  // Mock Data Logic
  final List<Map<String, dynamic>> allAppointments = [
    {
      "name": "Adrian",
      "id": "#Apt0001",
      "date": "11 Nov 2024",
      "time": "10:45 AM",
      "type": "Video Call",
      "status": "Upcoming",
      "color": Colors.blue,
      "icon": Icons.videocam,
    },
    {
      "name": "Kelly Stevens",
      "id": "#Apt0002",
      "date": "05 Nov 2024",
      "time": "11:50 AM",
      "type": "Audio Call",
      "status": "Cancelled",
      "color": Colors.purple,
      "icon": Icons.phone,
    },
    {
      "name": "Samuel James",
      "id": "#Apt0003",
      "date": "27 Oct 2024",
      "time": "09:30 AM",
      "type": "Video Call",
      "status": "Completed",
      "color": Colors.blue,
      "icon": Icons.videocam,
    },
    {
      "name": "Catherine Gracey",
      "id": "#Apt0004",
      "date": "18 Oct 2024",
      "time": "12:20 PM",
      "type": "Direct Visit",
      "status": "Upcoming",
      "color": Colors.pink,
      "icon": Icons.local_hospital,
    },
    {
      "name": "Adrian",
      "id": "#Apt0001",
      "date": "11 Nov 2024",
      "time": "10:45 AM",
      "type": "Video Call",
      "status": "Upcoming",
      "color": Colors.blue,
      "icon": Icons.videocam,
    },
    {
      "name": "Kelly Stevens",
      "id": "#Apt0002",
      "date": "05 Nov 2024",
      "time": "11:50 AM",
      "type": "Audio Call",
      "status": "Cancelled",
      "color": Colors.purple,
      "icon": Icons.phone,
    },
    {
      "name": "Samuel James",
      "id": "#Apt0003",
      "date": "27 Oct 2024",
      "time": "09:30 AM",
      "type": "Video Call",
      "status": "Completed",
      "color": Colors.blue,
      "icon": Icons.videocam,
    },
    {
      "name": "Catherine Gracey",
      "id": "#Apt0004",
      "date": "18 Oct 2024",
      "time": "12:20 PM",
      "type": "Direct Visit",
      "status": "Upcoming",
      "color": Colors.pink,
      "icon": Icons.local_hospital,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Logic: If an ID is selected, show details view. Otherwise, show list/grid.
    return selectedAptId != null
        ? _buildAppointmentDetailsView(selectedAptId!)
        : _buildMainAppointmentView();
  }

  Widget _buildMainAppointmentView() {
    // Filter logic based on status tab and search query
    List<Map<String, dynamic>> filteredList = allAppointments.where((apt) {
      bool matchesTab = apt['status'] == selectedTab;
      bool matchesSearch = apt['name'].toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchesTab && matchesSearch;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- HEADER SECTION ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Appointments",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D1B3E),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    onChanged: (val) => setState(() => searchQuery = val),
                    decoration: const InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search, size: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 5),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                _viewToggleIcon(
                  Icons.format_list_bulleted,
                  !isGridView,
                  () => setState(() => isGridView = false),
                ),
                _viewToggleIcon(
                  Icons.grid_view_rounded,
                  isGridView,
                  () => setState(() => isGridView = true),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 25),

        // --- FILTER BAR ---
        Row(
          children: [
            _statusTab("Upcoming", "21"),
            _statusTab("Cancelled", "16"),
            _statusTab("Completed", "214"),
            const Spacer(),
            _dateFilter(),
            const SizedBox(width: 10),
            _filterBy(),
          ],
        ),
        const SizedBox(height: 25),

        // --- CONTENT AREA ---
        filteredList.isEmpty
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Text("No Appointments found"),
                ),
              )
            : isGridView
            ? _buildGridView(filteredList)
            : _buildListView(filteredList),
      ],
    );
  }

  // --- APPOINTMENT DETAILS VIEW (Logic for the Detail Screen) ---
  Widget _buildAppointmentDetailsView(String id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => setState(() => selectedAptId = null),
            ),
            const Text(
              "Appointment Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(12),
                  //   child: Image.network(
                  //     'https://i.pravatar.cc/150?u=$id',
                  //     width: 80,
                  //     height: 80,
                  //   ),
                  // ),
                  ProfileImage(
                    imagePath: "assets/images/doctor_img.png",
                    isCircle: true,
                    size: 80,
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("#Apt0001", style: TextStyle(color: Colors.blue)),
                      Text(
                        "Kelly Joseph",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Kelly@Example.Com"),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          "Cancelled",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Text(
                        "Fees: \$200",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date: 22 Jul 2023"),
                  Text("Visit: Video Call"),
                  Text(
                    "Status: Refund Credited",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- VIEW BUILDERS ---
  Widget _buildListView(List<Map<String, dynamic>> items) {
    return Column(children: items.map((data) => _listCard(data)).toList());
  }

  Widget _buildGridView(List<Map<String, dynamic>> items) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1.3,
      children: items.map((data) => _gridCard(data)).toList(),
    );
  }

  // --- UPDATED UI HELPERS WITH LOGIC ---
  Widget _listCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // CircleAvatar(
          //   radius: 25,
          //   backgroundImage: NetworkImage(
          //     'https://i.pravatar.cc/150?u=${data['name']}',
          //   ),
          // ),
          ProfileImage(
            imagePath: "assets/images/doctor_img.png",
            isCircle: true,
            size: 50,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['id'],
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                ),
                Text(
                  data['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "${data['date']} ${data['time']}\nGeneral Visit",
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Icon(data['icon'], size: 18, color: data['color']),
                const SizedBox(width: 8),
                Text(data['type']),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () => setState(() => selectedAptId = data['id']),
            child: const Text("View Details"),
          ),
        ],
      ),
    );
  }

  Widget _gridCard(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CircleAvatar(
              //   backgroundImage: NetworkImage(
              //     'https://i.pravatar.cc/150?u=${data['name']}',
              //   ),
              // ),
              ProfileImage(
                imagePath: "assets/images/doctor_img.png",
                isCircle: true,
                size: 50,
              ),
              Icon(data['icon'], color: data['color'], size: 18),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            data['id'],
            style: const TextStyle(color: Colors.blue, fontSize: 11),
          ),
          Text(
            data['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            "${data['date']} ${data['time']}",
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const Spacer(),
          Center(
            child: TextButton(
              onPressed: () => setState(() => selectedAptId = data['id']),
              child: const Text(
                "View Details",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusTab(String label, String count) {
    bool isSelected = selectedTab == label;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = label),
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                count,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _viewToggleIcon(IconData icon, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: active ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(icon, color: active ? Colors.white : Colors.grey, size: 20),
      ),
    );
  }

  Widget _dateFilter() => _filterContainer(
    const Icon(Icons.calendar_month, size: 18),
    "12/08/2025 - 12/14/2025",
  );
  Widget _filterBy() => _filterContainer(
    const Icon(Icons.filter_list, size: 18),
    "Filter By",
    trailing: const Icon(Icons.keyboard_arrow_down),
  );

  Widget _filterContainer(Widget icon, String text, {Widget? trailing}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          Text(text),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
