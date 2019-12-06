import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutored/model/job.dart';
import 'package:tutored/modules/job_summary/widget.dart';
import 'package:tutored/state/job_summary_state.dart';

class JobDetail extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final Job job = Provider.of<JobSummaryState>(context, listen: false).job;

    return Scaffold(
        appBar: AppBar(title: const Text('Dettaglio annuncio')),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: <Widget>[
          JobSummaryWidget(job: job),
          const Divider(),
          _buildImage(job),
          _buildParagraph('DESCRIPTION', job.description),
          const SizedBox(height: 35),
          _buildParagraph('REQUIREMENTS', job.requirements),
        ]));
  }

  Widget _buildParagraph(String title,String content){
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(title,  style: const TextStyle(color: Colors.grey),),
    const SizedBox(height: 5),
    Text(content, style: const TextStyle(color: Colors.grey))
  ],
);
  }

  Widget _buildImage(Job job) {
    return job.detailImg != null
        ?
        Container(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
          height: 200,
          child: 
         Image.network(job.detailImg)
         )
        : Container();
  }
}
