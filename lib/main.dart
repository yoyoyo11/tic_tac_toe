import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rhett\'s Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(),
    );
  }
}

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Rhett\'s Tic Tac Toe'),
      ),
      body: Game(),
    );
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Map<String, String> boxMap = {
    'A1': 'blank.png',
    'A2': 'blank.png',
    'A3': 'blank.png',
    'A4': 'blank.png',
    'A5': 'blank.png',
    'A6': 'blank.png',
    'A7': 'blank.png',
    'A8': 'blank.png',
    'A9': 'blank.png'
  };

  bool playerX = false;
  String playerTurn = 'O';
  String gameWinner = '';
  int turnCounter = 0;
  String headerText = 'Player O\'s Turn!';

  void resetGame() {
    setState(() {
      playerX = false;
      playerTurn = 'O';
      gameWinner = '';
      turnCounter = 0;
      headerText = 'Player O\'s Turn!';
      boxMap['A1'] = 'blank.png';
      boxMap['A2'] = 'blank.png';
      boxMap['A3'] = 'blank.png';
      boxMap['A4'] = 'blank.png';
      boxMap['A5'] = 'blank.png';
      boxMap['A6'] = 'blank.png';
      boxMap['A7'] = 'blank.png';
      boxMap['A8'] = 'blank.png';
      boxMap['A9'] = 'blank.png';
    });
  }

  void markBox({bool player, String boxId}) {
    String useImage;

    if (turnCounter > 8) {
      return;
    }

    if (boxMap[boxId] != 'blank.png') {
      return;
    }

    if (gameWinner != '') {
      return;
    }

    turnCounter++;
    print('turn: ' + turnCounter.toString());

    useImage = player ? 'x.jpeg' : 'o.jpeg';
    setState(() {
      boxMap[boxId] = useImage;
      checkWinner();
    });
    playerX = !player;
    playerTurn = playerX ? 'X' : 'O';

    if (gameWinner != '') {
      headerText = 'Woo hoo! $gameWinner wins!';
    } else {
      headerText = 'Player $playerTurn\'s Turn!';
    }
  }

  void checkWinner() {
    //check if A1, A2, A3 are equal OR
    if (boxMap['A1'] != 'blank.png') {
      if (boxMap['A1'] == boxMap['A2'] && boxMap['A1'] == boxMap['A3']) {
        gameWinner = playerX ? 'Player X' : 'Player O';
        print('Winner is in row 1 ' + gameWinner);
        return;
      } else if (boxMap['A1'] == boxMap['A4'] && boxMap['A1'] == boxMap['A7']) {
        gameWinner = playerX ? 'Player X' : 'Player O';
        print('Winner is in col 1 ' + gameWinner);
        return;
      } else if (boxMap['A1'] == boxMap['A5'] && boxMap['A1'] == boxMap['A9']) {
        gameWinner = playerX ? 'Player X' : 'Player O';
        print('Winner is in diagonal top left to bot right ' + gameWinner);
        return;
      }
    }

    if (boxMap['A4'] != 'blank.png') {
      if (boxMap['A4'] == boxMap['A5'] && boxMap['A4'] == boxMap['A6']) {
        gameWinner = playerX ? 'Player X' : 'Player O';
        print('Winner is in row 2 ' + gameWinner);
        return;
      }
    }

    if (boxMap['A7'] != 'blank.png') {
      if (boxMap['A7'] == boxMap['A8'] && boxMap['A7'] == boxMap['A9']) {
        gameWinner = playerX ? 'Player X' : 'Player O';
        print('Winner is in row 3 ' + gameWinner);
        return;
      }
    }

    if (boxMap['A2'] != 'blank.png') {
      if (boxMap['A2'] == boxMap['A5'] && boxMap['A2'] == boxMap['A8']) {
        gameWinner = playerX ? 'Player X' : 'Player O';
        print('Winner is in col 2 ' + gameWinner);
        return;
      }
    }

    if (boxMap['A3'] != 'blank.png') {
      if (boxMap['A3'] == boxMap['A6'] && boxMap['A3'] == boxMap['A9']) {
        gameWinner = playerX ? 'Player X' : 'Player O';
        print('Winner is in col 3 ' + gameWinner);
        return;
      } else if (boxMap['A3'] == boxMap['A5'] && boxMap['A3'] == boxMap['A7']) {
        gameWinner = playerX ? 'Player X' : 'Player O';
        print('Winner is in diag bot left to top right ' + gameWinner);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(turnCounter > 8 && gameWinner == '' ? 'Game over: Tie Game!' : headerText,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A1');
              },
              child: Image.asset('images/' + boxMap['A1'], scale: 10.0),
            ),
            Container(
              color: Colors.grey,
              height: 130.0,
              width: 2.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A2');
              },
              child: Image.asset('images/' + boxMap['A2'], scale: 10.0),
            ),
            Container(
              color: Colors.grey,
              height: 130.0,
              width: 2.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A3');
              },
              child: Image.asset('images/' + boxMap['A3'], scale: 10.0),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300.0,
              height: 2.0,
              color: Colors.grey,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A4');
              },
              child: Image.asset('images/' + boxMap['A4'], scale: 10.0),
            ),
            Container(
              color: Colors.grey,
              height: 130.0,
              width: 2.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A5');
              },
              child: Image.asset('images/' + boxMap['A5'], scale: 10.0),
            ),
            Container(
              color: Colors.grey,
              height: 130.0,
              width: 2.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A6');
              },
              child: Image.asset('images/' + boxMap['A6'], scale: 10.0),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300.0,
              height: 2.0,
              color: Colors.grey,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A7');
              },
              child: Image.asset('images/' + boxMap['A7'], scale: 10.0),
            ),
            Container(
              color: Colors.grey,
              height: 130.0,
              width: 2.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A8');
              },
              child: Image.asset('images/' + boxMap['A8'], scale: 10.0),
            ),
            Container(
              color: Colors.grey,
              height: 130.0,
              width: 2.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                markBox(player: playerX, boxId: 'A9');
              },
              child: Image.asset('images/' + boxMap['A9'], scale: 10.0),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Reset Game'),
              onPressed: () {
                resetGame();
              },
            ),
          ],
        ),
      ],
    );
  }
}
