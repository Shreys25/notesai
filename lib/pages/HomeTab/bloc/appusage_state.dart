part of 'appusage_bloc.dart';

@immutable
sealed class AppusageState {
  const AppusageState();
  //@override
  List<Object> get props => [];
}

final class AppusageInitial extends AppusageState {}

class AppusageLoading extends AppusageState {}

class UsageInitial extends AppusageState {}

class UsageLoading extends AppusageState {}

class UsageLoaded extends AppusageState {
  final List<AppUsageInfo> topApps;

  const UsageLoaded(this.topApps);

  @override
  List<Object> get props => [topApps];
}

class UsageError extends AppusageState {
  final String message;

  const UsageError(this.message);

  @override
  List<Object> get props => [message];
}
