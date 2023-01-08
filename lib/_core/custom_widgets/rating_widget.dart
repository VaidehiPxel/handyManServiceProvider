import 'package:flutter/material.dart';

class RatingsWidget extends StatelessWidget {
  final double value;
  final Icon filledStar;
  final Icon unfilledStar;
  final Icon halffilledStar;
  const RatingsWidget({
    Key? key,
    this.value = 0,
    required this.filledStar,
    required this.halffilledStar,
    required this.unfilledStar,
  })  : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(5, (index) {
        return buildStar(context, index);
      }),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= value) {
      icon = unfilledStar;
    } else if (index == value - (0.5) && index < value) {
      // debugPrint((index > value - (0.5)).toString());
      // debugPrint((index < value).toString());
      icon = halffilledStar;
    } else {
      icon = filledStar;
    }

    return icon;
  }
}

typedef RatingChangeCallback = void Function(double rating);

class RatingsWidgetWithRating extends StatelessWidget {
  final double value;
  final Icon filledStar;
  final Icon unfilledStar;
  final Icon halffilledStar;
  final RatingChangeCallback onRatingChanged;
  const RatingsWidgetWithRating(
      {Key? key,
        this.value = 0,
        required this.filledStar,
        required this.halffilledStar,
        required this.unfilledStar,
        required this.onRatingChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //debugPrint(value.toString());
    return Wrap(
      children: List.generate(5, (index) {
        return buildStar(context, index);
      }),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= value) {
      icon = unfilledStar;
    } else if (index > value - (0.5) && index < value) {
      icon = halffilledStar;
    } else {
      icon = filledStar;
    }

    return GestureDetector(
      onTap: () {
 onRatingChanged(index + 1.0);
      },
      onHorizontalDragUpdate: (dragDetails) {
        RenderBox box = context.findRenderObject() as RenderBox;
        var pos = box.globalToLocal(dragDetails.globalPosition);
        var i = pos.dx / 25;
        var newRating = i;
        if (newRating > 5) {
          newRating = 5.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
 onRatingChanged(newRating);
      },
      child: icon,
    );
  }
}