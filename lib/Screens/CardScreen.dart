import 'package:flutter/material.dart';
import '../widget/ExpenseCard.dart';

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
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              DetailCard(),
              DetailCard(),
              DetailCard(),
            ],
          ),
        ),
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
  const DetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Card(
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
