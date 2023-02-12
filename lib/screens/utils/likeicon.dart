import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;
  int _likeCount = 0;

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount -= 1;
        _isLiked = false;
      } else {
        _likeCount += 1;
        _isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              focusColor: Colors.transparent,
              icon: (_isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
              color: (_isLiked ? Colors.red : null),
              onPressed: _toggleLike,
            ),
          ),
          // SizedBox(
          //   width: 18,
          //   child: Container(
          //     child: Text('$_likeCount'),
          //   ),
          // ),
        ],
      ),
    );
  }
}