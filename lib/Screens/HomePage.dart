import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName='homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(223, 58, 216, 216),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Personal Expensis',
            style: TextStyle(fontSize: 30),
          ),
        ),
        drawer: const Drawer(),
        body: Container(
          margin: const EdgeInsets.only(
            left: 19,
            top: 60,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCards(),
                    CategoryCards(),
                    CategoryCards(),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Add New Card',
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_sharp),
                iconSize: 40,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq), label: 'Graph'),
          ],
          // currentIndex: ,
        ),
      ),
    );
  }
}

class CategoryCards extends StatelessWidget {
  const CategoryCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).pushNamed('cardscreen'),
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 15,),
        margin:const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(160, 58, 216, 216),
        ),
        height: 400,
        width: 240,
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1655634338062-fb8c2297a05e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60'),
            ),
            const SizedBox(
              height: 70,
            ),
            const Text('Eductaion',
                style: TextStyle(fontSize: 28)),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
