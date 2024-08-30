import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2_fl/controller.dart';

class TaskScreen extends StatelessWidget {
 final TaskController taskController=Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount:taskController.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.task_outlined),
                  title: Text(taskController.tasks[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: taskController.isCheckedList[index],
                        activeColor: Colors.greenAccent,
                        onChanged: (bool? value) {
                          taskController.complete_task(index, value ?? false);
                        },
                      ),
                      if (taskController.isCheckedList[index])
                        Icon(Icons.check, color: Colors.greenAccent),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () {
                          taskController.deleteTask(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          _showAddTaskDialog(context);
        },
      ),
    );
  }


  void _showAddTaskDialog(BuildContext context) {
    TextEditingController taskNameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: TextField(
            controller: taskNameController,
            decoration: InputDecoration(hintText: 'Enter task name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (taskNameController.text.isNotEmpty) {
                  taskController.addTask(taskNameController.text);
                }
                Get.back();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
