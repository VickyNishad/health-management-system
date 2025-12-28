class PatientInfo {
  final String name;
  final String mobile;
  final String age;
  final String? note;

  PatientInfo({
    required this.name,
    required this.mobile,
    required this.age,
    this.note,
  });
}
