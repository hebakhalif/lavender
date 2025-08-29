part of 'onbording_cubit.dart';

@immutable
sealed class OnbordingState {}

final class OnbordingInitial extends OnbordingState {}

/*class OnbordingPageChanged extends OnbordingState {
  final int currentPage;
  OnbordingPageChanged(this.currentPage);
}*/
class OnbordingNotCompleted extends OnbordingState {}
class OnbordingCompleted extends OnbordingState {}

