import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicque_app/search/bokking/step_1_specialty.dart';
import 'package:medicque_app/search/bokking/step_2_appointment_type.dart';
import 'package:medicque_app/search/bokking/step_3_date_time.dart';
import 'package:medicque_app/search/bokking/step_4_basic_info.dart';
import 'package:medicque_app/search/bokking/step_5_payment.dart';
import 'package:medicque_app/search/bokking/step_6_confirmation.dart';
import 'booking_data.dart';
import 'progress_indicator.dart';

class BookingFlowScreen extends StatefulWidget {
  const BookingFlowScreen({super.key});

  @override
  State<BookingFlowScreen> createState() => _BookingFlowScreenState();
}

class _BookingFlowScreenState extends State<BookingFlowScreen> {
  int _currentStep = 1;
  final BookingData _bookingData = BookingData();
  final String _doctorName = "Dr. Michael Brown";
  final String _doctorSpecialty = "Psychologist";
  final double _doctorRating = 5.0;
  final String _doctorAddress =
      "5th Street - 1011 W 5th St, Suite 120, Austin, TX 78703";

  void _nextStep() {
    setState(() {
      if (_currentStep < 6) {
        _currentStep++;
      }
    });
  }

  void _starStep() {
    setState(() {
      if (_currentStep >= 6) {
        context.replace('/search');
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 1) {
        _currentStep--;
      }
    });
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 1:
        return Step1Specialty(data: _bookingData, onNext: _nextStep);
      case 2:
        return Step2AppointmentType(data: _bookingData, onNext: _nextStep);
      case 3:
        return Step3DateTime(data: _bookingData, onNext: _nextStep);
      case 4:
        return Step4BasicInfo(data: _bookingData, onNext: _nextStep);
      case 5:
        return Step5Payment(data: _bookingData, onNext: _nextStep);
      case 6:
        return Step6Confirmation(data: _bookingData, onNext: _starStep);
      default:
        return Container();
    }
  }

  String _titleButton() {
    switch (_currentStep) {
      case 1:
        return "Select Service";
      case 2:
        return "Select Appointment Type And Clinic";
      case 3:
        return "Select Date & Time";
      case 4:
        return "Add Basic Information";
      default:
        return "";
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text("Book Appointment"), centerTitle: false),
  //     backgroundColor: Colors.white,
  //     body: SingleChildScrollView(
  //       // padding: const EdgeInsets.all(20.0),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 20),
  //         child: Column(
  //           children: [
  //             // 1. Progress Indicator
  //             BookingProgressIndicator(currentStep: _currentStep),
  //             Container(
  //               // padding: EdgeInsets.all(20),
  //               decoration: BoxDecoration(
  //                 color: Colors.white54,

  //                 borderRadius: BorderRadius.circular(15),
  //                 border: Border.all(color: Colors.black, width: 0.1),
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.grey.withValues(alpha: 0.1),
  //                     blurRadius: 10,
  //                     offset: const Offset(0, 5),
  //                   ),
  //                 ],
  //               ),
  //               child: Column(
  //                 children: [
  //                   // 2. Doctor Info Card (Reusable)
  //                   Padding(
  //                     padding: const EdgeInsets.all(20.0),
  //                     child: _buildDoctorInfoCard(),
  //                   ),
  //                   // const Divider(),
  //                   Container(height: 0.1, color: Colors.black),
  //                   const SizedBox(height: 20),

  //                   // 3. Current Step Content
  //                   Padding(
  //                     padding: const EdgeInsets.only(
  //                       left: 20.0,
  //                       right: 20,
  //                       bottom: 20,
  //                     ),
  //                     child: Container(
  //                       padding: const EdgeInsets.all(20),
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.circular(15),
  //                         border: Border.all(color: Colors.black, width: 0.1),
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.grey.withValues(alpha: 0.1),
  //                             blurRadius: 10,
  //                             offset: const Offset(0, 8),
  //                           ),
  //                         ],
  //                       ),
  //                       child: _buildStepContent(),
  //                     ),
  //                   ),
  //                   _currentStep < 6
  //                       ? Container(height: 0.1, color: Colors.black)
  //                       : Container(),
  //                   // 4. Navigation Buttons (Managed by each step for custom text)
  //                   if (_currentStep < 6)
  //                     Padding(
  //                       padding: const EdgeInsets.all(20.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           if (_currentStep > 1)
  //                             ElevatedButton.icon(
  //                               onPressed: _previousStep,
  //                               icon: const Icon(Icons.arrow_back),
  //                               label: const Text("Back"),
  //                               style: ElevatedButton.styleFrom(
  //                                 foregroundColor: Colors.black,
  //                                 backgroundColor: Colors.grey.shade200,
  //                                 padding: const EdgeInsets.symmetric(
  //                                   horizontal: 20,
  //                                   vertical: 15,
  //                                 ),
  //                               ),
  //                             ),
  //                           Container(),
  //                           // The 'Next' button is implemented within each step widget
  //                           // to allow custom logic/validation before calling _nextStep().
  //                           // For demonstration, we'll keep the buttons here.
  //                           if (_currentStep < 5)
  //                             ElevatedButton.icon(
  //                               onPressed:
  //                                   _nextStep, // In a real app, this would have validation logic
  //                               icon: const Text("Next"),
  //                               // icon: Text(_titleButton()),
  //                               label: const Icon(Icons.arrow_forward),
  //                               style: ElevatedButton.styleFrom(
  //                                 foregroundColor: Colors.white,
  //                                 backgroundColor: Colors.blue,
  //                                 padding: const EdgeInsets.symmetric(
  //                                   horizontal: 20,
  //                                   vertical: 15,
  //                                 ),
  //                               ),
  //                             ),
  //                         ],
  //                       ),
  //                     ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment"), centerTitle: false),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 200,
          right: 200,
          bottom: 25,
          top: 10,
        ),
        child: Column(
          children: [
            // 1. FIXED Progress Indicator
            // We wrap this in Padding to maintain your design,
            // but it stays outside the scroll view.
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                // vertical: 10,
              ),
              child: BookingProgressIndicator(currentStep: _currentStep),
            ),

            // 2. SCROLLABLE Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  // Reduced horizontal padding for mobile compatibility,
                  // but you can keep 200.0 if this is for Web/Desktop.
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Doctor Info Card
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: _buildDoctorInfoCard(),
                        ),
                        Container(height: 0.1, color: Colors.black),
                        const SizedBox(height: 20),

                        // Current Step Content
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                                width: 0.1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: _buildStepContent(),
                          ),
                        ),

                        if (_currentStep < 6)
                          Container(height: 0.1, color: Colors.black),

                        // Navigation Buttons
                        if (_currentStep < 6)
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_currentStep > 1)
                                  ElevatedButton.icon(
                                    onPressed: _previousStep,
                                    icon: const Icon(Icons.arrow_back),
                                    label: const Text("Back"),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.grey.shade200,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 15,
                                      ),
                                    ),
                                  )
                                else
                                  const SizedBox.shrink(),

                                if (_currentStep < 5)
                                  ElevatedButton.icon(
                                    onPressed: _nextStep,
                                    icon: const Icon(Icons.arrow_forward),
                                    label: const Text("Next"),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 15,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text("Book Appointment"), centerTitle: false),
  //     backgroundColor:
  //         Colors.grey[100], // Light background to see the container better
  //     body: Center(
  //       child: Container(
  //         width: 1000,
  //         height: 800,
  //         // decoration: BoxDecoration(
  //         //   color: Colors.white,
  //         //   borderRadius: BorderRadius.circular(20),
  //         //   boxShadow: [
  //         //     BoxShadow(
  //         //       color: Colors.black.withOpacity(0.1),
  //         //       blurRadius: 20,
  //         //       offset: const Offset(0, 10),
  //         //     ),
  //         //   ],
  //         // ),
  //         // ClipRRect ensures children (like scroll effects) don't bleed past rounded corners
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(20),
  //           child: Column(
  //             children: [
  //               // 1. FIXED TOP: Progress Indicator
  //               Padding(
  //                 padding: const EdgeInsets.all(20.0),
  //                 child: BookingProgressIndicator(currentStep: _currentStep),
  //               ),

  //               const Divider(height: 1),

  //               // 2. SCROLLABLE MIDDLE: Doctor Info + Step Content
  //               Expanded(
  //                 child: SingleChildScrollView(
  //                   padding: const EdgeInsets.all(20.0),
  //                   child: Column(
  //                     children: [
  //                       _buildDoctorInfoCard(),
  //                       const SizedBox(height: 20),
  //                       Container(
  //                         width: double.infinity,
  //                         padding: const EdgeInsets.all(20),
  //                         decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(15),
  //                           border: Border.all(color: Colors.grey.shade300),
  //                         ),
  //                         child: _buildStepContent(),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),

  //               // 3. FIXED BOTTOM: Navigation Buttons
  //               if (_currentStep < 6) ...[
  //                 const Divider(height: 1),
  //                 Padding(
  //                   padding: const EdgeInsets.all(20.0),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       // Back Button
  //                       _currentStep > 1
  //                           ? OutlinedButton.icon(
  //                               onPressed: _previousStep,
  //                               icon: const Icon(Icons.arrow_back),
  //                               label: const Text("Back"),
  //                               style: OutlinedButton.styleFrom(
  //                                 padding: const EdgeInsets.symmetric(
  //                                   horizontal: 25,
  //                                   vertical: 15,
  //                                 ),
  //                               ),
  //                             )
  //                           : const SizedBox.shrink(),

  //                       // Next Button
  //                       ElevatedButton.icon(
  //                         onPressed: _nextStep,
  //                         icon: const Icon(Icons.arrow_forward),
  //                         label: const Text("Next"),
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: Colors.blue,
  //                           foregroundColor: Colors.white,
  //                           padding: const EdgeInsets.symmetric(
  //                             horizontal: 25,
  //                             vertical: 15,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDoctorInfoCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor Image (Placeholder)
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              'assets/images/doctor_img.png',
            ), // Use a placeholder image
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _doctorName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.white, size: 14),
                        Text(
                          _doctorRating.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                _doctorSpecialty,
                style: const TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.grey, size: 16),
                  Text(
                    _doctorAddress,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
