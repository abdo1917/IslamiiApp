import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';
import 'Language Bottom Sheet.dart';
import 'Theme Bottom Sheet.dart';

class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<setting_providers>(context);

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language_title, style: Theme.of(context).textTheme.bodyText1,),
          SizedBox(height: 4,),
          InkWell(
            onTap: (){
              showLanguageButtomSheet();
            },
            child: Container(

              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor, width: 1,),
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              padding: EdgeInsets.all(8),
              child: Text(settingProvider.IsEn()?AppLocalizations.of(context)!.english_title:AppLocalizations.of(context)!.arabic_title, style: Theme.of(context).textTheme.headline5,),
            ),
          ),
          SizedBox(height: 16,),
          Text(AppLocalizations.of(context)!.theme_title, style: Theme.of(context).textTheme.bodyText1,),
          SizedBox(height: 4,),
          InkWell(
            onTap: showThemeButtomSheet,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor, width: 1,),
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              padding: EdgeInsets.all(8),
              child: Text(settingProvider.IsDark()?AppLocalizations.of(context)!.dark_theme:AppLocalizations.of(context)!.light_theme, style: Theme.of(context).textTheme.headline5,),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageButtomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return Language_Bottom_Sheet();
    });
  }

  void showThemeButtomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return Theme_Bottom_Sheet();
    });
  }
}
