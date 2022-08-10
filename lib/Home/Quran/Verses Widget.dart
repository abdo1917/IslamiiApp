import 'package:flutter/material.dart';
import 'Surra Text.dart';

class VersesWidget extends StatelessWidget {

  String content;
  int index;
  VersesWidget(this.index, this.content);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        child: Text('$content {${index+1}}', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center, textDirection: TextDirection.rtl,)
    );
  }
}
