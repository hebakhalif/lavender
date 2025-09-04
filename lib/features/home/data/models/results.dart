import 'package:lavender/features/home/data/models/specialist.dart';

class Results {
  final String status;
  final List<Specialist> specialists;

  Results({
    required this.status,
    required this.specialists,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      status: json['status'] ?? '',
      specialists: (json['specialists'] as List)
          .map((e) => Specialist.fromJson(e))
          .toList(),
    );
  }
}
