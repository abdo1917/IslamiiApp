import 'package:flutter/material.dart';
import 'Hadeeth Tab.dart';
import 'Hadeath Text.dart';

class HadeathNameWidget extends StatelessWidget {

  Hadeath hadeth;
  HadeathNameWidget(this.hadeth);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadeathText.routeName, arguments: hadeth);
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          child: Text(hadeth.title, style: Theme.of(context).textTheme.headline5,)
      ),
    );
  }
}