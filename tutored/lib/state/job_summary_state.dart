import 'package:tutored/model/job.dart';

class JobSummaryState  {
  Job _job;

  void setJob(Job job) {
    _job = job;
  }

  Job get job => _job;
}