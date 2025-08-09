import 'package:flutter/material.dart';
import 'package:qurani_app/shared/constants/asset_const.dart';

class PageNumberWidget extends StatelessWidget {
  final int pageNumber;

const PageNumberWidget(this.pageNumber,{ super.key });

  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(height: 35, child: Image.asset(AssetConst.corner_frame_image)),
        Text(pageNumber.toString()),
      ],
    );
  }
}