import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;

  TranscationList(this.transcations);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transcations.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transcation Added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 400,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text(
                          '\$${transcations[index].amount}',
                        )),
                      ),
                    ),
                    title: Text(
                      transcations[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transcations[index].date),
                    ),
                  ),
                );
                //Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
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
            ),
    );
  }
}
