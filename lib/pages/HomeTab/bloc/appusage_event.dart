part of 'appusage_bloc.dart';

@immutable
sealed class AppusageEvent {
  const AppusageEvent();

  List<Object> get props => [];
}

class FetchUsageEvent extends AppusageEvent {}
