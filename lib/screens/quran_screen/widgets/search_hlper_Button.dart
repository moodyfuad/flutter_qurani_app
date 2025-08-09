import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHlperButton extends StatefulWidget {
  const SearchHlperButton({super.key, this.onTap});
  final Function? onTap;

  @override
  _SearchHlperButtonState createState() => _SearchHlperButtonState();
}

class _SearchHlperButtonState extends State<SearchHlperButton> {
  bool enabled = false;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: enabled ? Colors.blueGrey : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50),
      ),
      disabledColor: Colors.blueGrey,
      onPressed: () {
        setState(() {
          enabled = !enabled;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (enabled)
            Icon(
              Icons.check_circle_outline_outlined,
              size: 20,
              applyTextScaling: true,
            ),
          Text('سورة', style: GoogleFonts.amiri(fontSize: 20)),
        ],
      ),
    );
  }
}
