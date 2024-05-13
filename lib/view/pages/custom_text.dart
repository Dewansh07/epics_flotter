// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppFont { fredoka, quando, poppins, roboto, chewy }

class CustomText extends StatefulWidget {
  final text,
      fontSize,
      height,
      fontWeight,
      color,
      overflow,
      textAlign,
      maxLines,
      letterSpacing,
      decoration,
      shadows,
      decorationColor,
      softWrap;
  AppFont fontName;
  CustomText(
      {this.text,
      this.letterSpacing,
      this.fontSize,
      this.height,
      this.color,
      this.fontWeight,
      this.overflow,
      this.decoration,
      this.textAlign,
      this.maxLines,
      this.shadows,
      this.decorationColor,
      this.softWrap,
      this.fontName = AppFont.fredoka,
      key})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return
        // text: widget.text,
        Text(
      widget.text,
      style: _selectFont(widget.fontName),
      softWrap: widget.softWrap,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textAlign: widget.textAlign,
      // height: widget.height,
    );
  }

  TextStyle _selectFont(AppFont font) {
    switch (font) {
      case AppFont.poppins:
        return GoogleFonts.poppins(
          letterSpacing: widget.letterSpacing,
          fontSize: double.tryParse("${widget.fontSize}"),
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.color,
          decoration: widget.decoration,
          shadows: widget.shadows,
          decorationColor: widget.decorationColor,
        );
      case AppFont.quando:
        return GoogleFonts.quando(
          letterSpacing: widget.letterSpacing,
          fontSize: double.tryParse("${widget.fontSize}"),
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.color,
          decoration: widget.decoration,
          shadows: widget.shadows,
          decorationColor: widget.decorationColor,
        );

      case AppFont.roboto:
        return GoogleFonts.roboto(
          letterSpacing: widget.letterSpacing,
          fontSize: double.tryParse("${widget.fontSize}"),
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.color,
          decoration: widget.decoration,
          shadows: widget.shadows,
          decorationColor: widget.decorationColor,
        );

      case AppFont.chewy:
        return GoogleFonts.chewy(
          letterSpacing: widget.letterSpacing,
          fontSize: double.tryParse("${widget.fontSize}"),
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.color,
          decoration: widget.decoration,
          shadows: widget.shadows,
          decorationColor: widget.decorationColor,
        );

      default:
        return GoogleFonts.fredoka(
          letterSpacing: widget.letterSpacing,
          fontSize: double.tryParse("${widget.fontSize}"),
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.color,
          decoration: widget.decoration,
          shadows: widget.shadows,
          decorationColor: widget.decorationColor,
        );
    }
  }
}
