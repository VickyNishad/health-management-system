class DoctorBooking {
  final String name;
  final String experience;
  final String location;
  final String clinic;
  final String description;
  final String imageUrl;
  final String appointmentDate;
  final String appointmentTime;

  DoctorBooking({
    required this.name,
    required this.experience,
    required this.location,
    required this.clinic,
    required this.description,
    required this.imageUrl,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory DoctorBooking.fromJson(Map<String, dynamic> json) => DoctorBooking(
    name: json['name'] ?? '',
    experience: json['experience'] ?? '',
    location: json['location'] ?? '',
    clinic: json['clinic'] ?? '',
    description: json['description'] ?? '',
    imageUrl: json['imageUrl'] ?? '',
    appointmentDate: json['appointmentDate'] ?? '',
    appointmentTime: json['appointmentTime'] ?? '',
  );
}
