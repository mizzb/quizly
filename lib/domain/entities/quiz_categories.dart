class QuizCategories {
  List<TriviaCategories>? triviaCategories;

  QuizCategories({triviaCategories});

  QuizCategories.fromJson(Map<String, dynamic> json) {
    if (json['trivia_categories'] != null) {
      triviaCategories = <TriviaCategories>[];
      json['trivia_categories'].forEach((v) {
        triviaCategories!.add(TriviaCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (triviaCategories != null) {
      data['trivia_categories'] =
          triviaCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TriviaCategories {
  int? id;
  String? name;

  TriviaCategories({id, name});

  TriviaCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
