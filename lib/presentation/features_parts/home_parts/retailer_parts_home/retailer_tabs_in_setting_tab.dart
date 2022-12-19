part of '../../../ui/home_screen/home_screen_view.dart';

class RetailerTabsInSettingTab extends StatelessWidget {
  final HomeScreenViewModel model;
  const RetailerTabsInSettingTab(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SubmitButton(
            //   active: model.settingTabIndex == 0 ? true : false,
            //   onPressed: () {
            //     model.changeSettingTab(0);
            //   },
            //   width: 114.0,
            //   text: AppString.users,
            // ),
            // SubmitButton(
            //   active: model.settingTabIndex == 1 ? true : false,
            //   onPressed: () {
            //     model.changeSettingTab(1);
            //   },
            //   width: 114.0,
            //   text: AppString.roles,
            // ),
            SubmitButton(
              active: model.settingTabTitle == HomePageSettingTabs.stores
                  ? true
                  : false,
              onPressed: () {
                model.changeSettingTab(HomePageSettingTabs.stores);
              },
              width: 114.0,
              text: AppString.stores,
            ),
            SubmitButton(
              active:
                  model.settingTabTitle == HomePageSettingTabs.manageAccounts
                      ? true
                      : false,
              onPressed: () {
                model.changeSettingTab(HomePageSettingTabs.manageAccounts);
              },
              width: 114.0,
              text: AppString.manageAccount,
            ),
            // SubmitButton(
            //   active: model.settingTabIndex == 4 ? true : false,
            //   onPressed: () {
            //     model.changeSettingTab(4);
            //   },
            //   width: 114.0,
            //   text: AppString.companyProfile,
            // ),
          ],
        ),
      ),
    );
  }
}
