class MissionQuestion{
  final int questionId;
  final String question;
  final String answer;
  final List<String> alternatives;

  MissionQuestion(
      this.questionId,
      this.question,
      this.answer,
      this.alternatives);

  factory MissionQuestion.fromJson(Map<String,dynamic> data){
    final int questionId = data['questionId'];
    final String question = data['question'];
    final String answer = data['answer'];
    final List<String> alternatives = data['alternatives'];

    return MissionQuestion(questionId, question, answer, alternatives);
  }
}