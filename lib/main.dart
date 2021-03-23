import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State {
  int _counter = 0;
  String _date = '';

  void _add() {
    setState(() {
      _counter++;
    });
  }

  void _substract() {
    setState(() {
      _counter--;
    });
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2025));
    if (picked != null)
      setState(() {
        _date = picked.toString();
      });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Icon Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('value: ${_counter}'),
              new IconButton(icon: new Icon(Icons.add), onPressed: _add),
              new IconButton(
                  icon: new Icon(Icons.remove), onPressed: _substract),
              new Text('Date Selected: ${_date}'),
              new RaisedButton(
                  onPressed: _selectDate, child: new Text('Select Date')),
            ],
          ),
        ),
      ),
    );
  }
}
