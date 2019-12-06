import 'package:flutter/material.dart';
import 'package:tutored/modules/job_detail/screen.dart';
import 'package:tutored/modules/jobs/screen.dart';
import 'package:tutored/route_constants.dart';

class Tutored extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutored',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JobsScreen(),
      onGenerateRoute: (RouteSettings settings) {
        return _buildRoutes(settings);
      },
    );
  }

    MaterialPageRoute<dynamic> _buildRoutes(
      RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.jobDetailScreenRoute:
        return MaterialPageRoute<JobDetail>(
            builder: (BuildContext context) =>  JobDetail());
        break;
    }

    throw Exception('missing route: ${settings.name}');
      }
}
