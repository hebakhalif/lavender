import 'package:lavender/features/home/data/models/results.dart';

class SpecialistsResponse {
  final int count;
  final String? next;
  final String? previous;
  final Results results;

  SpecialistsResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory SpecialistsResponse.fromJson(Map<String, dynamic> json) {
    return SpecialistsResponse(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      results: Results.fromJson(json['results']),
    );
  }
}

