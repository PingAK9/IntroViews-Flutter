import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Constants/constants.dart';
import 'package:intro_views_flutter/Models/page_button_view_model.dart';

/// Skip, Next, and Back button class

class DefaultButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  DefaultButton({this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    final TextStyle style = DefaultTextStyle.of(context).style;
    return ButtonTheme(
      height: 45,
      child: FlatButton(
        onPressed: onTap,
        child: DefaultTextStyle.merge(
          style: style,
          child: child,
        ), //Opacity
      ),
    ); //FlatButton
  }
}

class PageIndicatorButtons extends StatelessWidget {
  //Some variables
  final int activePageIndex;
  final int totalPages;
  final VoidCallback onPressedDoneButton; //Callback for Done Button
  final VoidCallback onPressedNextButton;
  final VoidCallback onPressedBackButton;
  final VoidCallback onPressedSkipButton; //Callback for Skip Button
  final SlideDirection slideDirection;
  final double slidePercent;
  final bool showSkipButton;
  final bool showNextButton;
  final bool showBackButton;

  final Widget doneText;
  final Widget skipText;
  final Widget nextText;
  final Widget backText;
  final TextStyle textStyle;

  final bool doneButtonPersist;

  Widget _getDoneORNextButton() {
    if ((activePageIndex < totalPages - 1 ||
            (activePageIndex == totalPages - 1 &&
                slideDirection == SlideDirection.leftToRight)) &&
        showNextButton) {
      return DefaultButton(
        child: nextText,
        onTap: onPressedNextButton,
      );
    } else if (activePageIndex == totalPages - 1 ||
        (activePageIndex == totalPages - 2 &&
                slideDirection == SlideDirection.rightToLeft ||
            doneButtonPersist)) {
      return DefaultButton(child: doneText, onTap: onPressedDoneButton);
    } else {
      return Container();
    }
  }

  Widget _getSkipORBackButton() {
    if (activePageIndex <= totalPages &&
        activePageIndex >= 1 &&
        showBackButton) {
      return DefaultButton(
        child: backText,
        onTap: onPressedBackButton,
      );
    } else if ((activePageIndex < totalPages - 1 ||
            (activePageIndex == totalPages - 1 &&
                slideDirection == SlideDirection.leftToRight)) &&
        showSkipButton) {
      return DefaultButton(
        child: skipText,
        onTap: onPressedSkipButton,
      );
    } else {
      return Container();
    }
  }

  //Constructor
  PageIndicatorButtons(
      {@required this.activePageIndex,
      @required this.totalPages,
      this.onPressedDoneButton,
      this.slideDirection,
      this.slidePercent,
      this.onPressedSkipButton,
      this.onPressedNextButton,
      this.onPressedBackButton,
      this.showSkipButton,
      this.skipText,
      this.nextText,
      this.doneText,
      this.textStyle,
      this.doneButtonPersist,
      this.showNextButton = true,
      this.showBackButton = true,
      this.backText});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 25.0,
      child: DefaultTextStyle(
        style: textStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: _getSkipORBackButton() //Row
                ), //Padding
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: _getDoneORNextButton() //Row
                )
          ],
        ),
      ),
    );
  }
}
