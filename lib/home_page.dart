import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newspaper/webview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('All Newspaper'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,size: 30,),
                title: Text('National'),
                backgroundColor: Color(0xFF3DAFDB),

            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.globe),
                title: Text('International'),
                backgroundColor:Color(0xFF3DAFDB)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,size: 30,),
              title: Text('Profile'),
                backgroundColor: Color(0xFF3DAFDB)

            ),
          ],

          // type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(choices.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  WebviewPage()),
              );
            },
            child: Center(
              child: SelectCard(choice: choices[index]),
            ),
          );
        }),
      ),
    );
  }
}

class Choice {
  const Choice({required this.title});
  final String title;
}

const List<Choice> choices =  <Choice>[
   Choice(title: 'Assets/prothomalo.png'),
  Choice(title: 'Assets/prothomalo.png'),
  Choice(title: 'Assets/prothomalo.png'),

];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      // child: Center(
      //   child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         Expanded(
      //             child: Icon(
      //           choice.icon,
      //           size: 50.0,
      //         )),
      //         Text(choice.title),
      //       ]),
      // ),
      // child: Container(
      //   height: 150,
      //   // width: 100,
      //   color: Colors.redAccent,
      // ),
      child: Image.asset(choice.title),
    );
  }
}
