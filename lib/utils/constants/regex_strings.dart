class RegexStrings {
  RegexStrings._();

  static const String space = " ";

  /// Regular expression for email validation
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$',
  );

  /// Regular expression for filtering email input (lowercase, digits, and some special characters)
  static final RegExp emailFilteringRegex = RegExp(r'[a-z0-9@._\-+]');

  /// Regular expression for digits only
  static final RegExp digitsOnly = RegExp(r'^\d+$');

  /// Regular expression for any non-digit character
  static final RegExp nonDigits = RegExp(r'[^0-9]');

  /// Regular expression for one or more whitespace characters
  static final RegExp multipleSpaces = RegExp(r'\s+');

  /// Regular expression for denying leading spaces
  static final RegExp denyLeadingSpaces = RegExp(r'^\s+');

  /// Regular expression for time separator (colon or space)
  static final RegExp timeSeparator = RegExp(r'[:\s]');

  /// Regular expression for currency cleaner (all except digits, dot, and minus)
  static final RegExp currencyCleaner = RegExp(r'[^\d.-]');

  /// Regular expression for ISO currency code (3 uppercase letters)
  static final RegExp currencyCode = RegExp(r'^[A-Z]{3}$');

  /// Regular expression for formatting camelCase to Sentence Case or adding space before capital letters
  static final RegExp camelToSentence = RegExp(r'^([a-z])|[A-Z]');

  /// Regular expression for normalizing strings (replacing separators with space)
  static final RegExp normalizationRegEx = RegExp(r'[/_-]');

  /// Regular expression for non-alphanumeric characters (used in slugification)
  static final RegExp nonAlphanumeric = RegExp(r'[^a-z0-9]+');

  /// Regular expression for trimming underscores from start and end
  static final RegExp trimUnderscores = RegExp(r'^_+|_+$');

  /// Regular expression for a plus sign followed by digits at the end of a string
  static final RegExp plusDigitsAtEnd = RegExp(r'(\+\d+)$');

  static final RegExp emailOrUsername = RegExp(r'^[a-zA-Z0-9@._\-+]+$');
}
