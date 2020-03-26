import 'package:flutter/material.dart';


class PageViewModel {
  /// Page BackGround Color
  final Color pageColor;

  /// color for background of progress bubbles
  ///
  /// @Default `const Color(0x88FFFFFF)`
  final Color bubbleBackgroundColor;

  /// widget for the title
  ///
  /// _typicaly a Text Widget_
  ///
  /// @Default Textstyle `color: Colors.white , fontSize: 50.0`
  final Widget title;

  /// widget for the body
  ///
  /// _typicaly a Text Widget_
  ///
  /// @Default Textstyle `color: Colors.white, fontSize: 24.0`
  final Widget body;

  /// set default TextStyle for title and body
  final TextStyle textStyle;

  /// set default TextStyle for title
  final TextStyle titleTextStyle;

  /// set default TextStyle for body
  final TextStyle bodyTextStyle;

  /// Image Widget
  ///
  /// _typicaly a Image Widget_
  final Widget mainImage;


  PageViewModel(
      {this.pageColor,
      this.bubbleBackgroundColor = const Color(0xFFFFFFFF),
      this.title = const SizedBox(),
      this.body = const SizedBox(),
      @required this.mainImage,
      this.textStyle,
      this.titleTextStyle,
      this.bodyTextStyle});

  TextStyle get mergedTitleTextStyle {
    return TextStyle(color: Colors.white, fontSize: 50.0)
        .merge(this.textStyle)
        .merge(this.titleTextStyle);
  }

  TextStyle get mergedBodyTextStyle {
    return TextStyle(color: Colors.white, fontSize: 24.0)
        .merge(this.textStyle)
        .merge(this.bodyTextStyle);
  }
}
