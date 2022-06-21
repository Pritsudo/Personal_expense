import 'package:flutter/material.dart';
import 'package:personal_expense/providers/expense_provider.dart';
import 'package:provider/provider.dart';
import '../widget/add_expense_card.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  static const routeName = 'cardscreen';

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void addCard(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: ExpenseCard(
                titlecontroller: _titleController,
                priceController: _priceController),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _priceController.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expenceList = Provider.of<Expenses>(context).expenses;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(223, 58, 216, 216),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          title: const Text('See Expenses'),
          centerTitle: true,
        ),
        body: Consumer<Expenses>(builder: ((context, value, child) {
          return ListView.builder(
              itemCount: expenceList.length,
              itemBuilder: (context, index) {
                return DetailCard(
                  amount: expenceList[index].price,
                  title: expenceList[index].title,
                );
              });
        })),

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       DetailCard(),
        //       DetailCard(),
        //       DetailCard(),
        //     ],
        //   ),
        // ),
        floatingActionButton: IconButton(
          onPressed: () => addCard(context),
          icon: const Icon(Icons.add_circle_sharp),
          iconSize: 60,
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final String title;
  final double amount;
  const DetailCard({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: const Card(
        child: ListTile(
          title: Text('Hello',
              style: TextStyle(
                fontSize: 18,
              )),
          trailing: Text('\₹${'20'}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
