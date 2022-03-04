// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class Schedule {
  int? id;
  String? name;
  String? service;
  int? isCompleted;
  String? date;
  String? starTime;
  String? endTime;
  int? color;
  String? repeatSchedule;

  Schedule({
    this.id,
    this.name,
    this.service,
    this.isCompleted,
    this.date,
    this.starTime,
    this.endTime,
    this.color,
    this.repeatSchedule,
  });

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    service = json['service'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    starTime = json['starTime'];
    endTime = json['endTime'];
    color = json['color'];
    repeatSchedule = json['repeatSchedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['service'] = this.service;
    data['isCompleted'] = this.isCompleted;
    data['date'] = this.date;
    data['starTime'] = this.starTime;
    data['endTime'] = this.endTime;
    data['color'] = this.color;
    data['repeatSchedule'] = this.repeatSchedule;
    return data;
  }
}
