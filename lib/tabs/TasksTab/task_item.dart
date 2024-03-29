import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/model/tasks_model.dart';
import 'package:todo_app/screens/edit_screen.dart';

// ignore: must_be_immutable
class TaskItem extends StatefulWidget {
  TaskModel taskModel;

  TaskItem({required this.taskModel, super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FireBaseFunctions.deleteTask(widget.taskModel.id ?? "");
              },
              backgroundColor: Colors.red,
              autoClose: true,
              icon: Icons.delete,
              spacing: 12,
              label: "Delete",
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            SlidableAction(
                onPressed: (context) {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const EditTaskScreen();
                    },
                  );
                  FireBaseFunctions.updateTask(
                    TaskModel(
                      title: widget.taskModel.title,
                      description: widget.taskModel.description,
                      date: widget.taskModel.hashCode,
                      userId: FirebaseAuth.instance.currentUser!.uid,
                    ),
                  );
                },
                backgroundColor: Colors.blue,
                autoClose: true,
                icon: Icons.edit,
                spacing: 12,
                label: "Edit"),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 8,
                decoration: BoxDecoration(
                  color: widget.taskModel.isDone! ? Colors.green : Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.taskModel.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(widget.taskModel.description ?? ""),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  widget.taskModel.isDone = true;
                  FireBaseFunctions.updateTask(widget.taskModel);
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color:
                          widget.taskModel.isDone! ? Colors.green : Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
