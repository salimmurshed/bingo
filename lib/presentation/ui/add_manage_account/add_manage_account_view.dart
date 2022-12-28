import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../const/app_colors.dart';
import '../../../const/app_sizes/app_sizes.dart';
import '../../../data/data_source/bank_account_type.dart';
import '../../../data_models/models/component_models/bank_list.dart';
import '../../../data_models/models/retailer_bank_list/retailer_bank_list.dart';
import '../../widgets/buttons/submit_button.dart';
import '../../widgets/dropdowns/selected_dropdown.dart';
import '../../widgets/text_fields/name_text_field.dart';
import 'add_manage_account_view_model.dart';

class AddManageAccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddManageAccountViewModel>.reactive(
        viewModelBuilder: () => AddManageAccountViewModel(),
        onModelReady: (AddManageAccountViewModel model) {
          if (ModalRoute.of(context)!.settings.arguments != null) {
            model.setData(ModalRoute.of(context)!.settings.arguments
                as RetailerBankListData);
          }
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.appBarColorRetailer,
              title: Text(AppBarTitles.addManageAccount),
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
                    SelectedDropdown<BankAccountTypeModel>(
                        onChange: (BankAccountTypeModel value) {
                          model.changeBankAccountType(value);
                        },
                        dropdownValue: model.selectedBankAccountType,
                        hintText: AppString.bankAccounttype,
                        fieldName: AppString.bankAccounttype,
                        items: [
                          for (BankAccountTypeModel item
                              in model.bankAccountType)
                            DropdownMenuItem<BankAccountTypeModel>(
                              value: item,
                              child: Text(item.title!),
                            )
                        ]),
                    if (model.bankAccountTypeValidation.isNotEmpty)
                      validationText(model.bankAccountTypeValidation),
                    20.0.giveHeight,
                    SelectedDropdown<BankListData>(
                      onChange: (BankListData value) {
                        model.changeRetailerBankList(value);
                      },
                      dropdownValue: model.selectedBankName,
                      hintText: AppString.bankName,
                      fieldName: AppString.bankName,
                      items: [
                        for (BankListData item in model.retailerBankList)
                          DropdownMenuItem<BankListData>(
                            value: item,
                            child: Text(item.bpName!),
                          )
                      ],
                    ),
                    if (model.bankNameValidation.isNotEmpty)
                      validationText(model.bankNameValidation),
                    20.0.giveHeight,
                    if (model.selectedBankName != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectedDropdown<String>(
                            onChange: (String value) {
                              model.changeCurrency(value);
                            },
                            dropdownValue: model.selectedCurrency,
                            hintText: AppString.currency,
                            fieldName: AppString.currency,
                            items: [
                              for (String item in model.currency)
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                )
                            ],
                          ),
                          if (model.currencyValidation.isNotEmpty)
                            validationText(model.currencyValidation),
                          20.0.giveHeight,
                        ],
                      ),
                    NameTextField(
                      controller: model.bankAccountController,
                      fieldName: AppString.bankAccountNumber,
                    ),
                    if (model.bankAccountValidation.isNotEmpty)
                      validationText(model.bankAccountValidation),
                    20.0.giveHeight,
                    NameTextField(
                      controller: model.ibanController,
                      fieldName: AppString.iban,
                    ),
                    if (model.ibanValidation.isNotEmpty)
                      validationText(model.ibanValidation),
                    20.0.giveHeight,
                    model.isBusy
                        ? const SizedBox(
                            height: 15.0,
                            width: 15.0,
                            child: CircularProgressIndicator(
                              color: AppColors.loader1,
                            ))
                        : SubmitButton(
                            onPressed: model.addAccount,
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
