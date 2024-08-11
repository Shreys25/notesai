import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesai/pages/HomeTab/bloc/appusage_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Usage Dashboard'),
      ),
      body: BlocBuilder<AppusageBloc, AppusageState>(
        builder: (context, state) {
          if (state is UsageInitial) {
            return const Center(child: Text('Press the button to fetch usage'));
          } else if (state is UsageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsageLoaded) {
            return ListView.builder(
              itemCount: state.topApps.length,
              itemBuilder: (context, index) {
                AppUsageInfo app = state.topApps[index];
                return ListTile(
                  title: Text(app.appName),
                  subtitle: Text("Usage: ${app.usage.inMinutes} minutes"),
                  leading: const Icon(Icons.apps),
                );
              },
            );
          } else if (state is UsageError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
