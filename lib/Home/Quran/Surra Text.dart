import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../My Themes.dart';
import '../providers/setting_provider.dart';
import 'Verses Widget.dart';

class SurraText extends StatefulWidget {

  static const String routeName = 'Surra Text';

  @override
  State<SurraText> createState() => _SurraTextState();
}

class _SurraTextState extends State<SurraText> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<setting_providers>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SurraTextArgs;
    if(verses.isEmpty)
      readFile(args.index);
    return Container(

      decoration: BoxDecoration(
          color: Colors.transparent,

            image: DecorationImage(

                fit: BoxFit.fill,
                image: AssetImage(
                    settingProvider.getMainBackgroung()
                )
            )
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(args.title)),
          ),
          body: verses.isEmpty? Center(child: CircularProgressIndicator())
              : Container(
            margin: EdgeInsets.symmetric(vertical: 64, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24)
            ),
            child: ListView.separated(
                itemBuilder: (_, index){
                  return VersesWidget(index, verses[index]);
                },
            itemCount: verses.length,
            separatorBuilder: (_, index){
                return Container(
                  color: Theme.of(context).primaryColor,
                  width: double.infinity,
                  height: 1,
                );
            },
                ),
              ),
        ),
    );
  }

  void readFile(int index)async{
    String content = await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines = content.split("\n");
    verses = lines;
    print(lines);
    setState(() {});
  }
}

class SurraTextArgs {

  int index;
  String title;
  SurraTextArgs(this.index, this.title);
}
