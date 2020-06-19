/*
* Crested on 3rd January 2020
* This material is not for commercial use , only for learning purposes.
* */
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main/constants.dart';
import '../components/app_bar.dart';
import 'more_screen.dart';

class FacebookHome extends StatefulWidget {
  FacebookHome({Key key}) : super(key: key);

  @override
  _FacebookHomeState createState() => _FacebookHomeState();
}

class _FacebookHomeState extends State<FacebookHome> with SingleTickerProviderStateMixin{

  static tab_selected stab = tab_selected.home;
  
  
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
    super.initState();
  }


   static final fbtabs = <Tab>[
    Tab(icon: Icon(FlevaIcons.home_outline)),
    Tab(icon: Icon(FontAwesomeIcons.users, ) ),
    Tab(icon: Icon(Icons.ondemand_video, )),
    Tab(icon: Icon(FontAwesomeIcons.flag, )),
    Tab(icon: Icon(FlevaIcons.bell_outline,)),
    Tab(icon: Icon(Icons.menu,)),
  ];

   var fbtabsscreens = <Widget>[
    FacebookScreenMore(),
    FacebookScreenMore(),
    FacebookScreenMore(),
    FacebookScreenMore(),
    FacebookScreenMore(),
    FacebookScreenMore(),
  ];

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


   @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Facebook',style: headStyle,),
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: <Widget>[
              AppBarIcon(icon: FontAwesomeIcons.search, onPress: (){
                print('Current Index: ${DefaultTabController.of(context).index}');
              }),
              AppBarIcon(icon: FontAwesomeIcons.facebookMessenger, onPress: (){

              }),
            ],
            bottom: TabBar(
               controller: _tabController,
                onTap: (int index) {
                  setState(() {
                    index == null ? index =0 : index =DefaultTabController.of(context).index;
                    print("hello $index");
                    if (index == 0) {
                      setState(() {
                        index =0 ;
                        stab = tab_selected.home;
                      });
                    }  else if(index == 1){
                      setState(() {
                        index =1;
                        stab = tab_selected.groups;

                      });
                    } else if (index == 2) {
                      stab = tab_selected.video;
                    }  else if (index == 3) {
                       stab = tab_selected.flag;
                    }  else if (index == 4) {
                       stab = tab_selected.notification;
                    }  else if (index == 5) {
                       stab = tab_selected.more;
                    }
                  });
                },
                dragStartBehavior: DragStartBehavior.start,
                indicatorColor: facebookbluecolor,
                indicatorWeight: 1.5,
                unselectedLabelColor: facebookiconcolor,
                tabs: fbtabs),
          ),
          body: TabBarView(
             controller: _tabController,
              children: fbtabsscreens,
              physics: NeverScrollableScrollPhysics(),

          ));

  }
}

enum tab_selected{
  home,
  groups,
  video,
  flag,
  notification,
  more
}