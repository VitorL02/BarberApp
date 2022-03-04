import 'package:barberapp/database/db_helper.dart';
import 'package:barberapp/models/schedule.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addSchedule({Schedule? schedule}) async {
    return await DbHelper.insert(schedule);
  }
}
