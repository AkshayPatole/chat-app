class Validations {
  Validations._();
  String? validationForTextFields(String? value, String label, int char) {
    if (value == null || value.isEmpty) {
      return '$label is required';
    } else if (value.trim().length > char) {
      return 'Exceeded maximum character length of $char';
    }
    return null;
  }
}
