import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Constants/constants.dart';
import 'package:intro_views_flutter/Models/page_bubble_view_model.dart';
import 'package:intro_views_flutter/Models/pager_indicator_view_model.dart';
import 'package:intro_views_flutter/UI/page_bubble.dart';

/// This class contains the UI elements associated with bottom page indicator.

class PagerIndicator extends StatelessWidget {
  PagerIndicator({this.viewModel});

  final PagerIndicatorViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    //Extracting page bubble information from page view model
    List<PageBubble> bubbles = [];

    for (var i = 0; i < viewModel.pages.length; i++) {
      final page = viewModel.pages[i];

      //calculating percent active
      var percentActive;
      if (i == viewModel.activeIndex) {
        percentActive = 1.0 - viewModel.slidePercent;
      } else if (i == viewModel.activeIndex - 1 &&
          viewModel.slideDirection == SlideDirection.leftToRight) {
        percentActive = viewModel.slidePercent;
      } else if (i == viewModel.activeIndex + 1 &&
          viewModel.slideDirection == SlideDirection.rightToLeft) {
        percentActive = viewModel.slidePercent;
      } else {
        percentActive = 0.0;
      }

      //Adding to the list
      bubbles.add(
        PageBubble(
          viewModel: PageBubbleViewModel(
            isHollow: i == viewModel.activeIndex,
            activePercent: percentActive,
            bubbleBackgroundColor: page.bubbleBackgroundColor,
          ),
        ),
      );
    }

    //UI
    return IgnorePointer(
      child: Container(
        height: 65,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: bubbles,
        ),
      ),
    ); //Column
  }
}
