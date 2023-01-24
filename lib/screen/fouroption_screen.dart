import 'package:flutter/material.dart';
import 'package:tyroquiz/downloaderclass/downloaderclass.dart';
import 'package:tyroquiz/question/question4option.dart';
import 'package:tyroquiz/widget/color.dart';
import 'package:tyroquiz/widget/mainbutton.dart';
import 'package:tyroquiz/widget/maintext.dart';


class FourOptionScreen extends StatefulWidget {
  const FourOptionScreen({Key? key}) : super(key: key);

  @override
  State<FourOptionScreen> createState() => _FourOptionScreenState();
}

class _FourOptionScreenState extends State<FourOptionScreen> {
  String correctquestiontext = "Press any button to start the quiz";
  String opta = "A";
  String optb = "B";
  String optc = "C";
  String optd = "D";
  int questionno = -1;
  int correctanswer = 0;
  bool isTextOver = false;

  List<Question4Option> questions = Question4Array.questions;
  Question4Option? currentquestion;
  List<Widget> scores = [];
  List<String> answeroptions = [
    "Varanasi",
    "Lucknow",
    "Charaigaon",
    "Hukulganj"
  ];

  int _result = 0;

  void setQuestion(int b, BuildContext context)async{
    if(isTextOver) return;
    if(questionno==-1){
      Downloader downloader=Downloader();
      var downloadresult=await downloader.getDownloadData();
      if(downloadresult is bool){
        Utilities().show(context, "Could not download question");
        return;
      }
      Question4ArrayJson array=Question4ArrayJson.fromJson(downloadresult);
      print(array);
      questions=[];
      for(var v in array.lstQuestion){
        print(v);
        Question4Option question=Question4Option.fromJson(v);
        questions.add(question);
        print(question);
      }
      questionno++;
      currentquestion=questions[questionno];
      correctquestiontext=currentquestion!.question;
      opta=currentquestion!.opta;
      optb=currentquestion!.optb;
      optc=currentquestion!.optc;
      optd=currentquestion!.optd;
      setState(() {   });
      return;
    }
    if(questionno>=questions.length-1){
      addResult(b);
      correctquestiontext="Question Over. Correct answer=$correctanswer";
      Utilities().show(context, correctquestiontext);
      isTextOver=true;
      return;
    }
    addResult(_result);
    questionno++;
    if(questionno<=questions.length-1){
      currentquestion=questions[questionno];
      correctquestiontext=currentquestion!.question;
      opta=currentquestion!.opta;
      optb=currentquestion!.optb;
      optc=currentquestion!.optc;
      optd=currentquestion!.optd;
    }
  }
// 

  
  void addResult(int answer) {
    bool iscorrect = (answer == currentquestion!.correctAnswer);
    //scores.clear();
    print("Submitted " +
        answer.toString() +
        "  " +
        currentquestion!.correctAnswer.toString());
    if (iscorrect) {
      correctanswer++;
      scores.add(const Icon(Icons.check, color: Colors.green));
    } else {
      scores.add(const Icon(Icons.close, color: Colors.red));
    }
    _result = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: TextWidget(
                    text: correctquestiontext,
                    textSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    maxLine: 5,
                    align: TextAlign.center),
              ),
            ),
          ),

          
          Expanded(
            flex: 3,
            child: Column(
              children: [
                //*****************************888888888888888888
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Material(
                          child: RadioListTile<int?>(
                            title: Text(
                              opta,
                            ),
                            value: 1,
                            groupValue: _result,
                            onChanged: (int? value) {
                              setState(() {
                                _result = 1;
                              });
                            },
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      
                      Expanded(
                        child: Material(
                          child: RadioListTile<int?>(
                            title: Text(
                              optb,
                              // style: widget.radiostyle,
                            ),
                            value: 2,
                            groupValue: _result,
                            onChanged: (int? value) {
                              setState(() {
                                _result = 2;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //******************88888888888888888888888888
                //*****************************888888888888888888
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Material(
                          child: RadioListTile<int?>(
                            title: Text(
                              optc,
                              // style: widget.radiostyle,
                            ),
                            value: 3,
                            groupValue: _result,
                            onChanged: (int? value) {
                              setState(() {
                                _result = 3;
                              });
                            },
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      
                      Expanded(
                        child: Material(
                          child: RadioListTile<int?>(
                            title: Text(
                              optd,
                              // style: widget.radiostyle,
                            ),
                            value: 4,
                            groupValue: _result,
                            onChanged: (int? value) {
                              setState(() {
                                _result = 4;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                //******************88888888888888888888888888
              ],
            ),
          ),

          // //****************************************************************

          Expanded(
            //flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MainButton(
                text: const TextWidget(
                  text: "Submit", 
                  textSize: 20.0, 
                  fontWeight: FontWeight.bold, 
                  color: whiteText, 
                  maxLine: 1, 
                  align: TextAlign.center
                  ), 
                onPressed: (){
                  print("Submitted True");
                  setState(() {
                    setQuestion(_result, context);
                  });
                }, 
                color: greenButton, 
                size: 20
                ),
            ),
          ),
          Row(
            children: scores,
          ),
        ],
      ),
    );
  }
}