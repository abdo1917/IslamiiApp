import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Hadeath Name Widget.dart';
import 'Hadeath Text.dart';

class HadeethTab extends StatefulWidget {

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeath> hadeathList = [];

  @override
  Widget build(BuildContext context) {
    if(hadeathList.isEmpty)
      readHadeathFile();
    return hadeathList.isEmpty? Center(child: CircularProgressIndicator()):
    ListView.separated(
        itemBuilder: (_, index){
      return HadeathNameWidget(hadeathList[index]);
    },
      itemCount: hadeathList.length,
      separatorBuilder: (_, index){
        return Container(
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          height: 1,
        );
      },
    );
  }

  void readHadeathFile()async{
    String filecontent = await rootBundle.loadString('assets/files/ahadeath.txt');
    List<Hadeath> ahadeathOfFile = [];
    List<String> allHadeath = filecontent.trim().split("#");
    for(int i = 0; i < allHadeath.length; i ++){
      List<String> hadeathLines = allHadeath[i].trim().split('\n');
      String title = hadeathLines[0];
      if(title.isEmpty)continue;
      hadeathLines.remove(0);
      String content = hadeathLines.join('\n');
      Hadeath h = Hadeath(title, content);
      ahadeathOfFile.add(h);
    }
    hadeathList  = ahadeathOfFile;
    setState(() {});
  }
}

class Hadeath{
  String title;
  String content;
  Hadeath(this.title, this.content);
}