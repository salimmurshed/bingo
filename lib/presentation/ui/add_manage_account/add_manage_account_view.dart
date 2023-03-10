import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_extensions/strings_extention.dart';
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
import '../../widgets/cards/snack_bar.dart';
import '../../widgets/dropdowns/selected_dropdown.dart';
import '../../widgets/text_fields/name_text_field.dart';
import 'add_manage_account_view_model.dart';

class AddManageAccountView extends StatelessWidget {
  const AddManageAccountView({super.key});

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
            title: Text(model.appBarTitle),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: AppMargins.addStoreBody,
              padding: AppPaddings.addStoreBody,
              decoration: const BoxDecoration(color: AppColors.background),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (model.responseMessage.isNotEmpty)
                    SnackBarRepo(
                      success: !model.responseStatus,
                      text: model.responseMessage,
                    ),
                  if (model.responseMessage.isNotEmpty) 20.0.giveHeight,
                  SelectedDropdown<BankAccountTypeModel>(
                      onChange: (BankAccountTypeModel value) {
                        model.changeBankAccountType(value);
                      },
                      dropdownValue: model.selectedBankAccountType,
                      hintText: AppString.bankAccounttype,
                      fieldName: AppString.bankAccounttype.isRequired,
                      //isRequired is an extension if we want to show
                      // require field
                      items: [
                        for (BankAccountTypeModel item in model.bankAccountType)
                          DropdownMenuItem<BankAccountTypeModel>(
                            value: item,
                            child: Text(item.title!),
                          )
                      ]),
                  model.bankAccountTypeValidation.validate(),
                  20.0.giveHeight,
                  SelectedDropdown<BankListData>(
                    onChange: (BankListData value) {
                      model.changeRetailerBankList(value);
                    },
                    dropdownValue: model.selectedBankName,
                    hintText: AppString.bankName,
                    fieldName: AppString.bankName.isRequired,
                    //isRequired is an extension if we want to show
                    // require field
                    items: [
                      for (BankListData item in model.retailerBankList)
                        DropdownMenuItem<BankListData>(
                          value: item,
                          child: Text(item.bpName!),
                        )
                    ],
                  ),
                  model.bankNameValidation.validate(),
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
                          fieldName: AppString.currency.isRequired,
                          //isRequired is an extension if we want to show
                          // require field
                          items: [
                            for (String item in model.currency)
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              )
                          ],
                        ),
                        model.currencyValidation.validate(),
                        20.0.giveHeight,
                      ],
                    ),
                  NameTextField(
                    isNumber: true,
                    controller: model.bankAccountController,
                    fieldName: AppString.bankAccountNumber.isRequired,
                    //isRequired is an extension if we want to show
                    // require field
                  ),
                  model.bankAccountValidation.validate(),
                  20.0.giveHeight,
                  NameTextField(
                    isNumber: true,
                    controller: model.ibanController,
                    fieldName: AppString.iban.isRequired,
                    //isRequired is an extension if we want to show
                    // require field
                  ),
                  model.ibanValidation.validate(),
                  20.0.giveHeight,
                  model.isBusy
                      ? const Center(
                          child: SizedBox(
                            height: 15.0,
                            width: 15.0,
                            child: CircularProgressIndicator(
                              color: AppColors.loader1,
                            ),
                          ),
                        )
                      : SubmitButton(
                          onPressed: model.isEdit
                              ? model.editAccount
                              : model.addAccount,
                          active: true,
                          text: model.appBarTitle.toUpperCase(),
                          width: 100.0.wp,
                          height: 45.0,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
