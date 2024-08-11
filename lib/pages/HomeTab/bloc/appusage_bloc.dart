import 'package:app_usage/app_usage.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appusage_event.dart';
part 'appusage_state.dart';

class AppusageBloc extends Bloc<AppusageEvent, AppusageState> {
  AppusageBloc() : super(AppusageInitial()) {
    on<FetchUsageEvent>(_onFetchUsage);
  }

  Future<void> _onFetchUsage(
      FetchUsageEvent event, Emitter<AppusageState> emit) async {
    emit(UsageLoading());
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(Duration(hours: 1));
      List<AppUsageInfo> infoList =
          await AppUsage().getAppUsage(startDate, endDate);

      for (var info in infoList) {
        print(info.toString());
      }
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }
}
