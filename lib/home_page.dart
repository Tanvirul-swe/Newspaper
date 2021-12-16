import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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

  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF140161),
        centerTitle: true,
        title: (_currentIndex == 0
      ? const Text("National newspaper")
            : (_currentIndex == 1 ? const Text('International newspaper') : const Text('Online newspaper'))),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xFF140161),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text(
              'National',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.home,
            ),
            inactiveColor: Colors.grey,
            activeColor: Colors.white,
          ),
          BottomNavyBarItem(
              title: const Text(
                'International',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon:
                const FaIcon(FontAwesomeIcons.globe),
              inactiveColor: Colors.grey,
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: const Text(
                'Online',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(Icons.book_online_outlined),
              inactiveColor: Colors.grey,
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: const Text(
                'Favorite',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(Icons.favorite_outline_rounded),
              inactiveColor: Colors.grey,
              activeColor: Colors.white),
        ],
          // type: BottomNavigationBarType.shifting,


      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: [
          GridView.count(
            padding: const EdgeInsets.all(8),
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            children: List.generate(choices.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  WebviewPage('prothom allo')),
                  );
                },
                child: Center(
                  child: SelectCard(choice: choices[index]),
                ),
              );
            }),
          ),
          Container(),
          Container(),
          Container(
            child: Text(papername),
          ),
        ],
      )
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
