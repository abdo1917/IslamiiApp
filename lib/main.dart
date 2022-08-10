import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home Screen.dart';
import 'Home/Hadeeth/Hadeath Text.dart';
import 'Home/Quran/Surra Text.dart';
import 'Home/providers/setting_provider.dart';
import 'My Themes.dart';

main() => runApp(ChangeNotifierProvider<setting_providers>(
    create: (buildcontext){return setting_providers();},
    child: MyApp()));
late setting_providers settingProvider;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     settingProvider = Provider.of<setting_providers>(context);
     getSharedValue();
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.current_language),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SurraText.routeName: (_) => SurraText(),
        HadeathText.routeName: (_) => HadeathText()
      },
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: settingProvider.current_Theme,
      debugShowCheckedModeBanner: false,
    );
  }
  void getSharedValue ()async{
    final pref = await SharedPreferences.getInstance();
    settingProvider.changeLanguage(pref.getString('lang')?? 'ar');

    if(pref.getString('them')=='light'){
      settingProvider.changeTheme(ThemeMode.light);
    } else if(pref.getString('them')=='dark'){
      settingProvider.changeTheme(ThemeMode.dark);
    }
  }

}
