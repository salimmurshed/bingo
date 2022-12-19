import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:flutter/material.dart';

class SelectedDropdownField extends StatelessWidget {
  SelectedDropdownField(
      {Key? key,
      required this.items,
      this.dropdownValue = "",
      this.fieldName = "",
      this.hintText = "",
      this.withHint = true,
      this.onChange})
      : super(key: key);
  defaultFunction(siteName) {}
  final List<String> items;
  final String dropdownValue;
  final String fieldName;
  final String hintText;
  final bool withHint;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName),
        15.0.giveHeight,
        Container(
          decoration: AppBoxDecoration.borderDecoration,
          height: 50.0,
          child: ButtonTheme(
            alignedDropdown: true,
            padding: AppPaddings.zero,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                itemHeight: 50.0,
                hint: Text(
                  hintText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFa5a5a5),
                  ),
                  textAlign: TextAlign.center,
                ),
                elevation: 0,
                isDense: false,
                isExpanded: true,
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                items: [
                  if (withHint)
                    DropdownMenuItem<String>(
                      value: '${AppString.selectText} $fieldName',
                      child: Text('${AppString.selectText} $fieldName'),
                    ),
                  for (var i = 0; i < items.length; i++)
                    DropdownMenuItem<String>(
                      value: items[i],
                      child: Text(items[i]),
                    )
                ],
                onChanged: (String? newValue) {
                  onChange!(newValue!) ?? () {};
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
