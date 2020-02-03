import 'package:flutter/material.dart';
import 'package:ubireudo/ui/pointPage.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final String turma = 'Arquitetura de Computadores';
final String complemento = '2020.1 - S3';
final _nomeSala = TextEditingController();
final _descri = TextEditingController();

class _HomePageState extends State<HomePage> {
  var _firebaseRef = FirebaseDatabase().reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubireudo'),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AlertDialog nova = AlertDialog(
            title: Text('Nova Turma'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: _nomeSala,
                  decoration: InputDecoration(
                    labelText: 'Nome da Turma',
                  ),
                ),
                TextField(
                  controller: _descri,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  //inserir em uma nova key unica
                  _firebaseRef.child('rooms').push().set({
                    "description": _descri.text,
                    "name": _nomeSala.text,
                    "created": DateTime.now().millisecondsSinceEpoch,
                  });
                },
                child: Text(
                  'SALVAR',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return nova;
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.black26),
        itemCount: 10,
        itemBuilder: (context, index) {
          return buildListFavorite();
        },
      ),
    );
  }

  buildListFavorite() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PointPage()));
      },
      child: Container(
        child: ListTile(
          title: Text(turma),
          subtitle: Text(complemento),
        ),
      ),
    );
  }
}
