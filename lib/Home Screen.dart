import 'package:flutter/material.dart';
import 'package:islam/Home/Settings/Settings%20Tab.dart';
import 'package:provider/provider.dart';

import 'Home/Hadeeth/Hadeeth Tab.dart';
import 'Home/Quran/Quran Tab.dart';
import 'Home/Radio/RadionTab.dart';
import 'Home/Sebha/SebhaTab.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Home/providers/setting_provider.dart';
import 'My Themes.dart';


class HomeScreen extends StatefulWidget {

  static const routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<setting_providers>(context);

    return Container(
      decoration: BoxDecoration(
          color: MyThemes.primaryColor,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            settingProvider.getMainBackgroung()
          )
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(child:
          Text(
            AppLocalizations.of(context)!.app_title,
          )),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/quran.png')), label: AppLocalizations.of(context)!.quran_title),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/hadeeth.png')), label:AppLocalizations.of(context)!.hadeth_title),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/sebha.png')), label: AppLocalizations.of(context)!.sebha_title),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/radio.png')), label: AppLocalizations.of(context)!.radio_title,),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings_title,)
            ],
            selectedItemColor: Colors.black,
          ),
        ),
      ),
    );
  }

  List<Widget> tabs = [QuranTab(), HadeethTab(), SebhaTab(), RadioTab(),SettingsTab() ];
}
