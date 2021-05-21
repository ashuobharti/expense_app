import 'package:flutter/material.dart';

class NewTranscation extends StatefulWidget {
  final Function addNewTranscation;

  NewTranscation(this.addNewTranscation);

  @override
  _NewTranscationState createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  var titleController = TextEditingController();

  var amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTranscation(
      titleController.text,
      double.parse(amountController.text),
    );

    titleController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('No Date Chosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {},
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: submitData,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              child: Text(
                'Add Transcation',
              ),
            )
          ],
        ),
      ),
    );
  }
}
