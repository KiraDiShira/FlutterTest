import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutored/services/job_service.dart';
import 'package:tutored/state/job_summary_state.dart';
import 'package:tutored/tutored.dart';

void main() => runApp(RootInjector());

class RootInjector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        Provider<JobService>(
          create: (_) => JobService(),
        ),
          Provider<JobSummaryState>(
          create: (_) => JobSummaryState(),
        ),       
      ],
      child: Tutored(),
    );
  }
}