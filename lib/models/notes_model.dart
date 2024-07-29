class NotesModel {
  final String date;
  final String time;
  final String content;
  final String category;
  final String level;

  NotesModel(
      {required this.date,
      required this.time,
      required this.content,
      required this.category,
      required this.level});

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      date: json['date'],
      time: json['time'],
      content: json['content'],
      category: json['category'],
      level: json['level'],
    );
  }
}
