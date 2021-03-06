
import 'package:flutter/material.dart';
import 'package:my_quizz_app/question.dart';
import 'package:my_quizz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();


void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  /* List<Icon> scores = [];



  List<String> questions = [
    "Tiger is the National Animal of Bangladesh",
    "Only Software Engineers are inteligent",
    "Storms are good"
  ];

  List<bool> ans = [true, false, false]; */

  List<Icon> scores = [];

  void checkAns(bool userSelected){
    bool correct = quizBrain.getAns();
    if (quizBrain.isFinished()==true){

      Alert(
          context: context,
          type: AlertType.info,
          title: "Finished!",
          desc: "You have reached Final Questions.",


      ).show();

      quizBrain.restartQuiz();
      scores = [];
    }
    else{
      if (userSelected == correct) {
        scores.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      }
      else{
        scores.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQue();
    }


  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQue(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAns(true);


                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAns(false);
                });
              },
            ),
          ),
        ),
        Row(
          children: scores,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
