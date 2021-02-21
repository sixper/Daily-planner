import 'package:flutter/material.dart';


class NotepadApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Notepad',
      theme:  ThemeData(
        primarySwatch: Colors.pink,
      ),
      home:  NotepadListScreen(),
    );
  }
}

class NotepadListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new NotepadListState();
}

class NotepadListState extends State<NotepadListScreen> {

  final List<NotepadListItem> _notes = <NotepadListItem>[];
  final TextEditingController _titleTextController =  TextEditingController();
  final TextEditingController _noteTextController =  TextEditingController();

  void _handlePressed(String title, String body) {

    _titleTextController.clear();
    _noteTextController.clear();
    NotepadListItem item =  NotepadListItem(title: title, body: body);
    setState(() {
      _notes.add(item);
    });
    Navigator.of(context).pop();
  }

  void _pushNewNote() {
    Navigator.of(context).push(
         MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar:  AppBar(
              backgroundColor: Colors.deepPurple,
              title:  Text('New Note'),
            ),
            body:  Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                 Container(
                  margin: const EdgeInsets.all(16.0),
                  child:  TextField(
                      controller: _titleTextController,
                      decoration:  InputDecoration.collapsed(
                        hintText: 'Title',
                        hintStyle:  TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF737171)
                        ),
                      )
                  ),
                ),
                 Container(
                  margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child:  TextField(
                      controller: _noteTextController,
                      decoration:  InputDecoration.collapsed(
                        hintText: 'Note',
                        hintStyle:  TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF737171)
                        ),
                      )
                  ),
                )
              ],
            ),
            floatingActionButton:  FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () => _handlePressed(_titleTextController.text, _noteTextController.text),
              child:  Icon(Icons.check),
            ),
          );
        })
    );
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.deepPurple,
          title:  Text('Notepad')),
      body:  Column(
        children: <Widget>[
           Flexible(
              child:  ListView.builder(
                itemBuilder: (_, int index) => _notes[index],
                itemCount: _notes.length,
              ))
        ],
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: _pushNewNote,
        child:  Icon(Icons.add),
      ),
    );
  }
}

class NotepadListItem extends StatefulWidget {

  NotepadListItem({this.title, this.body});
  final String title;
  final String body;

  @override
  _NotepadListItemState createState() => _NotepadListItemState();
}

class _NotepadListItemState extends State<NotepadListItem> {



  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.all(5.0),
        child:  Card(
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.all(16.0),
                      child:  Text(this.widget.title,
                          style:  TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                          )
                      )
                  ),
                  Expanded(
                    child: Container(

                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){



                    },
                    style: ButtonStyle(

                    ),
                    child: Text("Delete"),
                  )

                ],
              ),
               Container(
                  margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child:  Text(this.widget.body,
                      style:  TextStyle(
                          fontSize: 14.0
                      )
                  )
              )
            ],
          ),
        )
    );
  }
}