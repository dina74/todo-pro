// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/model/tasks_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DateTime chosenDate = DateTime.now();

  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Edit Task",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text(titleController.text),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text(descriptionController.text),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Select Date",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Text(
              chosenDate.toString().substring(0, 10),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                TaskModel model = TaskModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  date: DateUtils.dateOnly(chosenDate)
                      .millisecondsSinceEpoch
                      .toInt(),
                  userId: FirebaseAuth.instance.currentUser!.uid,
                );
                FireBaseFunctions.updateTask(model);
                Navigator.pop(context);
              },
              child: const Text(
                "Save Changes",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? selectDate = await showDatePicker(
      context: context,
      initialDate: chosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 360),
      ),
      selectableDayPredicate: (day) =>
          day != DateTime.now().add(const Duration(days: 2)),
    );
    if (selectDate != null) {
      chosenDate = selectDate;
      setState(() {});
    }
  }
}
