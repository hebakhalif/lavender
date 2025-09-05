import 'package:lavender/features/home/data/models/quote.dart';

class QuoteResponse {
  final String status;
  final Quote quote;

  QuoteResponse({
    required this.status,
    required this.quote,
  });

  factory QuoteResponse.fromJson(Map<String, dynamic> json) {
    return QuoteResponse(
      status: json['status'] ?? '',
      quote: Quote.fromJson(json['quote']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'quote': quote.toJson(),
    };
  }
}

