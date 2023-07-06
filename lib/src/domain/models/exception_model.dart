// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExceptionModel {
  final String title;
  final String message;
  ExceptionModel({
    required this.title,
    required this.message,
  });

  factory ExceptionModel.initial() {
    return ExceptionModel(
      title: '',
      message: '',
    );
  }
}
