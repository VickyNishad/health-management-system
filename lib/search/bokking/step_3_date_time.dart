// // // import 'package:flutter/material.dart';
// // // import 'package:medicque_app/search/bokking/booking_data.dart';

// // // class Step3DateTime extends StatefulWidget {
// // //   final BookingData data;
// // //   final VoidCallback onNext;

// // //   const Step3DateTime({super.key, required this.data, required this.onNext});

// // //   @override
// // //   State<Step3DateTime> createState() => _Step3DateTimeState();
// // // }

// // // class _Step3DateTimeState extends State<Step3DateTime> {
// // //   // Simplified time slots for demonstration
// // //   final Map<String, List<String>> _timeSlots = {
// // //     'Morning': ['09:45', '10:45', '09:45', '10:45', '09:45', '10:45'],
// // //     'Afternoon': ['09:45', '10:45', '09:45', '10:45'],
// // //     'Evening': ['09:45', '10:45', '09:45', '10:45', '09:45', '10:45'],
// // //   };

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         const Text(
// // //           "Select Date & Time",
// // //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
// // //         ),
// // //         const SizedBox(height: 15),

// // //         Row(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // Left: Calendar
// // //             Expanded(flex: 1, child: _buildCalendarView()),
// // //             const SizedBox(width: 20),

// // //             // Right: Time Slots
// // //             Expanded(flex: 1, child: _buildTimeSlotSection()),
// // //           ],
// // //         ),
// // //         const SizedBox(height: 30),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildCalendarView() {
// // //     // Simplified Calendar UI
// // //     final List<String> days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
// // //     final List<int> dates = List.generate(
// // //       35,
// // //       (index) => index + 1,
// // //     ); // Mock dates

// // //     return Container(
// // //       padding: const EdgeInsets.all(10),
// // //       decoration: BoxDecoration(
// // //         border: Border.all(color: Colors.grey.shade300),
// // //         borderRadius: BorderRadius.circular(10),
// // //       ),
// // //       child: Column(
// // //         children: [
// // //           Row(
// // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //             children: [
// // //               IconButton(
// // //                 onPressed: () {},
// // //                 icon: const Icon(Icons.arrow_back_ios, size: 16),
// // //               ),
// // //               const Text(
// // //                 "December 2025",
// // //                 style: TextStyle(fontWeight: FontWeight.bold),
// // //               ),
// // //               IconButton(
// // //                 onPressed: () {},
// // //                 icon: const Icon(Icons.arrow_forward_ios, size: 16),
// // //               ),
// // //             ],
// // //           ),
// // //           GridView.builder(
// // //             shrinkWrap: true,
// // //             physics: const NeverScrollableScrollPhysics(),
// // //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //               crossAxisCount: 7,
// // //               crossAxisSpacing: 5,
// // //               mainAxisSpacing: 5,
// // //               childAspectRatio: 1.0,
// // //             ),
// // //             itemCount: 42, // Days + dates
// // //             itemBuilder: (context, index) {
// // //               if (index < 7) {
// // //                 // Days of the week header
// // //                 return Center(
// // //                   child: Text(
// // //                     days[index],
// // //                     style: const TextStyle(
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.blue,
// // //                     ),
// // //                   ),
// // //                 );
// // //               }
// // //               // Mock dates
// // //               int date = dates[index - 7];
// // //               bool isSelected = date == 16; // Mock selected date
// // //               return InkWell(
// // //                 onTap: () {
// // //                   // Handle date selection
// // //                 },
// // //                 child: Container(
// // //                   alignment: Alignment.center,
// // //                   decoration: BoxDecoration(
// // //                     color: isSelected ? Colors.blue : Colors.transparent,
// // //                     borderRadius: BorderRadius.circular(5),
// // //                     border: isSelected
// // //                         ? null
// // //                         : Border.all(color: Colors.grey.shade300),
// // //                   ),
// // //                   child: Text(
// // //                     '$date',
// // //                     style: TextStyle(
// // //                       color: isSelected ? Colors.white : Colors.black,
// // //                       fontWeight: isSelected
// // //                           ? FontWeight.bold
// // //                           : FontWeight.normal,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTimeSlotSection() {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: _timeSlots.entries.map((entry) {
// // //         String period = entry.key;
// // //         List<String> slots = entry.value;

// // //         return Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Container(
// // //               margin: const EdgeInsets.only(bottom: 8, top: 15),
// // //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.blue,
// // //                 borderRadius: BorderRadius.circular(5),
// // //               ),
// // //               child: Text(
// // //                 period,
// // //                 style: const TextStyle(
// // //                   color: Colors.white,
// // //                   fontWeight: FontWeight.bold,
// // //                 ),
// // //               ),
// // //             ),
// // //             Wrap(
// // //               spacing: 8.0,
// // //               runSpacing: 8.0,
// // //               children: slots
// // //                   .map((time) => _buildTimeSlotButton(time))
// // //                   .toList(),
// // //             ),
// // //           ],
// // //         );
// // //       }).toList(),
// // //     );
// // //   }

// // //   Widget _buildTimeSlotButton(String time) {
// // //     bool isSelected = widget.data.selectedTimeSlot.contains(time);
// // //     return InkWell(
// // //       onTap: () {
// // //         setState(() {
// // //           widget.data.selectedTimeSlot = time;
// // //         });
// // //       },
// // //       child: Container(
// // //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// // //         decoration: BoxDecoration(
// // //           color: isSelected ? Colors.blue : Colors.grey.shade200,
// // //           borderRadius: BorderRadius.circular(8),
// // //           border: Border.all(
// // //             color: isSelected ? Colors.blue : Colors.transparent,
// // //           ),
// // //         ),
// // //         child: Text(
// // //           time,
// // //           style: TextStyle(
// // //             color: isSelected ? Colors.white : Colors.black,
// // //             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // // Ensure this path matches your project structure
// // // import 'package:medicque_app/search/bokking/booking_data.dart';

// // class Step3DateTime extends StatefulWidget {
// //   final dynamic data; // Replace dynamic with BookingData
// //   final VoidCallback onNext;

// //   const Step3DateTime({super.key, required this.data, required this.onNext});

// //   @override
// //   State<Step3DateTime> createState() => _Step3DateTimeState();
// // }

// // class _Step3DateTimeState extends State<Step3DateTime> {
// //   // 1. Variable to track selected date
// //   int? _selectedDate;

// //   final Map<String, List<String>> _timeSlots = {
// //     'Morning': ['09:45', '10:45', '11:45', '12:15'],
// //     'Afternoon': ['01:30', '02:30', '03:45', '04:15'],
// //     'Evening': ['06:00', '07:00', '08:00', '09:00'],
// //   };

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         const Text(
// //           "Select Date & Time",
// //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
// //         ),
// //         const SizedBox(height: 15),

// //         Row(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Left: Calendar
// //             Expanded(flex: 1, child: _buildCalendarView()),
// //             const SizedBox(width: 20),

// //             // Right: Time Slots
// //             Expanded(flex: 1, child: _buildTimeSlotSection()),
// //           ],
// //         ),
// //         const SizedBox(height: 30),

// //         // Next Button Example
// //         SizedBox(
// //           width: double.infinity,
// //           child: ElevatedButton(
// //             onPressed:
// //                 (_selectedDate != null &&
// //                     widget.data.selectedTimeSlot.isNotEmpty)
// //                 ? widget.onNext
// //                 : null,
// //             child: const Text("Next"),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildCalendarView() {
// //     final List<String> days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
// //     // Mocking 31 days for December
// //     final List<int> dates = List.generate(31, (index) => index + 1);

// //     return Container(
// //       padding: const EdgeInsets.all(10),
// //       decoration: BoxDecoration(
// //         border: Border.all(color: Colors.grey.shade300),
// //         borderRadius: BorderRadius.circular(10),
// //       ),
// //       child: Column(
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
// //               const Text(
// //                 "December 2025",
// //                 style: TextStyle(fontWeight: FontWeight.bold),
// //               ),
// //               const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
// //             ],
// //           ),
// //           const SizedBox(height: 10),
// //           GridView.builder(
// //             shrinkWrap: true,
// //             physics: const NeverScrollableScrollPhysics(),
// //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //               crossAxisCount: 7,
// //               crossAxisSpacing: 5,
// //               mainAxisSpacing: 5,
// //               childAspectRatio: 1.0,
// //             ),
// //             itemCount: 38, // 7 days header + 31 days
// //             itemBuilder: (context, index) {
// //               if (index < 7) {
// //                 return Center(
// //                   child: Text(
// //                     days[index],
// //                     style: const TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.blue,
// //                       fontSize: 12,
// //                     ),
// //                   ),
// //                 );
// //               }

// //               // Calculate date
// //               int date = dates[index - 7];
// //               bool isSelected = _selectedDate == date;

// //               return InkWell(
// //                 onTap: () {
// //                   setState(() {
// //                     _selectedDate = date;
// //                     // Update your data model
// //                     // widget.data.selectedDate = "2025-12-$date";
// //                   });
// //                 },
// //                 child: AnimatedContainer(
// //                   duration: const Duration(milliseconds: 200),
// //                   alignment: Alignment.center,
// //                   decoration: BoxDecoration(
// //                     color: isSelected ? Colors.blue : Colors.transparent,
// //                     borderRadius: BorderRadius.circular(5),
// //                     border: Border.all(
// //                       color: isSelected ? Colors.blue : Colors.grey.shade200,
// //                     ),
// //                   ),
// //                   child: Text(
// //                     '$date',
// //                     style: TextStyle(
// //                       color: isSelected ? Colors.white : Colors.black,
// //                       fontWeight: isSelected
// //                           ? FontWeight.bold
// //                           : FontWeight.normal,
// //                     ),
// //                   ),
// //                 ),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTimeSlotSection() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: _timeSlots.entries.map((entry) {
// //         return Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.only(bottom: 8, top: 10),
// //               child: Text(
// //                 entry.key,
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.blue,
// //                 ),
// //               ),
// //             ),
// //             Wrap(
// //               spacing: 8.0,
// //               runSpacing: 8.0,
// //               children: entry.value
// //                   .map((time) => _buildTimeSlotButton(time))
// //                   .toList(),
// //             ),
// //           ],
// //         );
// //       }).toList(),
// //     );
// //   }

// //   Widget _buildTimeSlotButton(String time) {
// //     bool isSelected = widget.data.selectedTimeSlot == time;
// //     return InkWell(
// //       onTap: () {
// //         setState(() {
// //           widget.data.selectedTimeSlot = time;
// //         });
// //       },
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// //         decoration: BoxDecoration(
// //           color: isSelected ? Colors.blue : Colors.grey.shade100,
// //           borderRadius: BorderRadius.circular(8),
// //           border: Border.all(
// //             color: isSelected ? Colors.blue : Colors.grey.shade300,
// //           ),
// //         ),
// //         child: Text(
// //           time,
// //           style: TextStyle(
// //             color: isSelected ? Colors.white : Colors.black,
// //             fontSize: 12,
// //             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Add this for easy month naming: flutter pub add intl

// class Step3DateTime extends StatefulWidget {
//   final dynamic data;
//   final VoidCallback onNext;

//   const Step3DateTime({super.key, required this.data, required this.onNext});

//   @override
//   State<Step3DateTime> createState() => _Step3DateTimeState();
// }

// class _Step3DateTimeState extends State<Step3DateTime> {
//   int? _selectedDate; // The day user clicked
//   DateTime _focusedDate = DateTime.now(); // The month user is looking at

//   final Map<String, List<String>> _timeSlots = {
//     'Morning': ['09:45', '10:45', '11:45'],
//     'Afternoon': ['01:30', '02:30', '03:45'],
//     'Evening': ['06:00', '07:00', '08:00'],
//   };

//   // Logic to change months
//   void _changeMonth(int offset) {
//     setState(() {
//       _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + offset);
//       _selectedDate = null; // Reset selection when switching months
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Select Date & Time",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//         const SizedBox(height: 15),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(flex: 1, child: _buildCalendarView()),
//             const SizedBox(width: 20),
//             Expanded(flex: 1, child: _buildTimeSlotSection()),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildCalendarView() {
//     final daysHeader = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

//     // Calculate total days in the focused month
//     final lastDayOfMonth = DateTime(
//       _focusedDate.year,
//       _focusedDate.month + 1,
//       0,
//     ).day;
//     // Calculate which weekday the 1st of the month starts on (0 for Sunday, 1 for Monday...)
//     final firstWeekday =
//         DateTime(_focusedDate.year, _focusedDate.month, 1).weekday % 7;

//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           // HEADER WITH WORKING BUTTONS
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back_ios, size: 16),
//                 onPressed: () => _changeMonth(-1),
//               ),
//               Text(
//                 DateFormat(
//                   'MMMM yyyy',
//                 ).format(_focusedDate), // Dynamic Month Year
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.arrow_forward_ios, size: 16),
//                 onPressed: () => _changeMonth(1),
//               ),
//             ],
//           ),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 7,
//               childAspectRatio: 1.0,
//             ),
//             itemCount: 7 + firstWeekday + lastDayOfMonth,
//             itemBuilder: (context, index) {
//               // 1. Weekday Headers
//               if (index < 7) {
//                 return Center(
//                   child: Text(
//                     daysHeader[index],
//                     style: const TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     ),
//                   ),
//                 );
//               }

