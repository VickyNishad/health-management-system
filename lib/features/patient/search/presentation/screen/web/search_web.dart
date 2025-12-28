// import 'package:flutter/material.dart';
// import 'package:medicque_app/features/patient/landing/presentation/widgets/nav_bar.dart';
// import 'package:medicque_app/features/patient/search/presentation/widgets/data_model.dart';
// import 'package:medicque_app/features/patient/search/presentation/widgets/doctor_card.dart';
// import 'package:medicque_app/features/patient/search/presentation/widgets/filter_section.dart';
// import 'package:medicque_app/features/patient/search/presentation/widgets/search.dart';

// class SearchWeb extends StatefulWidget {
//   const SearchWeb({super.key});

//   @override
//   State<SearchWeb> createState() => _SearchWebState();
// }

// class _SearchWebState extends State<SearchWeb> {
//   bool _isGridView = true;

//   @override
//   Widget build(BuildContext context) {
//     // Determine if we are on a large screen (Desktop/Web)
//     bool isLargeScreen = MediaQuery.of(context).size.width > 1000;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FBFF), // Light blue background
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(80),
//         child: Navbar(),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 30),
//           child: Column(
//             children: [
//               Search(),
//               const SizedBox(height: 20),
//               isLargeScreen ? _buildDesktopLayout() : _buildMobileLayout(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Layout for large screens (Sidebar + Main Content)
//   Widget _buildDesktopLayout() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Left: Filter Sidebar
//         const SizedBox(
//           width: 300,
//           height: 800, // Fixed height for demonstration
//           child: FilterSection(),
//         ),
//         const SizedBox(width: 20),
//         // Right: Doctor Display Area
//         Expanded(
//           child: Column(
//             children: [
//               _buildDoctorHeader(),
//               const SizedBox(height: 10),
//               _buildDoctorDisplay(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // Layout for smaller screens (Filters likely in a drawer or on top)
//   Widget _buildMobileLayout() {
//     return Column(
//       children: [
//         // For mobile, you'd typically use a button to open the filter drawer/modal
//         // For this demo, we'll just put the header and display
//         _buildDoctorHeader(),
//         const SizedBox(height: 10),
//         // You might want to force list view on mobile for better readability
//         _buildDoctorDisplay(forceList: true),
//       ],
//     );
//   }

