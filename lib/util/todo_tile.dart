import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onEdit;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(6, 22, 85, 1.0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // checkbox
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              checkColor: const Color.fromRGBO(131, 211, 255, 0.5),
              fillColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color.fromRGBO(6, 22, 85, 1.0); //checked
                }
                return Colors.blue; //unchecked
              }),
            ),
            // task name
            Expanded(
              child: Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: taskCompleted ? 2.5 : 0,
                ),
              ),
            ),
            IconButton(
              onPressed: onEdit,
              icon: const Icon(
                  Icons.edit,
                  color: Color.fromRGBO(131, 211, 255, 0.5)),
            ),
          ],
        ),
      ),
    ),
    );
  }
}