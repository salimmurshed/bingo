import 'package:bingo_wholesale/const/all_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../const/app_colors.dart';
import '../../../const/app_sizes/app_sizes.dart';
import '../../widgets/buttons/submit_button.dart';
import '../../widgets/dropdowns/selected_dropdown_field.dart';
import '../../widgets/text_fields/name_text_field.dart';
import 'add_manage_account_view_model.dart';

class AddManageAccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddManageAccountViewModel>.reactive(
        viewModelBuilder: () => AddManageAccountViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.appBarColorRetailer,
              // title: Text(model.title),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: AppMargins.addStoreBody,
                padding: AppPaddings.addStoreBody,
                decoration: BoxDecoration(color: AppColors.background),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SelectedDropdownField(
                      onChange: (String value) {
                        // model.changeCity(value);
                      },
                      dropdownValue: 'a',
                      hintText: 'a',
                      fieldName: AppString.bankAccounttype,
                      items: ['a'],
                    ),
                    20.0.giveHeight,
                    SelectedDropdownField(
                      onChange: (String value) {
                        // model.changeCity(value);
                      },
                      dropdownValue: 'a',
                      hintText: "a",
                      fieldName: AppString.bankName,
                      items: ['a'],
                    ),
                    20.0.giveHeight,
                    SelectedDropdownField(
                      onChange: (String value) {
                        // model.changeCity(value);
                      },
                      dropdownValue: 'a',
                      hintText: "a",
                      fieldName: AppString.currency,
                      items: ['a'],
                    ),
                    20.0.giveHeight,
                    NameTextField(
                      // controller: model.locationName,
                      fieldName: AppString.bankAccountNumber,
                    ),
                    20.0.giveHeight,
                    NameTextField(
                      // controller: model.locationName,
                      fieldName: AppString.iban,
                    ),
                    20.0.giveHeight,
                    SubmitButton(
                      // onPressed: model.removeRequest,
                      active: true,
                      text: AppString.addManageAccount.toUpperCase(),
                      width: 100.0.wp,
                      height: 45.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
