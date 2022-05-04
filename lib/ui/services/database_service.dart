class DatabaseServices{
  //TODO adicionar a lib do firedart
    CollectionReference scheduleCollection = FireStore.instance.collection('schedules');

    Future createNewSchedule(String name,String service,int isCompleted,String date,String startTime,String endTime,int color,String repeatSchedule) async{
      return await scheduleCollection.add({
        "name":name,
        "service":service,
        "isCompleted":isCompleted,
        "date":date,
        "startTime":startTime,
        "endTime":endTime,
        "color":color,
        "repeatSchedule":repeatSchedule
      });
    }

    //TODO criar o delete de uma Schedule

    //TODO criar a busca de todas as schedules


    //TODO criar a lista de todas as schedules

    //TODO criar o update que informa se uma schedule 

    
}