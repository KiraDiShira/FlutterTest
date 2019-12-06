import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutored/model/job.dart';
import 'package:tutored/state/job_summary_state.dart';

import '../../route_constants.dart';

class JobSummaryWidget extends StatelessWidget {
 const JobSummaryWidget({this.job});
 final Job job;

  @override
  Widget build(BuildContext context) {
    return
     ListTile(
       onTap:()  {
       final JobSummaryState jobSummaryState = Provider.of<JobSummaryState>(context, listen:false);
                  jobSummaryState.setJob(job);
         Navigator.of(context).pushNamed(RoutesConstants.jobDetailScreenRoute);
       },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(job.position),
      Text(job.typeName,
       style: TextStyle(fontWeight: FontWeight.bold),)
      ],) ,
      subtitle: Text(job.locationName.toUpperCase()),

      trailing: CircleAvatar(
    backgroundImage: NetworkImage(job.image),
  ),
      );
  }
}