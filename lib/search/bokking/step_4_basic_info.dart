import 'package:flutter/material.dart';
import 'package:medicque_app/search/bokking/booking_data.dart';

class Step4BasicInfo extends StatefulWidget {
  final BookingData data;
  final VoidCallback onNext;

  const Step4BasicInfo({super.key, required this.data, required this.onNext});

  @override
  State<Step4BasicInfo> createState() => _Step4BasicInfoState();
}

class _Step4BasicInfoState extends State<Step4BasicInfo> {
  // Simple controller for mandatory fields
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBookingInfoSummary(),
          const SizedBox(height: 20),

          // Name and Phone
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  "First Name",
                  (val) => widget.data.firstName = val,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildTextField(
                  "Last Name",
                  (val) => widget.data.lastName = val,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(child: _buildTextField("Phone Number", (val) {})),
            ],
          ),
          const SizedBox(height: 15),

          // Email, Patient, Symptoms
          Row(
            children: [
              Expanded(child: _buildTextField("Email Address", (val) {})),
              const SizedBox(width: 15),
              Expanded(child: _buildDropdownField()),
              const SizedBox(width: 15),
              Expanded(child: _buildTextField("Symptoms", (val) {})),
            ],
          ),
          const SizedBox(height: 15),

          // Attachment
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Choose file"),
              ),
              const SizedBox(width: 10),
              const Text(
                "No file chosen",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Reason for Visit
          TextFormField(
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: "Reason for Visit",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 30),

          // Navigation Button
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     ElevatedButton.icon(
          //       onPressed: () {
          //         if (_formKey.currentState!.validate()) {
          //           _formKey.currentState!.save();
          //           widget.onNext();
          //         }
          //       },
          //       icon: const Text("Select Payment"),
          //       label: const Icon(Icons.arrow_forward),
          //       style: ElevatedButton.styleFrom(
          //         foregroundColor: Colors.white,
          //         backgroundColor: Colors.blue,
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 20,
          //           vertical: 15,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onSave) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required.';
        }
        return null;
      },
      onSaved: (value) => onSave(value!),
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Select Patient",
        border: OutlineInputBorder(),
      ),
      value: 'Andrew Fletcher',
      items: ['Andrew Fletcher', 'New Patient'].map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (String? newValue) {
        // Handle patient selection
      },
    );
  }

  Widget _buildBookingInfoSummary() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSummaryItem("Service", "${widget.data.service} (30 Mins)"),
          _buildSummaryItem(
            "Date & Time",
            "${widget.data.selectedTimeSlot}, 15, Oct",
          ),
          _buildSummaryItem(
            "Appointment type",
            "Clinic (${widget.data.clinicName})",
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
