import 'package:flutter/material.dart';
import 'package:medicque_app/search/bokking/booking_data.dart';

class Step1Specialty extends StatefulWidget {
  final BookingData data;
  final VoidCallback onNext;

  const Step1Specialty({super.key, required this.data, required this.onNext});

  @override
  State<Step1Specialty> createState() => _Step1SpecialtyState();
}

class _Step1SpecialtyState extends State<Step1Specialty> {
  String? _selectedService;

  @override
  void initState() {
    super.initState();
    _selectedService = widget.data.service;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Select Specialty Dropdown
        const Text(
          "Select Specialty",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        DropdownButtonFormField<String>(
          dropdownColor: Colors.white,
          value: widget.data.specialty,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),

          items: ['Cardiology', 'Psychologist']
              .map(
                (value) =>
                    DropdownMenuItem<String>(value: value, child: Text(value)),
              )
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.data.specialty = newValue!;
            });
          },
        ),

        const SizedBox(height: 20),

        // Services Grid
        const Text(
          "Services",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        // GridView.count(
        //   crossAxisCount: 3,
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   childAspectRatio: 1.5,
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        //   children: [
        //     _buildServiceCard('Echocardiograms', 310),
        //     _buildServiceCard('Stress tests', 754),
        //     _buildServiceCard('Heart Catheterization', 150),
        //   ],
        // ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250, // ⬅ max width of each card
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            childAspectRatio: 3,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            final items = [
              ['Echocardiograms', 310],
              ['Stress tests', 754],
              ['Heart Catheterization', 150],
              ['Echocardiograms', 310],
              ['Stress tests', 754],
              ['Heart Catheterization', 150],
            ];
            return _buildServiceCard(
              items[index][0] as String,
              items[index][1] as int,
            );
          },
        ),
        const SizedBox(height: 30),

        // Custom Navigation button for this step
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     ElevatedButton.icon(
        //       onPressed: _selectedService != null ? widget.onNext : null,
        //       // icon: const Text("Select Appointment Type"),
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
    );
  }

  Widget _buildServiceCard(String serviceName, int price) {
    bool isSelected = _selectedService == serviceName;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedService = serviceName;
          widget.data.service = serviceName;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.blue.withOpacity(0.05) : Colors.white,
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  serviceName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('\$$price', style: TextStyle(color: Colors.grey)),
              ],
            ),
            if (isSelected)
              const Positioned(
                top: 5,
                right: 5,
                child: Icon(Icons.check_circle, color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}
