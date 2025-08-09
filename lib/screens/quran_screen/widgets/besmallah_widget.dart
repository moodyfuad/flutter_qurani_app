import 'package:flutter/cupertino.dart';

class BesmallahWidget extends StatelessWidget {
  final double fontSize;

  const BesmallahWidget({Key? key, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      "ﱁ ﱂ ﱃ ﱄ",
      textAlign: TextAlign.center,
      
      style: TextStyle(fontFamily: 'QCF_P001', fontSize: fontSize),
    );
  }
}
