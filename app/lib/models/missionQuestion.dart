class MissionQuestion {
  final int questionId;
  final String question;
  final String answer;
  final List<String> alternatives;
  final bool? isAnswered;

  MissionQuestion(this.questionId, this.question, this.answer,
      this.alternatives, this.isAnswered);

  factory MissionQuestion.fromJson(Map<String, dynamic> data) {
    final int questionId = data['questionId'];
    final String question = data['question'];
    final String answer = data['answer'];
    final List<dynamic> alternativesDynamic = data['alternatives'];
    final bool? isAnswered = data['isAnswered'];

    List<String> alternativesString = [];
    for (var element in alternativesDynamic) {
      alternativesString.add(element.toString());
    }

    return MissionQuestion(
        questionId, question, answer, alternativesString, isAnswered);
  }
}
