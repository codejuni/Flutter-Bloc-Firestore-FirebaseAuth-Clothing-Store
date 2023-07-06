// ignore_for_file: public_member_api_docs, sort_constructors_first
// Model class representing an exception
class ExceptionModel {
  final String title;
  final String message;

  // Constructor for creating an ExceptionModel instance
  ExceptionModel({
    required this.title,
    required this.message,
  });

  // Factory method for creating an initial ExceptionModel instance
  factory ExceptionModel.initial() {
    return ExceptionModel(
      title: '',
      message: '',
    );
  }
}
