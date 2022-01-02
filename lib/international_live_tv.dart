import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newspaper/constant/constant.dart';
import 'package:newspaper/home_page.dart';
import 'package:newspaper/webview.dart';

class InternationalLiveTv extends StatefulWidget {
  const InternationalLiveTv({Key? key}) : super(key: key);

  @override
  _InternationalLiveTvState createState() => _InternationalLiveTvState();
}

class _InternationalLiveTvState extends State<InternationalLiveTv> {

  CollectionReference users = FirebaseFirestore.instance.collection('InternationalLiveTv');
  List<String> _internationalLiveTv=[
    'alzazeera',
    'bbc',
    'alarabiya',
    'cnn',
    'erunews',
    'foxnews',
    'msnbc',
    'ndtv',
    'news',
    'skynews',
    'abcnews',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF140161),
        title: const Text('International Live Tv'),
        actions: [
          Image.asset('Assets/InternationalTvChannel/live.gif',width: 30,),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc('url').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            return  GridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              children: List.generate(englishtvchannel.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebviewPage(data[_internationalLiveTv[index]].toString())),
                    );
                  },
                  child: Center(
                    child: EnglishTv(englishTv: englishtvchannel[index]),
                    // child: Text(data[_channelname[index]].toString()),
                  ),
                );
              }),
            );
          }

          return const Center(child:  CircularProgressIndicator(color:  Color(0xFF140161),));
        },
      ),
    );
  }
}
