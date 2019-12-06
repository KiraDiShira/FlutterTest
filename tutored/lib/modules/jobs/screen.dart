import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutored/model/job.dart';
import 'package:tutored/modules/job_summary/widget.dart';
import 'package:tutored/services/job_service.dart';
import 'package:tutored/widgets/app_error_widget.dart';
import 'package:tutored/widgets/loader_widget.dart';


class JobsScreen extends StatefulWidget {
  const JobsScreen();

  @override
  State<StatefulWidget> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
Future<List<Job>> _jobs;
JobService _jobService;

@override
  void initState() {
    super.initState();
    _jobService = Provider.of<JobService>(context, listen: false);
    _jobs = _jobService.getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Offers')),
      body:     
    FutureBuilder<List<Job>>(
        future: _jobs,
        builder: (BuildContext context, AsyncSnapshot<List<Job>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? _buildRoot(snapshot.data)
                  : AppErrorWidget(onPressed: () {
                      _jobs =  _jobService.getJobs();
                       setState(() {});
                    })
              : const LoaderWidget('loading jobs ...');
        }),) ;
  }

  Widget _buildRoot(List<Job> jobs) {
   return ListView.separated(
       separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey,
      ),
      
          itemCount: jobs.length,
          itemBuilder: (BuildContext context, int index) {
            return JobSummaryWidget(job: jobs[index]);
          },
        );
  }
}