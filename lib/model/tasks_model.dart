class TaskModel {
  static const String collectionName = "Tasks";

  String? id;

  String? title;

  String? description;

  int? date;

  bool? isDone;

  String? userId;
  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.date,
      required this.userId,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            title: json["title"],
            description: json["description"],
            date: json["date"],
            userId: json["userId"],
            id: json["id"],
            isDone: json["isDone"]);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "userId": userId,
      "isDone": isDone,
    };
  }
}
