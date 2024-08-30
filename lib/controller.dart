import 'package:get/get.dart';

class TaskController extends GetxController {
  List<String>tasks = ['task1', 'task2'].obs;
  List<bool> isCheckedList = [false,false].obs;


  void addTask(String taskname) {
    tasks.add(taskname);
    isCheckedList.add(false);
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    isCheckedList.removeAt(index);
  }

  void complete_task(int index,bool value){
    isCheckedList[index]=true;
  }


}