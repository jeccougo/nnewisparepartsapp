import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int rating;
  final double size;
  final Color color;

  StarRating({
    required this.rating,
    this.size = 10,
    this.color = Colors.yellow,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < widget.rating ? Icons.star : Icons.star_border,
          color: widget.color,
          size: widget.size,
        );
      }),
    );
  }
}
