import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/services/navigation/navigationService.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/locator.dart';
import 'app/router.dart';
import 'const/app_colors.dart';

late SharedPreferences prefs;
var navKey = locator<NavigationService>().navigatorKey;

void mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BINGO',
      navigatorKey: navKey,
      theme: ThemeData(
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.mainCardThemeRadius,
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            focusColor: AppColors.navFavColor,
            backgroundColor: AppColors.navFavColor,
          ),
          errorColor: AppColors.errorText,
          primarySwatch: AppColors.primarySwatch,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: AppColors.primarySwatch,
            accentColor: AppColors.accentColor,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: AppColors.backgroundSecondary,
          appBarTheme: const AppBarTheme(
            color: AppColors.accentColor,
            titleTextStyle: AppTextStyles.appBarTitle,
            elevation: 0.5,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: AppColors.appBarText,
            ),
          ),
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.mainDialogThemeRadius,
            ),
          ),
          fontFamily: "Poppins"),
      initialRoute: Routes.startupView,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
