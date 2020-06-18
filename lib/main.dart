import 'package:flutter/material.dart';
import 'package:quizzer/data.dart';

void main() => runApp(Z0());

class Z0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Z1(),
      debugShowCheckedModeBanner: false,
      title: 'quizzer',
      color: Colors.black,
    );
  }
}

class Z1 extends StatefulWidget {
  @override
  _Z1State createState() => _Z1State();
}

class _Z1State extends State<Z1> {
  List<Icon> chc = <Icon>[];

  void check(bool userAns) {
    if (Manage().quesIndex() < Manage().size()) {
      setState(() {
        if (Manage().check(userAns)) {
          Manage().addScore();
          chc.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else
          chc.add(Icon(
            Icons.close,
            color: Colors.red,
          ));

        if (Manage().quesIndex() < Manage().size() - 1) {
          Manage().goNextQues();
        } else {
          close();
        }
      });
    }
  }

  void close() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Result'),
            content: Text(
                'You are ${(Manage().sco() == 3 ? 'passed (GENIUS)' : 'failed (STUPID)')}'),
            actions: <Widget>[
              RaisedButton(
                color: Colors.grey[900],
                child: Text('Retry quiz'),
                onPressed: () {
                  setState(() {
                    Manage().restart();
                    chc.clear();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    '${Manage().getQues()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FlatButton(
                    child: Text('Yes'),
                    color: Colors.green,
                    onPressed: () {
                      check(true);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FlatButton(
                    child: Text('No'),
                    color: Colors.red,
                    onPressed: () {
                      check(false);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, i) => chc[i],
                        itemCount: chc.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
