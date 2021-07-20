import 'package:flutter/material.dart';



class FaqsPage extends StatefulWidget{
  @override
  _FaqsPageState createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Frequently Asked Questions ",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: [
                  QuestionsBlock('Q.Who Invented The Game Of Basket Ball??',
                  'A.Dr. James Naismith in 1891.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q. Where Did The Game Of Basketball Originate??',
    'A.It originated in America.'),
    SizedBox(
    height: 12.0),
    QuestionsBlock('Q.What Is The Circumference And The Weight Of The Ball??',
    'A.30 inches, 20 -22 oz.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q. What Are The Measurements Of The Court??',
    'A.94 * 50 ft'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.How many quarters in a basketball game is there??',
    'A.4(four)'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What is the main objective of the game basketball??',
    'A.The main objective of basketball is for the players to make more goals and score points than their opponents by putting the round ball in a rim'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.How many players are on the court on each team for a regulation game of basketball??',
    'A.5(five)'),
    SizedBox(
    height: 12.0),
    QuestionsBlock('Q.What is the circumference of the ball?',
    'A.30 inches'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.How does the game begin?',
    'A.by jump ball'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.)How many positions are there in a basketball game?',
    'A.There are 5 positions- '
        '-Centre '
        '-Power Forward '
        '-Small Forward '
        '-Point guard '
        '-Shooting guard'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.) What is centre position?',
    'A.The center is the tallest player on each team, playing near the basket. On offense, the center tries to score on close shots and rebound. But on defense, the center tries to block opponents’ shots and rebound their misses'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What is power forward position?',
    'A.The power forward does many of the things a center does, playing near the basket while rebounding and defending taller players. But power forwards also take longer shots than centers.'),
    SizedBox(
    height: 12.0),
    QuestionsBlock('Q.What is small forward position?',
    'A.The small forward plays against small and large players. They roam all over on the court. Small forwards can score from long shots and close ones'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What is point guard?',
    'A.The point guard runs the offense and usually is the team’s best dribbler and passer. The point guard defends the opponent’s point guard and tries to steal the ball.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What is shooting guard?',
    'A.The shooting guard is usually the team’s best shooter. The shooting guard can make shots from long distance and also is a good dribbler.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.How many points is a shot worth when inside the oppositions semi-circle?',
    'A.Two points will be assigned a team if theygoal inside the three-point semi-circle and three points for goals scored from outside.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.) How many points is a layup worth?',
    'A.2( two)'),
    SizedBox(
    height: 12.0),
    QuestionsBlock('Q.What Is It Called When You Make A Shot Behind The Arc In The Nba?',
    'A.A three-point shot is the hardest shot to make in basketball.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.In A Regulation Game Of Basketball, What Is The Least Difference Of Points Needed To Win A Game?',
    'A.Only one point more than the other team is needed to win the game.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What is an alley-oop?',
    'A.The ball-handler throws the basketball near the basket to their teammate who dunks it in'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.what is a rebound?',
    'A.A “rebound” is a statistic that is given to a player who gains possession of the basketball after a missed shot. An offensive rebound comes from a player on offense while a defensive rebound comes from a player on defense.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What is one way to legally make a steal?',
    'A.One legal way to make a steal in basketball is to deflect a pass attempt.'),
    SizedBox(
    height: 12.0),
    QuestionsBlock('Q.How Many Substitutes Are Allowed?','A.Seven'),
    SizedBox(
    height: 12.0),
    QuestionsBlock('Q.When does a dead ball occur in Basketball?',
    'A.A dead ball in basketball occurs when there is a foul play or a foul play has been attempted or yet to be attempted when the referee blows the whistle'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q. What is charging foul in basketball?',
    'A.Running into a defender that has established position.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What Is It Called When You Use Both Hands At The Same Time To Dribble?',
    'A.You can only dribble the ball with one hand at the same time. Double dribbling is an infraction in basketball.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What Is It Called When A Person Takes Too Many Steps With The Ball Without Bouncing It?',
    'A.Traveling is also an infraction in basketball. It results in a turnover'),
    SizedBox(
    height: 12.0),
    QuestionsBlock('Q.In The Nba, How Long May A Defensive Player Stand In The Paint Without Guarding Anyone?',
    'A.With this rule, introduced by the NBA in 2003, the defensive players have to get out of the paint every three seconds. This three second rule is not use in European basketball'),
    SizedBox(

    height: 12.0,
    ),
    QuestionsBlock('Q.The Player That Brings The Ball Down Court And Runs The Offense Is Called?',
    'A.The guard calls all of the plays and controls the ball.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.what happens when  a player commits their first foul ?',
    'A. the opposing team is awarded two free throws and possession of the ball.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.What are they considered if a team commits more fouls then they are allowed per quarter or half?',
    'A.It takes five fouls to be fouled out in college and high school and six fouls in national basketball association '),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.At What Point During A Two-shot Free Throw May A Substitute Enter The Game?',
    'A.Between the first and second shots.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.Which team won the first NBA Championship?',
    'A.The Minneapolis Lakers won the first NBA Championship in 1950.'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.Who is the top scorer in all of the NBA?',
    'A.The top scorer in all of the NBA is Kareem Abdul-Jabbar, with 38,387 points. He is an American basketball player who played in NBA for 20 seasons'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.Who Are The All Time Greats In Basket Ball?',
    'A.Michael Jordan and Magic Johnson'),
    SizedBox(
    height: 12.0,
    ),
    QuestionsBlock('Q.Which currently active NBA player has the most points?',
    'A.LeBron James, with over 32,000 points and an average 27.2 points per game, is the highest-scoring active player in the NBA.'),
    SizedBox(
    height: 12.0,
    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class QuestionsBlock extends StatelessWidget {
  final String question, answer;
  QuestionsBlock(this.question, this.answer);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border:
        Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              answer,
              style: TextStyle(fontSize: 18.0, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}