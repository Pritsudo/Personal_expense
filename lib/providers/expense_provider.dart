import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_expense/models/expense_model.dart';

class Expenses with ChangeNotifier {
  List<ExpenseModel> _expenses = [];

  List<ExpenseModel> get expenses {
    return [..._expenses];
  }

  void addExpense(ExpenseModel expense) {
    _expenses.add(expense);
    print(_expenses.length);
    notifyListeners();
  }

  // void saveCards(String title, String price, String description) async {
  //     String cardId = Uuid().v1();
  //     DateTime dateTime = DateTime.now();
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     try {
  //       if (title.isNotEmpty || price.isNotEmpty) {
  //         await FirebaseFirestore.instance
  //             .collection('users')
  //             .doc(userId)
  //             .collection('Cards')
  //             .doc(cardId)
  //             .set({
  //           'cardId': cardId,
  //           'title': title,
  //           'price': price,
  //           'description':description,
  //           'SavedDate': dateTime.toIso8601String(),
  //         });

  //         responce = 'Uploaded Successfully';

  //         widget.titlecontroller.text = '';
  //         widget.descriptionController.text = '';
  //         widget.priceController.text = '';
  //       }
  //       else {
  //         responce = 'Please fill both field';
  //       }
  //     } catch (err) {
  //       responce = err.toString();
  //     }

  //     setState(() {
  //       _isLoading = false;
  //     });

  //     Navigator.of(context).pop();
  //   }
}
