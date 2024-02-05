class RecordModel {
  final String title;
  final DateTime date;

  String get formattedDate => date.toString();

  RecordModel({required this.title, required this.date});
}
