import 'package:flutter/material.dart';
import 'data_model.dart'; // Import data model
import 'doctor_card.dart'; // Import card widget
import 'filter_section.dart'; // Import filter widget

class DoctorGridScreen extends StatefulWidget {
  const DoctorGridScreen({super.key});

  @override
  State<DoctorGridScreen> createState() => _DoctorGridScreenState();
}

class _DoctorGridScreenState extends State<DoctorGridScreen> {
  // State to toggle between Grid (true) and List (false) view
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    // Determine if we are on a large screen (Desktop/Web)
    bool isLargeScreen = MediaQuery.of(context).size.width > 1000;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5), // Light background for the page
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 30),
          child: Column(
            children: [
              _buildSearchFilterBar(),
              const SizedBox(height: 20),
              isLargeScreen ? _buildDesktopLayout() : _buildMobileLayout(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Doctor Grid",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none, color: Colors.blue),
        ),
      ],
    );
  }

  // Top search bar with Location and Date input
  Widget _buildSearchFilterBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const Expanded(
              flex: 3,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search for Doctors, Hospitals, Clinics",
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 24,
                    minWidth: 48,
                  ),
                ),
              ),
            ),
            Container(width: 1, height: 30, color: Colors.grey[300]),
            const Expanded(
              flex: 1,

              // child: TextField(
              //   decoration: InputDecoration(
              //     hintText: "Location",
              //     border: InputBorder.none,
              //     prefixIcon: Icon(Icons.location_on, color: Colors.grey),
              //     isDense: true,
              //   ),
              // ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Location",
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  prefixIcon: Icon(Icons.location_on, color: Colors.grey),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 24,
                    minWidth: 48,
                  ),
                ),
              ),
            ),
            Container(width: 1, height: 30, color: Colors.grey[300]),
            const Expanded(
              flex: 1,

              // child: TextField(
              //   decoration: InputDecoration(
              //     hintText: "Date",
              //     border: InputBorder.none,
              //     prefixIcon: Icon(
              //       Icons.calendar_today,
              //       color: Colors.grey,
              //       size: 20,
              //     ),
              //     isDense: true,
              //   ),
              // ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Date",
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 24,
                    minWidth: 48,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }

  // Layout for large screens (Sidebar + Main Content)
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: Filter Sidebar
        const SizedBox(
          width: 300,
          height: 800, // Fixed height for demonstration
          child: FilterSection(),
        ),
        const SizedBox(width: 20),
        // Right: Doctor Display Area
        Expanded(
          child: Column(
            children: [
              _buildDoctorHeader(),
              const SizedBox(height: 10),
              _buildDoctorDisplay(),
            ],
          ),
        ),
      ],
    );
  }

  // Layout for smaller screens (Filters likely in a drawer or on top)
  Widget _buildMobileLayout() {
    return Column(
      children: [
        // For mobile, you'd typically use a button to open the filter drawer/modal
        // For this demo, we'll just put the header and display
        _buildDoctorHeader(),
        const SizedBox(height: 10),
        // You might want to force list view on mobile for better readability
        _buildDoctorDisplay(forceList: true),
      ],
    );
  }

  Widget _buildDoctorHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Showing ${dummyDoctors.length} Doctors For You",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            const Text("Availability"),
            Switch(value: true, onChanged: (val) {}),
            const SizedBox(width: 10),
            const Text("Sort By"),
            DropdownButton<String>(
              value: 'Price (Low to High)',
              items:
                  <String>[
                    'Price (Low to High)',
                    'Rating (High to Low)',
                    'Experience',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {},
            ),
            const SizedBox(width: 10),
            // View Toggles
            IconButton(
              onPressed: () {
                setState(() {
                  _isGridView = true;
                });
              },
              icon: Icon(
                Icons.grid_view,
                color: _isGridView ? Colors.blue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _isGridView = false;
                });
              },
              icon: Icon(
                Icons.list,
                color: !_isGridView ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDoctorDisplay({bool forceList = false}) {
    if (_isGridView && !forceList) {
      // Grid View
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              3, // Adjust for screen size (e.g., 2 on smaller desktop)
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.8, // Adjust height
        ),
        itemCount: dummyDoctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(doctor: dummyDoctors[index], isGridView: true);
        },
      );
    } else {
      // List View
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dummyDoctors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: DoctorCard(doctor: dummyDoctors[index], isGridView: false),
          );
        },
      );
    }
  }
}
