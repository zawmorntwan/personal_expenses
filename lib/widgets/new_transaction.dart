import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';
import 'package:flutter_complete_guide/widgets/adaptive_text_button.dart';
import 'package:intl/intl.dart';

class NewTranscation extends StatefulWidget {
  final Function addTx;
  NewTranscation({Key? key, required this.addTx}) : super(key: key);

  @override
  State<NewTranscation> createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    setState(() {
      _titleController.text = '';
      _amountController.text = '';
      _selectedDate = null;
    });

    // Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount'),
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   amountInput = val;
                // },
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date chosen!'
                          : 'Picked date : ${DateFormat.yMMMMd().format(_selectedDate!)}',
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    AdaptiveTextButton(
                      text: 'Choose Date',
                      handler: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
