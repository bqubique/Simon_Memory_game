import 'package:flutter/material.dart';
import 'package:simon_memory_game/widgets/game_button.dart';

class GameScreen extends StatelessWidget {
  final int currentScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Column(
            children: <Widget>[
              Text(
                'Score: ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  currentScore.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GameButton(
                    buttonColor: Colors.red,
                  ),
                  GameButton(
                    buttonColor: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GameButton(
                    buttonColor: Colors.green,
                  ),
                  GameButton(
                    buttonColor: Colors.yellow,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
