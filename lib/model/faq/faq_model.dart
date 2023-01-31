class FaqModel {
  String id;
  String question;
  String answer;
  String status;

  FaqModel(
      {required this.id,
        required this.question,
        required this.answer,
        required this.status});

  factory FaqModel.fromMap(Map map) => FaqModel(
    id: map["id"].toString(),
    question: map["question"].toString(),
    answer: map["answer"].toString(),
    status: map["status"].toString(),
  );
}