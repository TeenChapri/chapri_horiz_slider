library chapri_horiz_slider; // this is for Future

import 'package:flutter/material.dart';

/// A Calculator.

class ChapriHorizSlider extends StatefulWidget {
  final num? sliderHeight; //background one height
  final num? sliderLength;
  final ScrollController? scrollController;
  final Color? trackbarColor;
  final num? trackbarLength;
  final Color? backgroundColor;
  final Duration? animationDuration;
  const ChapriHorizSlider(
      {required this.scrollController,
      this.sliderHeight = 5,
      this.sliderLength = 20,
      this.trackbarLength = 5,
      this.trackbarColor = Colors.blueGrey,
      this.backgroundColor = Colors.brown,
      this.animationDuration = Duration.zero,
      super.key});

  @override
  State<ChapriHorizSlider> createState() => _ChapriHorizSliderState();
}

class _ChapriHorizSliderState extends State<ChapriHorizSlider>
    with SingleTickerProviderStateMixin {
  //single Ticker is Not Required But this is for Future
  double scrollPercentage = 0;
  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (mounted) {
      setState(() {
        scrollPercentage = widget.scrollController!.position.pixels /
            widget.scrollController!.position.maxScrollExtent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.sliderLength!.toDouble(),
      height: widget.sliderHeight?.toDouble(),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius:
            BorderRadius.circular(widget.sliderHeight!.toDouble() / 2),
      ), //background slider
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: widget.animationDuration!,
            top: 0,
            bottom: 0,
            left: scrollPercentage *
                (widget.sliderLength!.toDouble() -
                    widget
                        .trackbarLength!), //scrollPercentage  * 90, // (scrollPercentage.toDouble() * widget.sliderLength!.toDouble()) /widget.sliderLength!.toDouble() ,
            child: Container(
              width: widget.trackbarLength?.toDouble(),
              height: widget.sliderHeight?.toDouble(),
              decoration: BoxDecoration(
                color: widget.trackbarColor,
                borderRadius:
                    BorderRadius.circular(widget.sliderHeight!.toDouble() / 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
