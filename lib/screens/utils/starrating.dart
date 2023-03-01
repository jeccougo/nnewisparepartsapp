import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingsBar extends StatefulWidget {
  @override
  _RatingsBarState createState() => _RatingsBarState();
}

class _RatingsBarState extends State<RatingsBar> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RatingBar.builder(
          initialRating: _rating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 15,
          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
        ),
        SizedBox(width: 5),
        _rating == 0
            ? Text(
          'Ratings',
          style: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.normal,
            fontSize: 13,
          ),
        )
            : Text(
          '$_rating',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
