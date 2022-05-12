import 'package:firedart/firedart.dart';

// ignore: unused_import
import '../../models/schedule.dart';

class DatabaseServices {
  CollectionReference scheduleCollection =
      Firestore.instance.collection('schedules');

  Future createNewSchedule(
      {String? name,
      String? service,
      int? isCompleted,
      String? date,
      String? startTime,
      String? endTime,
      int? color,
      String? repeatSchedule}) async {
    return await scheduleCollection.add({
      "name": name,
      "service": service,
      "isCompleted": isCompleted,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
      "color": color,
      "repeatSchedule": repeatSchedule
    });
  }

  Future deleteSchedule(id) async {
    return await scheduleCollection.document(id).delete();
  }

  Future<List<Document>> getSchedulesFromDatabase() async {
    Page<Document> schedules = await scheduleCollection.get();
    print(schedules);
    print(schedules.length);
    print(schedules.map((schedules) => schedules['date']));
    return schedules;
  }

  //TODO criar o update que atualiza uma schedule

  //TODO criar um metodo que filtra por data

  // Future scheduleDate(String date) async {
  //   QueryReference schedulesWhereCondition =
  //       await scheduleCollection.where(schedules['date']);
  //   print(schedulesWhereCondition);
  //   return schedulesWhereCondition;
  // }
}
