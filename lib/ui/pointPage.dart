import 'package:flutter/material.dart';
import 'package:ubireudo/ui/homePage.dart';


class PointPage extends StatefulWidget {
  @override
  _PointPage createState() => _PointPage();
}

class _PointPage extends State<PointPage> {
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Pontos"),
          centerTitle: true,
          backgroundColor: Colors.purple[900],
          leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.link),
              onPressed: () {},
            )
          ],
        ),
        body: GridView.count(
          crossAxisCount: 4,
          scrollDirection: Axis.vertical,
          children: List.generate(100, (index) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 3.0),
                 ),
              padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            );
          }),  
        ),
      );
  }
}