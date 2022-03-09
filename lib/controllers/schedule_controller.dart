// ignore_for_file: unnecessary_overrides

import 'package:barberapp/database/db_helper.dart';
import 'package:barberapp/models/schedule.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  @override
  void onReady() {
    getSchedules();
    super.onReady();
  }

  var schedulesList = <Schedule>[].obs;

  Future<int> addSchedule({Schedule? schedule}) async {
    return await DbHelper.insert(schedule);
  }

  void getSchedules() async {
    List<Map<String, dynamic>> schedules = await DbHelper.query();
    schedulesList
        .assignAll(schedules.map((data) => Schedule.fromJson(data)).toList());
  }
}