//               // 2. Empty spaces for dates before the 1st of the month
//               if (index < 7 + firstWeekday) {
//                 return const SizedBox.shrink();
//               }

//               // 3. Actual Dates
//               int date = index - 6 - firstWeekday;
//               bool isSelected = _selectedDate == date;

//               return InkWell(
//                 onTap: () => setState(() => _selectedDate = date),
//                 child: Container(
//                   margin: const EdgeInsets.all(2),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: isSelected ? Colors.blue : Colors.transparent,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Text(
//                     "$date",
//                     style: TextStyle(
//                       color: isSelected ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimeSlotSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: _timeSlots.entries.map((entry) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               child: Text(
//                 entry.key,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             Wrap(
//               spacing: 8,
//               children: entry.value.map((time) {
//                 bool isSelected = widget.data.selectedTimeSlot == time;
//                 return ChoiceChip(
//                   label: Text(time),
//                   selected: isSelected,
//                   onSelected: (val) =>
//                       setState(() => widget.data.selectedTimeSlot = time),
//                 );
//               }).toList(),
//             ),
//           ],
//         );
//       }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Step3DateTime extends StatefulWidget {
  final dynamic data;
  final VoidCallback onNext;

  const Step3DateTime({super.key, required this.data, required this.onNext});

  @override
  State<Step3DateTime> createState() => _Step3DateTimeState();
}

