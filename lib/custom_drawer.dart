import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newspaper/international_live_tv.dart';
import 'package:newspaper/live_tv.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('Assets/newspaper.png'),
                    fit: BoxFit.cover),
              ),
              child: null,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BDLiveTV()),
                );
              },
              leading: Image.asset(
                'Assets/InternationalTvChannel/live.gif',
                width: 25,
                height: 25,
              ),
              title: const Text('BD Live TV'),
            ),
            ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InternationalLiveTv()),
                );
              },
              leading: Image.asset(
                'Assets/InternationalTvChannel/live.gif',
                width: 25,
                height: 25,
              ),
              title: const Text('International Live TV'),
            ),
            ListTile(
              leading: Image.asset(
                'Assets/newspaper.png',
                width: 25,
                height: 25,
              ),
              title: const Text('Online Newspaper'),
            ),
            const ListTile(
              leading: FaIcon(FontAwesomeIcons.shareAltSquare),
              title: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}
