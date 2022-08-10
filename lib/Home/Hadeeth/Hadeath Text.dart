import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../My Themes.dart';
import '../providers/setting_provider.dart';
import 'Hadeeth Tab.dart';

class HadeathText extends StatefulWidget {

  static const String routeName = 'Hadeath Text';

  @override
  State<HadeathText> createState() => _HadeathTextState();
}

class _HadeathTextState extends State<HadeathText> {

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<setting_providers>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Hadeath;

    return Container(

      decoration: BoxDecoration(
          color: Colors.transparent,

          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                  settingProvider.getMainBackgroung()              )
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(args.title)),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 64, horizontal: 12),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(24)
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(args.content, style: Theme.of(context).textTheme.bodyText1, textDirection: TextDirection.rtl,),
            ),
          ),
        ),
      ),
    );
  }
}