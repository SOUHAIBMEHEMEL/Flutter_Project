import 'package:flutter/material.dart';
import 'card.dart';
class HomeFeed extends StatelessWidget {
  
  HomeFeed();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Headline',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 150.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => Card( 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 8.0,
                margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                child: Container(
                  width: 200,
                  height: 150,
                  child: Text('A card that can be tapped'),
              ),
                  ),
            ),
          ),
          Text(
            'Demo Headline 2',
            style: TextStyle(fontSize: 18),
          ),
          
          CardsDemo(),
          CardsDemo(),
          CardsDemo(),
          CardsDemo(),
          CardsDemo(),
        ],
      ),
    ),
    );
  }
}
