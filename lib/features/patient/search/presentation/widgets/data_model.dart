class Doctor {
  final String name;
  final String specialization;
  final String location;
  final double rating;
  final int consultationFee;
  final String nextAvailability;
  final String imagePath;
  final bool isAvailable;
  final int reviewsCount;
  final int votesCount;
  final String qualification;

  Doctor({
    required this.name,
    required this.specialization,
    required this.location,
    required this.rating,
    required this.consultationFee,
    required this.nextAvailability,
    required this.imagePath,
    required this.isAvailable,
    required this.reviewsCount,
    required this.votesCount,
    required this.qualification,
  });
}

final List<Doctor> dummyDoctors = [
  Doctor(
    name: "Dr. Michael Brown",
    specialization: "Psychologist",
    location: "Minneapolis, MN",
    rating: 5.0,
    consultationFee: 650,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 95,
    votesCount: 200,
    qualification: "MBBS, MD - Psychiatry",
  ),
  Doctor(
    name: "Dr. Nicholas Tello",
    specialization: "Pediatrician",
    location: "Ogden, IA",
    rating: 4.8,
    consultationFee: 400,
    nextAvailability: "60 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 95,
    votesCount: 220,
    qualification: "MBBS, MD - Pediatrics",
  ),
  Doctor(
    name: "Dr. Harold Bryant",
    specialization: "Neurologist",
    location: "Winona, MS",
    rating: 4.8,
    consultationFee: 500,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 98,
    votesCount: 252,
    qualification: "MBBS, DNB - Neurology",
  ),
  Doctor(
    name: "Dr. Michael Brown",
    specialization: "Psychologist",
    location: "Minneapolis, MN",
    rating: 5.0,
    consultationFee: 650,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 95,
    votesCount: 200,
    qualification: "MBBS, MD - Psychiatry",
  ),
  Doctor(
    name: "Dr. Nicholas Tello",
    specialization: "Pediatrician",
    location: "Ogden, IA",
    rating: 4.8,
    consultationFee: 400,
    nextAvailability: "60 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 95,
    votesCount: 220,
    qualification: "MBBS, MD - Pediatrics",
  ),
  Doctor(
    name: "Dr. Harold Bryant",
    specialization: "Neurologist",
    location: "Winona, MS",
    rating: 4.8,
    consultationFee: 500,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 98,
    votesCount: 252,
    qualification: "MBBS, DNB - Neurology",
  ),
  Doctor(
    name: "Dr. Michael Brown",
    specialization: "Psychologist",
    location: "Minneapolis, MN",
    rating: 5.0,
    consultationFee: 650,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 95,
    votesCount: 200,
    qualification: "MBBS, MD - Psychiatry",
  ),
  Doctor(
    name: "Dr. Nicholas Tello",
    specialization: "Pediatrician",
    location: "Ogden, IA",
    rating: 4.8,
    consultationFee: 400,
    nextAvailability: "60 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 95,
    votesCount: 220,
    qualification: "MBBS, MD - Pediatrics",
  ),
  Doctor(
    name: "Dr. Harold Bryant",
    specialization: "Neurologist",
    location: "Winona, MS",
    rating: 4.8,
    consultationFee: 500,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 98,
    votesCount: 252,
    qualification: "MBBS, DNB - Neurology",
  ),
  Doctor(
    name: "Dr. Michael Brown",
    specialization: "Psychologist",
    location: "Minneapolis, MN",
    rating: 5.0,
    consultationFee: 650,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 95,
    votesCount: 200,
    qualification: "MBBS, MD - Psychiatry",
  ),
  Doctor(
    name: "Dr. Nicholas Tello",
    specialization: "Pediatrician",
    location: "Ogden, IA",
    rating: 4.8,
    consultationFee: 400,
    nextAvailability: "60 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 95,
    votesCount: 220,
    qualification: "MBBS, MD - Pediatrics",
  ),
  Doctor(
    name: "Dr. Harold Bryant",
    specialization: "Neurologist",
    location: "Winona, MS",
    rating: 4.8,
    consultationFee: 500,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 98,
    votesCount: 252,
    qualification: "MBBS, DNB - Neurology",
  ),

  Doctor(
    name: "Dr. Sandeep Bryant",
    specialization: "Neurologist",
    location: "Winona, MS",
    rating: 4.8,
    consultationFee: 500,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 98,
    votesCount: 252,
    qualification: "MBBS, DNB - Neurology",
  ),
  Doctor(
    name: "Dr. Prateek Bryant",
    specialization: "Neurologist",
    location: "Winona, MS",
    rating: 4.8,
    consultationFee: 500,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 98,
    votesCount: 252,
    qualification: "MBBS, DNB - Neurology",
  ),
  Doctor(
    name: "Dr. Viky Bryant",
    specialization: "Neurologist",
    location: "Winona, MS",
    rating: 4.8,
    consultationFee: 500,
    nextAvailability: "30 Min",
    imagePath: "assets/images/doctor_img.png", // Placeholder
    isAvailable: true,
    reviewsCount: 98,
    votesCount: 252,
    qualification: "MBBS, DNB - Neurology",
  ),
  // Add more dummy data to fill the grid...
];
