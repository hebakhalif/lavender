import 'package:flutter/material.dart';
import 'package:lavender/features/home/data/models/quote_response.dart';

@immutable
sealed class QuoteState {}

final class QuoteInitial extends QuoteState {}
final class QuotesLoading extends QuoteState {}

final class QuotesLoaded extends QuoteState {
  final QuoteResponse quote;
  QuotesLoaded(this.quote);
}

final class QuotesError extends QuoteState {
  final String message;
  QuotesError(this.message);
}

