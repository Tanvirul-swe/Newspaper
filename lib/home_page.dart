import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newspaper/Service/UnityAdd.dart';
import 'package:newspaper/constant/constant.dart';
import 'package:newspaper/webview.dart';
import 'package:unity_ads_plugin/unity_ads.dart';

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
    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      listener: (state, args) => print('Init Listener: $state => $args'),
    );
        showAdds();
    _pageController = PageController();
  }
    showAdds()async{
     await UnityAds.showVideoAd(
        placementId: AdManager.interstitialVideoAdPlacementId,
        listener: (state, args) =>
            print('Interstitial Video Listener: $state => $args'),
      );
    }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }


  List <String> InternationalNewspaperUrl=[
   'https://www.chinadaily.com.cn',
    'https://www.dailymail.co.uk/home/index.html',
    'https://www.nydailynews.com',
    'https://www.ft.com',
    'https://www.theguardian.com',
    'https://www.nytimes.com',
    'https://www.telegraph.co.uk',
    'https://www.theaustralian.com.au',
    'https://www.washingtonpost.com',
    'https://timesofindia.indiatimes.com/news',
    'https://www.usatoday.com',
    'https://www.wsj.com',


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF140161),
          centerTitle: true,
          title: (_currentIndex == 0
              ? const Text("National newspaper")
              : (_currentIndex == 1
                  ? const Text('International newspaper'):_currentIndex==2?const Text('BD TV Channel')
                  : const Text('English TV Channel'))),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: const Color(0xFF140161),
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
              icon: const FaIcon(FontAwesomeIcons.home),
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
                icon: const FaIcon(FontAwesomeIcons.globe),
                inactiveColor: Colors.grey,
                activeColor: Colors.white),
            BottomNavyBarItem(
                title: const Text(
                  'TV Channel',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: const FaIcon(FontAwesomeIcons.tv),
                inactiveColor: Colors.grey,
                activeColor: Colors.white),
            BottomNavyBarItem(
                title: const Text(
                  'English TV',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: const FaIcon(FontAwesomeIcons.satelliteDish),
                inactiveColor: Colors.grey,
                activeColor: Colors.white),
          ],
          // type: BottomNavigationBarType.shifting,
        ),
        body: Stack(
          children: [


            PageView(
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
                          MaterialPageRoute(
                              builder: (context) => WebviewPage(BanglaNewspaperUrl[index])),
                        );
                      },
                      child: Center(
                        child: SelectCard(choice: choices[index]),
                      ),
                    );
                  }),
                ),
                GridView.count(
                  padding: const EdgeInsets.all(8),
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  children: List.generate(choicesinternational.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebviewPage(InternationalNewspaperUrl[index])),
                        );
                      },
                      child: Center(
                        child: International(choiceInternational: choicesinternational[index]),
                      ),
                    );
                  }),
                ),
                GridView.count(
                  padding: const EdgeInsets.all(8),
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  children: List.generate(tvchannel.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebviewPage(TvChannelUrl[index])),
                        );
                      },
                      child: Center(
                        child: TvChannelCard(choiceTvChannel: tvchannel[index]),
                      ),
                    );
                  }),
                ),
                GridView.count(
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
                              builder: (context) => WebviewPage(englishtvchannelurl[index])),
                        );
                      },
                      child: Center(
                        child: EnglishTv(englishTv: englishtvchannel[index]),
                      ),
                    );
                  }),
                ),
              ],
            ),

            Align(
              alignment: Alignment.topCenter,
              child: UnityBannerAd(
                placementId: AdManager.bannerAdPlacementId,
                listener: (state, args) {
                  print('Banner Listener: $state => $args');
                },
              ),
            ),
          ],

        ));
  }
}



class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final ChoiceNational choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(
        child: Image.asset(choice.title),
        height: 180,
        width: 180,
        color: Colors.white,
      ),
    );
  }
}
class International extends StatelessWidget {
  const International({Key? key, required this.choiceInternational}) : super(key: key);
  final ChoiceInternational choiceInternational;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(
        child: Image.asset(choiceInternational.title),
        height: 180,
        width: 180,
        color: Colors.white,
      ),
    );
  }
}
class TvChannelCard extends StatelessWidget {
  const TvChannelCard({Key? key, required this.choiceTvChannel}) : super(key: key);
  final TvChannel choiceTvChannel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(
        child: Image.asset(choiceTvChannel.title),
        height: 180,
        width: 180,
        color: Colors.white,
      ),
    );
  }
}

class EnglishTv extends StatelessWidget {
  const EnglishTv({Key? key, required this.englishTv}) : super(key: key);
  final EnglishTvChannel englishTv;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(
        child: Image.asset(englishTv.title),
        height: 180,
        width: 180,
        color: Colors.white,
      ),
    );
  }
}
