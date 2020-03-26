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
                      .withAlpha(100 + (100 * viewModel.activePercent).round()),
            ), //BoxDecoration
          ), //Padding
        ), //Center
      );

  }
}
