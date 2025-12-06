class AskRequest {
  final String url;
  final String question;

  AskRequest({required this.url, required this.question});

  Map<String, dynamic> toJson() => {"url": url, "question": question};
}
