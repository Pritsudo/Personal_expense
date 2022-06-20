import 'package:flutter/material.dart';

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
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(223, 58, 216, 216)),
                onPressed: () {},
                child:const Text('Save'))
          ],
        ));
  }
}