//   Widget _buildDoctorHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           "Showing ${dummyDoctors.length} Doctors For You",
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         Row(
//           children: [
//             const Text("Availability"),
//             Switch(value: true, onChanged: (val) {}),
//             const SizedBox(width: 10),
//             const Text("Sort By"),
//             DropdownButton<String>(
//               value: 'Price (Low to High)',
//               items:
//                   <String>[
//                     'Price (Low to High)',
//                     'Rating (High to Low)',
//                     'Experience',
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//               onChanged: (String? newValue) {},
//             ),
//             const SizedBox(width: 10),
//             // View Toggles
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   _isGridView = true;
//                 });
//               },
//               icon: Icon(
//                 Icons.grid_view,
//                 color: _isGridView ? Colors.blue : Colors.grey,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   _isGridView = false;
//                 });
//               },
//               icon: Icon(
//                 Icons.list,
//                 color: !_isGridView ? Colors.blue : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildDoctorDisplay({bool forceList = false}) {
//     if (_isGridView && !forceList) {
//       // Grid View
//       return GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount:
//               3, // Adjust for screen size (e.g., 2 on smaller desktop)
//           crossAxisSpacing: 20.0,
//           mainAxisSpacing: 20.0,
//           childAspectRatio: 0.8, // Adjust height
//         ),
//         itemCount: dummyDoctors.length,
//         itemBuilder: (context, index) {
//           return DoctorCard(doctor: dummyDoctors[index], isGridView: true);
//         },
//       );
//     } else {
//       // List View
//       return ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: dummyDoctors.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: DoctorCard(doctor: dummyDoctors[index], isGridView: false),
//           );
//         },
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/nav_bar.dart';
import 'package:medicque_app/features/patient/search/presentation/widgets/data_model.dart';
import 'package:medicque_app/features/patient/search/presentation/widgets/doctor_card.dart';
import 'package:medicque_app/features/patient/search/presentation/widgets/filter_section.dart';
import 'package:medicque_app/features/patient/search/presentation/widgets/search.dart';

class SearchWeb extends StatefulWidget {
  const SearchWeb({super.key});

  @override
  State<SearchWeb> createState() => _SearchWebState();
}

class _SearchWebState extends State<SearchWeb> {
  bool _isGridView = true;

  /// Pagination
  int _currentPage = 1;
  final int _pageSize = 6;

  int get _totalPages => (dummyDoctors.length / _pageSize).ceil();

  List get _paginatedDoctors {
    final startIndex = (_currentPage - 1) * _pageSize;
    final endIndex = startIndex + _pageSize;

    return dummyDoctors.sublist(
      startIndex,
      endIndex > dummyDoctors.length ? dummyDoctors.length : endIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 1000;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Navbar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
          child: Column(
            children: [
              Search(),
              const SizedBox(height: 20),
              isLargeScreen ? _buildDesktopLayout() : _buildMobileLayout(),
            ],
          ),
        ),
      ),
    );
  }

  // ================= DESKTOP =================

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 300, height: 900, child: FilterSection()),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              _buildDoctorHeader(),
              const SizedBox(height: 10),
              _buildDoctorDisplay(),
              const SizedBox(height: 20),
              // _buildPaginationControls(),
              _pagination(_totalPages),
            ],
          ),
        ),
      ],
    );
  }

  // ================= MOBILE =================

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildDoctorHeader(),
        const SizedBox(height: 10),
        _buildDoctorDisplay(forceList: true),
        const SizedBox(height: 20),
        // _buildPaginationControls(),
        _pagination(_totalPages),
      ],
    );
  }

  // ================= HEADER =================

  Widget _buildDoctorHeader1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Showing ${_paginatedDoctors.length} of ${dummyDoctors.length} Doctors",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => setState(() => _isGridView = true),
              icon: Icon(
                Icons.grid_view,
                color: _isGridView ? Colors.blue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => _isGridView = false),
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

  // ================= DOCTOR LIST =================

  Widget _buildDoctorDisplay({bool forceList = false}) {
    final doctors = _paginatedDoctors;

    if (_isGridView && !forceList) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
        ),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(doctor: doctors[index], isGridView: true);
        },
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: DoctorCard(doctor: doctors[index], isGridView: false),
        );
      },
    );
  }

  // ================= PAGINATION (LEFT / RIGHT) =================

  Widget _buildPaginationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: _currentPage > 1
              ? () {
                  setState(() {
                    _currentPage--;
                  });
                }
              : null,
          icon: const Icon(Icons.arrow_back),
          label: const Text("Previous"),
        ),
        const SizedBox(width: 20),
        Text(
          "Page $_currentPage of $_totalPages",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 20),
        ElevatedButton.icon(
          onPressed: _currentPage < _totalPages
              ? () {
                  setState(() {
                    _currentPage++;
                  });
                }
              : null,
          icon: const Icon(Icons.arrow_forward),
          label: const Text("Next"),
        ),
      ],
    );
  }

  Widget _pagination(int totalPages) {
    if (totalPages <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _arrow(
          Icons.arrow_back_ios,
          _currentPage > 1,
          () => setState(() => _currentPage--),
        ),

        ...List.generate(totalPages, (i) {
          final page = i + 1;
          final active = page == _currentPage;

          return GestureDetector(
            onTap: () => setState(() => _currentPage = page),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: active ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                "$page",
                style: TextStyle(color: active ? Colors.white : Colors.black),
              ),
            ),
          );
        }),

        _arrow(
          Icons.arrow_forward_ios,
          _currentPage < totalPages,
          () => setState(() => _currentPage++),
        ),
      ],
    );
  }

  Widget _arrow(IconData icon, bool enabled, VoidCallback onTap) {
    return IconButton(
      onPressed: enabled ? onTap : null,
      icon: Icon(icon, size: 16),
      color: enabled ? Colors.blue : Colors.grey,
    );
  }
}
