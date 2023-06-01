import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateProvider with ChangeNotifier {
  DateTime? _selectedDate;
  // TextEditingController? _selectedDate;

  DateTime? get selectedDate {
    return _selectedDate;
  }

  void pickDateDialog(BuildContext context, final controller) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        _selectedDate = pickedDate;
        controller.text = DateFormat.yMd().format(pickedDate);
        //c.text = pickedDate.toString();
        // notifyListeners();
      }
    });
  }
}
