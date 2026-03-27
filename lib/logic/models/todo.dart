class Todo {
  final String id;
  final String title;
  final String userId;
  final String description;
  bool isDone;
  Todo({
    required this.id,
    required this.title,
    required this.userId,
    required this.description,
    this.isDone = false,
  });
}
