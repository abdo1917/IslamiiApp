import 'package:flutter/material.dart';
import 'package:islam/My%20Themes.dart';
import 'package:provider/provider.dart';

import '../providers/setting_provider.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  List<String> tashbeh = [
    'سبحان لله',
    'الحمد لله',
    'الله اكبر',
    'اشهد ان لا اله الا الله محمد رسول الله'
  ];
  String txt = 'سبحان لله';
  double angl = 0;

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<setting_providers>(context);

    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: size.height * .4,
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(settingProvider.getSebhaHead()),
                  left: size.width * .48,
                ),
                Positioned(
                  child: InkWell(
                      onTap: onclick,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Transform.rotate(angle: angl,
                          child: Image.asset(settingProvider.getSebhaBody()))),
                  left: size.width * .21,
                  right: size.width * .21,
                  top: 70,
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'عدد التسبيحات',
              style: TextStyle(fontSize: 32).copyWith(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyThemes.primaryColor,
            ),
            alignment: Alignment.center,
            child: Text(
              '$count',
              style: TextStyle(fontSize: 32),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              txt,
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }

  void onclick() {
    count++;
    setState(() {});
    angl++;

    if (count <= 32 && count >= 0) {
      txt = tashbeh[0];
    } else if (count <= 65 && count >= 33) {
      txt = tashbeh[1];
    } else if (count <= 98 && count >= 66) {
      txt = tashbeh[2];
    } else if (count == 99) {
      txt = tashbeh[3];
    } else if (count == 100) {
      count = 0;
    }
  }
}
