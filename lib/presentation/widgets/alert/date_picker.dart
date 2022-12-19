import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/cancel_button.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';

import '../../../const/app_colors.dart';

class DatePicker extends StatelessWidget {
  DateTime _selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.calenderBackground,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200.0,
            width: 300.0,
            child: DatePickerWidget(
              looping: false, // default is not looping
              firstDate: DateTime.now(), //DateTime(1960),
              //  lastDate: DateTime(2002, 1, 1),
//              initialDate: DateTime.now(),// DateTime(1994),
              dateFormat:
                  // "MM-dd(E)",
                  "dd/MMMM/yyyy",
              // locale: DatePicker.localeFromString('th'),
              onChange: (DateTime newDate, _) {
                _selectDate = newDate;
              },
              pickerTheme: const DateTimePickerTheme(
                backgroundColor: AppColors.transparent,
                itemTextStyle: AppTextStyles.appBarTitle,
                dividerColor: AppColors.cardShaddow,
              ),
            ),
          ),
          Row(
            children: [
              CancelButton(
                width: 120.0,
                onPressed: () {
                  Navigator.pop(context, DateTime.now());
                },
                text: "Cancel",
              ),
              SubmitButton(
                width: 120.0,
                onPressed: () {
                  Navigator.pop(context, _selectDate);
                },
                text: "Select Date",
              )
            ],
          )
        ],
      ),
    );
  }
}
