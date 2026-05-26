class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answers': answers,
    };
  }

  String getAnswer() {
    return answers[0];
  }

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return (QuizQuestion(json['question'] as String,
        List<String>.from(json['answers'] as List)));
  }
}
