import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';
import 'Transcation_Item.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  final Function deleteTranscation;

  TranscationList(this.transcations, this.deleteTranscation);

  @override
  Widget build(BuildContext context) {
    return transcations.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constrains) {
              return Column(
                children: [
                  Text(
                    'No Transcation Added yet',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constrains.maxHeight * .6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TranscationItem(
                key: ValueKey(transcations[index].id),
                transcation: transcations[index],
                deleteTranscation: deleteTranscation,
              );
              //Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //   horizontal: 15,
              //                   vertical: 10,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$${transcations[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             transcations[index].title,
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black87,
              //                 fontSize: 16),
              //           ),
              //           Text(
              //             DateFormat.yMMMd().format(transcations[index].date),
              //             style: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // );
            },
            itemCount: transcations.length,
          );
  }
}
