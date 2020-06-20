import 'package:flutter/material.dart';
import 'horizontal_list.dart';

class HomeFeed extends StatelessWidget {
  
  HomeFeed();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  SingleChildScrollView(
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
          HorizontalList(),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
          Card(
            child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
          ),
        ],
      ),
    ),
    );
  }
}
