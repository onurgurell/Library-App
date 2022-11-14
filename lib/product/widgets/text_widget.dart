import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleGenerator extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLine;
  // ignore: prefer_typing_uninitialized_variables
  final overflow;
  final TextAlign? alignment;
  const TextStyleGenerator({
    super.key,
    @required this.text,
    @required this.color,
    @required this.fontSize,
    this.fontWeight,
    this.maxLine,
    this.overflow,
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: alignment,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
