import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isp_app/src/configs/appColors.dart';

class KText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? wordSpacing;

  final TextDirection? textDirection;
  final TextDecoration? decoration;

  KText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.lato(
        decoration: decoration,
        fontSize: fontSize != null ? fontSize : 14,
        // fontFamily: fontFamily != null ? fontFamily : fontFamily,
        fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
        color: color != null ? color : black,
        wordSpacing: wordSpacing,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
      overflow: TextOverflow.ellipsis,
    );
  }
}
