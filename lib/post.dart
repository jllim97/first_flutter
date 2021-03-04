import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String title;
  final String description;
  final String location;
  final String views;

  Post(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.location,
      @required this.views})
      : super(key: key);
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Container _buildTitle(String title, String location, String views) {
      return Container(
          padding: const EdgeInsets.all(32),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ))),
                  Text(location,
                      style: TextStyle(
                        color: Colors.grey[500],
                      )),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text(views)
                ],
              ))
            ],
          ));
    }

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: color,
                  )))
        ],
      );
    }

    Container _buildDescription(String description) {
      return Container(
          padding: const EdgeInsets.all(32),
          child: Text(
            description,
            softWrap: true,
          ));
    }

    return Container(
        child: (Column(
      children: [
        _buildTitle(widget.title, widget.location, widget.views),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonColumn(color, Icons.call, 'CALL'),
            _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
            _buildButtonColumn(color, Icons.share, 'SHARE'),
          ],
        ),
        _buildDescription(widget.description)
      ],
    )));
  }
}
