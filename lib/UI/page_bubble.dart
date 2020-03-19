import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_bubble_view_model.dart';

/// This class contains the UI for page bubble.
class PageBubble extends StatelessWidget {
  //view model
  final PageBubbleViewModel viewModel;

  //Constructor
  PageBubble({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    if (viewModel.iconAssetPath == null && viewModel.bubbleInner == null) {
      return Container(
        width: 6 + lerpDouble(5, 20, viewModel.activePercent),
        height: 20.0,
        child: Center(
          child: Container(
            width: lerpDouble(5, 20, viewModel.activePercent),
            //This method return in between values according to active percent.
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //Alpha is used to create fade effect for background color
              color: viewModel.isHollow
                  ? viewModel.bubbleBackgroundColor
                  : viewModel.bubbleBackgroundColor
                      .withAlpha((0x88 * viewModel.activePercent).round()),
            ), //BoxDecoration
          ), //Padding
        ), //Center
      );
    } else {
      return Container(
        width: 55.0,
        height: 65.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: lerpDouble(20.0, 45.0, viewModel.activePercent),
              //This method return in between values according to active percent.
              height: lerpDouble(20.0, 45.0, viewModel.activePercent),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //Alpha is used to create fade effect for background color
                color: viewModel.isHollow
                    ? viewModel.bubbleBackgroundColor
                        .withAlpha((0x88 * viewModel.activePercent).round())
                    : viewModel.bubbleBackgroundColor,
                border: Border.all(
                  color: viewModel.isHollow
                      ? viewModel.bubbleBackgroundColor.withAlpha(
                          (0x88 * (1 - viewModel.activePercent)).round())
                      : Colors.transparent,
                  width: 3.0,
                ), //Border
              ),
              //BoxDecoration
              child: Opacity(
                opacity: viewModel.activePercent,
                child: (viewModel.iconAssetPath != null &&
                        viewModel.iconAssetPath != "")
                    // ignore: conflicting_dart_import
                    ? Image.asset(
                        viewModel.iconAssetPath,
                        color: viewModel.iconColor,
                      )
                    : viewModel.bubbleInner != null
                        ? Transform.scale(
                            scale: viewModel.activePercent.clamp(0.5, 1.0),
                            child: viewModel.bubbleInner,
                          )
                        : Container(),
              ), //opacity
            ), //Container
          ), //Padding
        ), //Center
      );
    }
  }
}
