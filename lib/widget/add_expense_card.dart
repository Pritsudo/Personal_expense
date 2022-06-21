import 'package:flutter/material.dart';
import 'package:personal_expense/models/expense_model.dart';
import 'package:personal_expense/providers/expense_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'TextInputField.dart';

class ExpenseCard extends StatefulWidget {
  final TextEditingController titlecontroller;
  final TextEditingController priceController;

  const ExpenseCard({
    Key? key,
    required this.titlecontroller,
    required this.priceController,
  }) : super(key: key);

  @override
  State<ExpenseCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<ExpenseCard> {
  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 500,
        child: Column(
          children: [
            TextInputField(title: 'Title', controller: widget.titlecontroller),
            TextInputField(
              title: 'Price',
              controller: widget.priceController,
              isNumber: true,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(223, 58, 216, 216)),
                onPressed: () {
                  final expense = ExpenseModel(
                      title: widget.titlecontroller.text,
                      price: double.parse(widget.priceController.text),
                      id: uuid.v1());

                  Expenses().addExpense(expense);
                  Navigator.pop(context);
                },
                child: const Text('Save'))
          ],
        ));
  }
}
