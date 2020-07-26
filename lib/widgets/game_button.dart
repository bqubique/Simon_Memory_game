import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';

class GameButton extends StatefulWidget {
  final Color buttonColor;
  final int buttonIndex;
  final bool selected;
  const GameButton(
      {@required this.buttonColor,
      @required this.buttonIndex,
      this.selected = false});

  @override
  _GameButtonState createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton>
    with SingleTickerProviderStateMixin {
  Stream stream;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      height: MediaQuery.of(context).size.height * 0.37,
      width: MediaQuery.of(context).size.width * 0.47,
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border:
            Border.all(width: (widget.selected) ? 10 : 0, color: Colors.white),
      ),
      child: Material(
        child: InkWell(
          onTap: () {
            setState(() {
              if (Provider.of<GameLogic>(context, listen: false)
                  .listEqualLength()) {
                Provider.of<Score>(context, listen: false).incrementScore();
              }
              Provider.of<GameLogic>(context, listen: false).currentMove++;
              Provider.of<GameLogic>(context, listen: false)
                  .addToUserList(widget.buttonIndex);
              if (Provider.of<GameLogic>(context, listen: false).gameLost) {
                Navigator.pushNamed(context, '/gameOverScreen');
                Provider.of<GameLogic>(context, listen: false).gameLost = false;
              }
            });
          },
          borderRadius:
              BorderRadius.all(Radius.circular((widget.selected) ? 10 : 20)),
          splashColor: Colors.white,
        ),
        color: widget.buttonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