class _Step3DateTimeState extends State<Step3DateTime> {
  int? _selectedDate;
  DateTime _focusedDate = DateTime.now();

  final Map<String, List<String>> _timeSlots = {
    'Morning': ['09:45', '10:45', '11:45', '09:45', '10:45', '11:45'],
    'Afternoon': ['01:30', '02:30', '03:45', '09:45', '10:45', '11:45'],
    'Evening': ['06:00', '07:00', '08:00'],
  };

  void _changeMonth(int offset) {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + offset);
      _selectedDate = null; // Clear selection when month changes
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate calendar variables
    final firstDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month, 1);
    final lastDayOfMonth = DateTime(
      _focusedDate.year,
      _focusedDate.month + 1,
      0,
    ).day;

    // 0 = Sunday, 1 = Monday, etc.
    final int firstWeekday = firstDayOfMonth.weekday % 7;
    final List<String> daysHeader = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Date & Time",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CALENDAR SIDE
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Month Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, size: 14),
                          onPressed: () => _changeMonth(-1),
                        ),
                        Text(
                          DateFormat('MMMM yyyy').format(_focusedDate),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios, size: 14),
                          onPressed: () => _changeMonth(1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Days Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                      // Total items = 7 headers + offset + days in month
                      itemCount: 7 + firstWeekday + lastDayOfMonth,
                      itemBuilder: (context, index) {
                        // 1. Render Headers
                        if (index < 7) {
                          return Center(
                            child: Text(
                              daysHeader[index],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          );
                        }

                        // 2. Render Empty Padding
                        if (index < 7 + firstWeekday) {
                          return const SizedBox.shrink();
                        }

                        // 3. Render Dates
                        final int dateValue = index - 6 - firstWeekday;
                        final bool isSelected = _selectedDate == dateValue;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = dateValue;
                              // Save to your data model
                              widget.data.selectedDate = DateTime(
                                _focusedDate.year,
                                _focusedDate.month,
                                dateValue,
                              );
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.grey.shade200,
                              ),
                            ),
                            child: Text(
                              "$dateValue",
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            // TIME SLOTS SIDE
            Expanded(flex: 1, child: _buildTimeSlots()),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeSlots() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _timeSlots.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                entry.key,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: entry.value.map((time) {
                final bool isTimeSelected =
                    widget.data.selectedTimeSlot == time;
                return ChoiceChip(
                  label: Text(time),
                  selected: isTimeSelected,
                  onSelected: (selected) {
                    setState(() => widget.data.selectedTimeSlot = time);
                  },
                );
              }).toList(),
            ),
          ],
        );
      }).toList(),
    );
  }
}
