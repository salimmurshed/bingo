import 'dart:io';

import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_extensions/strings_extention.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:bingo_wholesale/presentation/widgets/cards/single_lin_shimmer.dart';
import 'package:bingo_wholesale/presentation/widgets/text_fields/name_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../data_models/models/store_model/store_model.dart';
import '../../widgets/dropdowns/selected_dropdown.dart';
import '../../widgets/dropdowns/selected_dropdown_field.dart';
import 'add_store_screen_view_model.dart';

class AddStoreView extends StatelessWidget {
  const AddStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddStoreViewModel>.reactive(
      viewModelBuilder: () => AddStoreViewModel(),
      onModelReady: (AddStoreViewModel model) {
        if (ModalRoute.of(context)!.settings.arguments != null) {
          model.setDetails(
              ModalRoute.of(context)!.settings.arguments as StoreData);
        }
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.appBarColorRetailer,
            title: Text(model.title),
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
                  NameTextField(
                    controller: model.locationNameController,
                    fieldName: AppString.locationName.isRequired,
                  ),
                  model.locationNameValidation.validate(),
                  20.0.giveHeight,
                  model.isBusy
                      ? const SingleLineShimmerScreen()
                      : SelectedDropdown<String>(
                          onChange: (String value) {
                            model.changeCity(value);
                          },
                          dropdownValue: model.selectedCity,
                          hintText: AppString.selectCity,
                          fieldName: AppString.city.isRequired,
                          items: model.allCityData
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                        ),
                  model.selectedCityValidation.validate(),
                  20.0.giveHeight,
                  model.isBusy
                      ? const SingleLineShimmerScreen()
                      : SelectedDropdown<String>(
                          onChange: (String value) {
                            model.changeCountry(value);
                          },
                          dropdownValue: model.selectedCountry,
                          hintText: AppString.selectCountry,
                          fieldName: AppString.country.isRequired,
                          items: [
                            DropdownMenuItem<String>(
                              value: model.allCountryData,
                              child: Text(model.allCountryData),
                            ),
                          ],
                        ),
                  model.selectedCountryValidation.validate(),
                  20.0.giveHeight,
                  Text(
                    AppString.address.isRequired,
                    style: AppTextStyles.successStyle
                        .copyWith(color: AppColors.blackColor),
                  ),
                  10.0.giveHeight,
                  TextField(
                    onTap: () {
                      model.addAddress(context);
                    },
                    readOnly: true,
                    controller: model.addressController,
                    decoration: AppInputStyles.ashOutlineBorder,
                    maxLines: 3,
                  ),
                  model.addressValidation.validate(),
                  20.0.giveHeight,
                  Text(
                    AppString.frontBusinessPhoto.isRequired,
                    style: AppTextStyles.successStyle
                        .copyWith(color: AppColors.blackColor),
                  ),
                  10.0.giveHeight,
                  SubmitButton(
                    onPressed: model.pickFrontBusinessPhoto,
                    active: true,
                    text: AppString.chooseFiles,
                    width: 99.0,
                  ),
                  model.frontPhotoValidation.validate(),
                  20.0.giveHeight,
                  model.frontBusinessPhoto != null
                      ? Container(
                          decoration: AppBoxDecoration.borderDecoration,
                          child: Image.file(
                            File(model.frontBusinessPhoto!.path),
                          ),
                        )
                      : SizedBox(),
                  if (model.frontBusinessPhoto != null) 20.0.giveHeight,
                  Text(
                    AppString.signBoardPhoto.isRequired,
                    style: AppTextStyles.successStyle
                        .copyWith(color: AppColors.blackColor),
                  ),
                  10.0.giveHeight,
                  SubmitButton(
                    onPressed: model.pickSignBoardPhoto,
                    active: true,
                    text: AppString.chooseFiles,
                    width: 99.0,
                  ),
                  if (model.signBoardPhotoValidation.isNotEmpty)
                    validationText(model.signBoardPhotoValidation),
                  20.0.giveHeight,
                  if (model.signBoardPhoto != null)
                    Container(
                      decoration: AppBoxDecoration.borderDecoration,
                      child: Image.file(
                        File(model.signBoardPhoto!.path),
                      ),
                    ),
                  if (model.signBoardPhoto != null) 20.0.giveHeight,
                  Text(
                    AppString.remark,
                    style: AppTextStyles.successStyle
                        .copyWith(color: AppColors.blackColor),
                  ),
                  10.0.giveHeight,
                  TextField(
                    controller: model.remarkController,
                    decoration: AppInputStyles.ashOutlineBorder,
                    maxLines: 6,
                  ),
                  25.0.giveHeight,
                  SubmitButton(
                    onPressed: model.addStore,
                    active: true,
                    text: model.submitButton.toUpperCase(),
                    width: 100.0.wp,
                    height: 45.0,
                  ),
                  20.0.giveHeight,
                  SubmitButton(
                    onPressed: model.removeRequest,
                    color: AppColors.statusReject,
                    active: true,
                    text: AppString.remove.toUpperCase(),
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
