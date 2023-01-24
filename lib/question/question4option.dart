
class Question4Option{
  final String question,opta,optb,optc,optd;
  final int correctAnswer;

  Question4Option({required this.question, required this.opta, required this.optb, required this.optc, 
  required this.optd, required this.correctAnswer});

  factory Question4Option.fromJson(Map<String,dynamic> json){
    return Question4Option(
      question: json ["question"] as String, 
      opta: json ["opta"] as String, 
      optb: json ["optb"] as String,  
      optc: json ["optc"] as String,  
      optd: json ["optd"] as String,  
      correctAnswer: (int.tryParse(json['correctanswer'].toString())==null)? 0
      : int.parse(json['correctanswer'].toString()),
      );
  }
  @override
  String toString(){
    return "Question= "+ question + ", correctAnswer= " + correctAnswer.toString();
  }
}

class Question4Array{
  static List<Question4Option>questions=[];
}

class Question4ArrayJson{
  final List<dynamic> lstQuestion;

  Question4ArrayJson({required this.lstQuestion});

  // For this api rest Api (/api/questionprint)  &  Uri.http
  // factory Question4ArrayJson.fromJson(Map<String,dynamic>json){
  //   return Question4ArrayJson(lstQuestion: json ['data'] as List<dynamic>);
  // }

  // For this api  //public//tyroquiz/math/percentage/level1.json  &  Uri.https
  factory Question4ArrayJson.fromJson(Map<String, dynamic> json) {
    return Question4ArrayJson(lstQuestion: json['questions'] as List<dynamic>);
  }
}