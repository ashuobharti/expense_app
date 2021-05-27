import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';

class TranscationItem extends StatefulWidget {
  const TranscationItem({
    Key key,
    @required this.transcation,
    @required this.deleteTranscation,
  }) : super(key: key);

  final Transcation transcation;
  final Function deleteTranscation;

  @override
  _TranscationItemState createState() => _TranscationItemState();
}

class _TranscationItemState extends State<TranscationItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.purple,
      Colors.lightBlue,
    ];
//no need of setState as init is called before build
    _bgColor = availableColors[Random().nextInt(4)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 50,
          child: Container(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                '\$${(widget.transcation.amount).toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transcation.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transcation.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                onPressed: () =>
                    widget.deleteTranscation(widget.transcation.id),
                textColor: Colors.red,
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTranscation(widget.transcation.id),
              ),
      ),
    );
  }
}
