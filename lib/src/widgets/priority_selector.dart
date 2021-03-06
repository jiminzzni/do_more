import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/task_model.dart';
import '../utils.dart';

/// A wdiget that lets you select the priority of a task.
class PrioritySelector extends StatefulWidget {
  /// Width of the selector.
  ///
  /// If none is provided it expands as much as it can horizontally.
  final double width;

  /// Function to be called when the current selected priority changes.
  final Function(TaskPriority) onChage;

  PrioritySelector({
    this.width,
    @required this.onChage,
  });

  _PrioritySelectorState createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  TaskPriority selectedPriority = TaskPriority.high;

  static const kCheckMark = Center(
    child: Icon(
      FontAwesomeIcons.checkCircle,
      color: Colors.white,
    ),
  );

  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: widget.width,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: GestureDetector(
              onTap: () => updatePriority(TaskPriority.high),
              child: Container(
                decoration: BoxDecoration(
                  color: kHighPriorityColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    selectedPriority == TaskPriority.high ? kCheckMark : null,
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 8,
            child: GestureDetector(
              onTap: () => updatePriority(TaskPriority.medium),
              child: Container(
                decoration: BoxDecoration(
                  color: kMediumPriorityColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    selectedPriority == TaskPriority.medium ? kCheckMark : null,
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => updatePriority(TaskPriority.low),
              child: Container(
                decoration: BoxDecoration(
                  color: kLowPriorityColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: selectedPriority == TaskPriority.low ? kCheckMark : null,
              ),
            ),
            flex: 8,
          ),
        ],
      ),
    );
  }

  /// Sets the selected priority and calls the onChange method with it.
  void updatePriority(TaskPriority priority) {
    widget.onChage(priority);
    setState(() {
      selectedPriority = priority;
    });
  }
}
