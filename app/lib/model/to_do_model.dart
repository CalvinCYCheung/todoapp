class ToDoModel {
  final String title;
  final String content;

  ToDoModel(this.title, this.content);

  @override
  String toString() {
    return 'title: $title , content: $content';
  }
}
