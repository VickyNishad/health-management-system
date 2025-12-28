class DoctorSlotModel {
  final String name;
  final String experience;
  final String location;
  final String clinic;
  final List<DateModel> dates;

  DoctorSlotModel({
    required this.name,
    required this.experience,
    required this.location,
    required this.clinic,
    required this.dates,
  });

  factory DoctorSlotModel.fromJson(Map<String, dynamic> json) {
    return DoctorSlotModel(
      name: json['name'],
      experience: json['experience'],
      location: json['location'],
      clinic: json['clinic'],
      dates: (json['dates'] as List).map((e) => DateModel.fromJson(e)).toList(),
    );
  }
}

class DateModel {
  final int id;
  final String day;
  final String slots;
  final Map<String, List<SlotModel>> timeSections;

  DateModel({
    required this.id,
    required this.day,
    required this.slots,
    required this.timeSections,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) {
    final ts = json['timeSections'] as Map<String, dynamic>;

    return DateModel(
      id: json['id'],
      day: json['day'],
      slots: json['slots'],
      timeSections: ts.map(
        (key, value) => MapEntry(
          key,
          (value as List).map((e) => SlotModel.fromJson(e)).toList(),
        ),
      ),
    );
  }
}

class SlotModel {
  final int id;
  final String time;
  final String status;

  SlotModel({required this.id, required this.time, required this.status});

  factory SlotModel.fromJson(Map<String, dynamic> json) {
    return SlotModel(
      id: json['id'],
      time: json['time'],
      status: json['status'],
    );
  }
}
