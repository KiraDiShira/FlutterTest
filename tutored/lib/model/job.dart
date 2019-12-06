class Job{
    Job({this.id, this.position, this.locationName, this.typeName, this.detailImg, this.image, this.description, this.requirements});
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['job_id'],
      position: json['job_position'],
      locationName: json['location_name'],
      typeName: json['type_name_it'],
      detailImg:json['job_detail_img'],
      image: json['job_img'],
      description: json['job_description'],
      requirements: json['job_requirements']
    );
  }
  int id;
  String position;
  String locationName;
  String typeName;
  String detailImg;
  String image;
  String description;
  String requirements;
}