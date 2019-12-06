import 'dart:convert';
import 'package:tutored/model/job.dart';
import 'package:http/http.dart' as http;

class JobService {
  final String _token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InN0LmFudEBnLmNvbSIsInJvbGUiOiJzdHVkZW50IiwiaWQiOiJPX3hRUHlFWVYiLCJpYXQiOjE1NzU2MTk4NzMsInN1YiI6IjIzNjI2MCJ9.mnSp5o99M9HkMZNIwQZxWnTgYUGvf-NHaGZRj0AwOHw';

  Future<List<Job>> getJobs() async {
    final http.Response response =
        await http.get('https://api-stage.tutored.me/api/v1/jobs/', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    });

    List<Job> jobs = <Job>[];
    if (response.statusCode == 200) {
      final Iterable<dynamic> list = json.decode(response.body);
      jobs = list.map<Job>((dynamic model) => Job.fromJson(model)).toList();

      return jobs;
    }

    throw Exception('error on getting jobs: ' + response.statusCode.toString());
  }
}
