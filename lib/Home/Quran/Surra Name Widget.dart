import 'package:flutter/material.dart';
import 'Surra Text.dart';

class SurranNameWidget extends StatelessWidget {

  String title;
  int index;
  SurranNameWidget(this.index,  this.title);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, SurraText.routeName, arguments: SurraTextArgs(index, title)),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          child: Text(title, style: Theme.of(context).textTheme.headline5,)
      ),
    );
  }
}
