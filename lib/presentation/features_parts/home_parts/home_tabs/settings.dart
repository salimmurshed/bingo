part of '../../../ui/home_screen/home_screen_view.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key, required this.model}) : super(key: key);
  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.requestSettingCardPadding,
      child: SizedBox(
        width: 100.0.wp,
        child: Stack(
          children: [
            RetailerTabsInSettingTab(model),
            model.settingTabTitle == HomePageSettingTabs.users
                ? Padding(
                    padding: AppPaddings.requestSettingTabViewPadding,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: AppPaddings.requestSettingTabColumnPadding,
                            child: SizedBox(
                              width: 100.0.wp,
                              height: 80.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(),
                                  SubmitButton(
                                    width: 100.0,
                                    text: AppString.addNew,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          for (int j = 0; j < 10; j++)
                            StatusCard(
                              title: "JOHN DOE".toUpperCase(),
                              subTitle: "",
                              status: "Active",
                              bodyFirstKey: "Email",
                              bodyFirstValue: "johndoe@mailnator.com",
                              bodySecondKey: "Role:",
                              bodySecondValue: "Finance",
                            ),
                        ],
                      ),
                    ),
                  )
                : model.settingTabTitle == HomePageSettingTabs.roles
                    ? Padding(
                        padding: AppPaddings.requestSettingTabViewPadding,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (int j = 0; j < 10; j++)
                                StatusCard(
                                  title: "Admin",
                                  subTitle: "",
                                  status: "Active",
                                  bodyFirstKey: "Date: ",
                                  bodyFirstValue: "2021-07-05 01:50:54",
                                  bodySecondKey: "",
                                  bodySecondValue: "",
                                ),
                            ],
                          ),
                        ),
                      )
                    : model.settingTabTitle == HomePageSettingTabs.stores
                        ? Padding(
                            padding: AppPaddings.requestSettingTabViewPadding,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: AppPaddings
                                        .requestSettingTabColumnPadding,
                                    child: SizedBox(
                                      width: 100.0.wp,
                                      height: 80.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(),
                                          SubmitButton(
                                            onPressed: model.gotoAddNewStore,
                                            width: 100.0,
                                            text: AppString.addNew,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  for (int j = 0;
                                      j < model.storeData.length;
                                      j++)
                                    GestureDetector(
                                      onTap: () {
                                        model.gotoViewStore(j);
                                      },
                                      child: StatusCardFourPart(
                                        title: model.storeData[j].name!,
                                        subTitle: model.storeData[j].city!,
                                        status: model.storeData[j].status!,
                                        bodyFirstKey:
                                            "Remark: ${model.storeData[j].remarks!}",
                                      ),
                                    ),
                                  endOfData()
                                ],
                              ),
                            ),
                          )
                        : manageAccount(),
          ],
        ),
      ),
    );
  }

  Widget manageAccount() {
    return Padding(
      padding: AppPaddings.requestSettingTabViewPadding,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: AppPaddings.requestSettingTabColumnPadding,
              child: SizedBox(
                width: 100.0.wp,
                height: 80.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    SubmitButton(
                      onPressed: model.gotoAddManageAccount,
                      width: 100.0,
                      text: AppString.addNew,
                    ),
                  ],
                ),
              ),
            ),
            if (model.retailsBankAccounts.isEmpty)
              Center(child: Text(AppString.noData))
            else
              for (int j = 0; j < model.retailsBankAccounts.length; j++)
                GestureDetector(
                    onTap: () {
                      model.gotoViewManageAccount(j);
                    },
                    child: StatusCardFourPart(
                      title: model.retailsBankAccounts[j].fieName!,
                      subTitle: model.retailsBankAccounts[j].updatedAt!,
                      statusChild: model.retailsBankAccounts[j].status!
                          .toCardStatusFromInt(
                              value: model
                                  .retailsBankAccounts[j].statusDescription!),
                      bodyFirstKey:
                          "${BankInfo.checkBankAccountType(model.retailsBankAccounts[j].bankAccountType!)}",
                      bodyFirstValue:
                          "Currency: ${model.retailsBankAccounts[j].currency}",
                      bodySecondKey:
                          "Acc No.: ${model.retailsBankAccounts[j].bankAccountNumber}",
                      bodySecondValue:
                          "IBAN: ${model.retailsBankAccounts[j].iban}",
                    )),
          ],
        ),
      ),
    );
  }
}
