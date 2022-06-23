import 'package:flutter/material.dart';
import 'package:personal_expense/models/expense_model.dart';
import 'package:personal_expense/providers/expense_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'TextInputField.dart';

class ExpenseCard extends StatefulWidget {
  const ExpenseCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpenseCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<ExpenseCard> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Expenses>(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 500,
        child: Column(
          children: [
            TextInputField(title: 'Title', controller: _titleController),
            TextInputField(
              title: 'Price',
              controller: _priceController,
              isNumber: true,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(223, 58, 216, 216)),
                onPressed: () {
                  final expense = ExpenseModel(
                      title: _titleController.text,
                      price: double.parse(_priceController.text),
                      id: uuid.v1());

                  provider.addExpense(expense);
                  FocusNode().unfocus();
                  Navigator.pop(context);
                },
                child: const Text('Save'))
          ],
        ));
  }
}
