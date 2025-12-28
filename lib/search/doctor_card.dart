import 'package:flutter/material.dart';
import 'data_model.dart'; // Make sure to import the model

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final bool isGridView;

  const DoctorCard({super.key, required this.doctor, this.isGridView = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: isGridView ? _buildGridCard() : _buildListCard(),
      ),
    );
  }

  // --- Grid View Layout ---
  Widget _buildGridCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Section: Image, Rating, Wishlist
        Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  doctor.imagePath,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 14),
                    Text(
                      doctor.rating.toStringAsFixed(1),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 5,
              right: 5,
              child: Icon(Icons.favorite_border, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Specialization and Availability
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              doctor.specialization,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (doctor.isAvailable)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "• Available",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),

        // Name and Location
        Text(
          doctor.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(doctor.location, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),

        // Fee and Booking
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Consultation Fees",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "\$${doctor.consultationFee}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Book Now"),
            ),
          ],
        ),
      ],
    );
  }

  // --- List View Layout ---
  Widget _buildListCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: Image and Rating
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                doctor.imagePath,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                Text(
                  doctor.rating.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 15),

        // Middle: Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    doctor.specialization,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (doctor.isAvailable)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "• Available",
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                    ),
                ],
              ),
              Text(
                doctor.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                doctor.qualification,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.grey, size: 16),
                  Text(
                    doctor.location,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  // This is where "Get Direction" would go
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "Consultation Fees: ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "\$${doctor.consultationFee}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),

        // Right: Availability and Book Button
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Next available at",
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              doctor.nextAvailability,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Book Appointment"),
            ),
          ],
        ),
      ],
    );
  }
}
