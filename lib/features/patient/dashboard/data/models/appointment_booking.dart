import 'package:flutter/material.dart';

// --- Colors ---
const Color kPrimaryPurple = Color(0xFF7B61FF);
const Color kLightPurple = Color(0xFFEFE8FF);
const Color kPrimaryGreen = Color(0xFF4CAF50); // For completed status text
const Color kGreenCompleted = Color(0xFFE5F7E5);
const Color kRedCancelled = Color(0xFFFFE5E5);

// --- Data Model ---
class Appointment {
  final String doctorName;
  final String specialization;
  final String tokenNo;
  final String clinicName;
  final String date;
  final String timeRange;
  final String status;

  Appointment({
    required this.doctorName,
    required this.specialization,
    required this.tokenNo,
    required this.clinicName,
    required this.date,
    required this.timeRange,
    required this.status,
  });
}

// --- Dummy Data ---
final List<Appointment> appointments = [
  Appointment(
    doctorName: 'Dr. A. Sharma',
    specialization: 'Dermatologist',
    tokenNo: 'TKN001',
    clinicName: 'City Care Clinic - 411001',
    date: 'Sep 20, 2025',
    timeRange: '10:00 – 10:30 AM',
    status: 'Cancelled',
  ),
  Appointment(
    doctorName: 'Dr. B. Patel',
    specialization: 'Pediatrician',
    tokenNo: 'TKN002',
    clinicName: 'Kids Health Center - 411002',
    date: 'Sep 21, 2025',
    timeRange: '11:00 – 11:30 AM',
    status: 'Completed',
  ),
  Appointment(
    doctorName: 'Dr. B. Patel',
    specialization: 'Pediatrician',
    tokenNo: 'TKN006',
    clinicName: 'Kids Health Center - 411002',
    date: 'Sep 21, 2025',
    timeRange: '11:00 – 11:30 AM',
    status: 'Completed',
  ),
  Appointment(
    doctorName: 'Dr. B. Patel',
    specialization: 'Pediatrician',
    tokenNo: 'TKN002',
    clinicName: 'Kids Health Center - 411002',
    date: 'Sep 21, 2025',
    timeRange: '11:00 – 11:30 AM',
    status: 'Completed',
  ),
  Appointment(
    doctorName: 'Dr. C. Lee',
    specialization: 'Cardiologist',
    tokenNo: 'TKN003',
    clinicName: 'Heart Care Hospital - 411003',
    date: 'Sep 22, 2025',
    timeRange: '12:00 – 12:30 PM',
    status: 'Pending',
  ),
  Appointment(
    doctorName: 'Dr. D. Wong',
    specialization: 'Orthopedic',
    tokenNo: 'TKN004',
    clinicName: 'Bone & Joint Clinic - 411004',
    date: 'Sep 23, 2025',
    timeRange: '1:00 – 1:30 PM',
    status: 'Rescheduled',
  ),
];
