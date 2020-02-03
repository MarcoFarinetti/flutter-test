import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  const Event({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Nuovo evento"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(30.0),
        child: new Form(
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                  keyboardType: TextInputType.text,
                  // Use email input type for emails.
                  decoration:
                      new InputDecoration(labelText: 'Il nome del tuo evento')),
              new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      hintText: 'Via del campo 7', labelText: 'Indirizzo')),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Crea',
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: () => null,
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(top: 50.0, left: 100.0, right: 100.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
