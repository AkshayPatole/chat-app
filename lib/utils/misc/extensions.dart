import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/regex_strings.dart';


extension ContextExtensions on BuildContext {
  // /// Is the device a phone
  // bool get isSmallScreen => MediaQuery.of(this).size.width < 650;

  // /// Is the device a tablet
  // bool get isMediumScreen =>
  //     MediaQuery.of(this).size.width >= 650 &&
  //     MediaQuery.of(this).size.width < 1100;

  // /// Is the device a desktop
  // bool get isBigScreen => MediaQuery.of(this).size.width >= 1100;

  /// Returns the current [ThemeData] of the [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Returns the current [MediaQueryData] of the [BuildContext].
  MediaQueryData get mq => MediaQuery.of(this);

  OverlayState? get overlay => Overlay.of(this);

  /// Returns the current [ModalRoute] args of the [BuildContext].
  dynamic get routeArgs => ModalRoute.of(this)!.settings.arguments;

  /// Returns the current [TextTheme] of the [BuildContext].
  TextTheme get textTheme2 => theme.textTheme;

  /// Returns the current [Size] of the [BuildContext].
  Size get mqSize => mq.size;

  /// Returns the current [MediaQueryData.size.width] of the [BuildContext].
  double get width => mq.size.width;

  /// Returns the current [MediaQueryData.size.height] of the [BuildContext].
  double get height => mq.size.height;

  /// Shows a [SnackBar] with the given [message] and [backgroundColor] acc
  /// to the [snackType].
  /// [duration] defaults to 2 seconds.
  /// [backgroundColor] defaults to [Colors.black].
  /// [backgroundRadius] defaults to 8.
  /// [textColor] defaults to [Colors.white].
  /// [snackType] defaults to [SnackType.info].
}

extension APIHandlerExtension on BuildContext {
  // Future<T?> handleAPI<T>(Future<T?> Function() apiCall) async {
  //   Dialogs.loader(this);

  //   try {
  //     final result = await apiCall();
  //     if (mounted) Navigator.of(this, rootNavigator: true).pop();
  //     return result;
  //   } catch (e, stack) {
  //     if (mounted) Navigator.of(this, rootNavigator: true).pop();
  //     ApiLogger.logError(e, stack);
  //     rethrow;
  //   }
  // }
}

extension NumOperations on double {
  String toFeetAndInches() {
    var feet = (this ~/ 12).round();
    var inches = (this % 12).round();

    var height = "$feet'$inches\"";
    return height;
  }

  /// Returns random integer, where max range is
  /// based on the number applied upon.
  // String randomInt() => Random().nextInt(toInt()).toString();
}

extension IterableModifier<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) =>
      cast<E?>().firstWhere((v) => v != null && test(v), orElse: () => null);

  E? singleWhereOrNull(bool Function(E) test) =>
      cast<E?>().singleWhere((v) => v != null && test(v), orElse: () => null);
}

extension TimeOfDayExtensions on TimeOfDay {
  String format12Hour(BuildContext context) {
    TimeOfDay time = replacing(hour: hourOfPeriod);
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    final StringBuffer buffer = StringBuffer();

    buffer
      ..write(time.format(context))
      ..write(' ')
      ..write(period == DayPeriod.am
          ? localizations.anteMeridiemAbbreviation
          : localizations.postMeridiemAbbreviation);

    return '$buffer';
  }

  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }

  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  bool isAfter(TimeOfDay other) {
    double b = other.hour + other.minute / 60.0;
    double a = hour + minute / 60.0;
    if (a >= b) {
      return true;
    } else {
      return false;
    }
  }

  bool isBefore(TimeOfDay other) {
    double b = other.hour + other.minute / 60.0;
    double a = hour + minute / 60.0;
    if (a <= b) {
      return true;
    } else {
      return false;
    }
  }

  double toDouble() => hour + minute / 60.0;
}

extension StringExtensions on String {
  /// Camelcase string extension
  String toCamelCase() {
    if (trim().isEmpty) return this;
    final wordList = split(RegexStrings.space).toList();
    if (wordList.length > 1) {
      return wordList
          .takeWhile((String e) => e.trim().isNotEmpty)
          .map((String e) => e[0].toUpperCase() + e.substring(1).toLowerCase())
          .toList()
          .join(RegexStrings.space);
    }
    return wordList.first[0].toUpperCase() +
        wordList.first.substring(1).toLowerCase();
  }

  String camelToSentence() {
    return replaceAllMapped(
      RegexStrings.camelToSentence,
      (Match m) => m[1] == null ? " ${m[0]}" : m[1]!.toUpperCase(),
    );
  }

  /// Normalize Firebase or Platform exception message
  String normalizeMessage() {
    if (trim().isEmpty) return this;
    return replaceAll(
      RegexStrings.normalizationRegEx,
      RegexStrings.space,
    ).toCamelCase();
  }

  /// Provide name initials of any provided string
  String initials() {
    if (trim().isEmpty) return this;
    final wordList = split(RegexStrings.space).toList();
    if (wordList.length > 1) {
      return wordList
          .takeWhile((String e) => e.trim().isNotEmpty)
          .map((String e) => e[0].toUpperCase())
          .toList()
          .join();
    }
    return wordList.first[0].toUpperCase();
  }

  DateTime toDate() {
    assert(isNotEmpty, 'String must be non-empty to be able to parse');
    final dateTime = DateTime.tryParse(this);
    assert(dateTime != null, 'Date format is incorrect');
    return dateTime!;
  }

  String getExtensionContentType() {
    final extension = split('.').last.toLowerCase();

    switch (extension) {
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      default:
        return 'application/octet-stream';
    }
  }
}

extension ColorExtensions on int {
  MaterialColor toMaterialColor() {
    return MaterialColor(
      this,
      <int, Color>{
        50: Color(this),
        100: Color(this),
        200: Color(this),
        300: Color(this),
        400: Color(this),
        500: Color(this),
        600: Color(this),
        700: Color(this),
        800: Color(this),
        900: Color(this),
      },
    );
  }
}

extension SizedBoxExtension on int {
  SizedBox toHeight() {
    switch (this) {
      case 2:
        return const SizedBox(height: 2);
      case 4:
        return const SizedBox(height: 4);
      case 6:
        return const SizedBox(height: 6);
      case 8:
        return const SizedBox(height: 8);
      case 10:
        return const SizedBox(height: 10);
      case 12:
        return const SizedBox(height: 12);
      case 14:
        return const SizedBox(height: 14);
      case 16:
        return const SizedBox(height: 16);
      case 18:
        return const SizedBox(height: 18);
      case 20:
        return const SizedBox(height: 20);
      case 22:
        return const SizedBox(height: 22);
      case 24:
        return const SizedBox(height: 24);
      case 26:
        return const SizedBox(height: 26);
      case 28:
        return const SizedBox(height: 28);
      case 30:
        return const SizedBox(height: 30);
      case 32:
        return const SizedBox(height: 32);
      default:
        return const SizedBox(height: 0);
    }
  }

  SizedBox toWidth() {
    switch (this) {
      case 2:
        return const SizedBox(width: 2);
      case 4:
        return const SizedBox(width: 4);
      case 6:
        return const SizedBox(width: 6);
      case 8:
        return const SizedBox(width: 8);
      case 10:
        return const SizedBox(width: 10);
      case 12:
        return const SizedBox(width: 12);
      case 14:
        return const SizedBox(width: 14);
      case 16:
        return const SizedBox(width: 16);
      case 18:
        return const SizedBox(width: 18);
      case 20:
        return const SizedBox(width: 20);
      case 22:
        return const SizedBox(width: 22);
      case 24:
        return const SizedBox(width: 24);
      case 26:
        return const SizedBox(width: 26);
      case 28:
        return const SizedBox(width: 28);
      case 30:
        return const SizedBox(width: 30);
      case 32:
        return const SizedBox(width: 32);
      case 34:
        return const SizedBox(width: 34);
      default:
        return const SizedBox(width: 0);
    }
  }
}

extension DateExtensions on DateTime {

  
  String? toStandardDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toDayMonthYear() {
    return DateFormat('EEE, dd MMM yyyy').format(this);
  }

  String toDay() {
    return DateFormat('E').format(this);
  }

  String toDayMonthYearTime() {
    return DateFormat('EEE, dd MMM yyyy, hh:mm aa').format(this);
  }

  String toStartTimeFormat() {
    return DateFormat.jm().format(this);
  }

  String toEndTimeFormat() {
    return DateFormat.jm().format(this);
  }

  String toMMMddyyyy() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

   String toMMMddyyyyWithTime() {
    return DateFormat('MMM dd, yyyy hh:mm aa').format(this);
  }

  String toyyyymmdd() {
    return DateFormat('yyyy/MM/dd').format(this);
  }

  String toYYYYMMDD() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toMMMyyyy() {
    return DateFormat('MMM, yyyy').format(this);
  }
  
  String formatTimestamp() {
    return DateFormat('M/d/yyyy, h:mm:ss a').format(this);
  }

}

extension IntTimestampConversion on int {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}

extension NullableStringExtensions on String? {
  /// Returns `value.trim()` when non-null and not-empty, otherwise returns the provided fallback (default: "--")
  String orDash([String fallback = "--"]) {
    if (this == null) return fallback;
    final s = this!.trim();
    if (s.isEmpty) return fallback;
    return s;
  }

  /// If you prefer returning empty string instead of dash
  String orEmpty() => this?.trim() ?? '';
}


extension DateFormatConversion on String {
  String toDetailedIsoDate() {
    try {
      DateTime parsedDate = DateFormat('MMM dd, yyyy').parse(this);
      return DateFormat('yyyy-MM-dd HH:mm:ss').format(parsedDate);
    } catch (e) {
      return 'Invalid date';
    }
  }

  String toIsoDate() {
    try {
      DateTime parsedDate = DateFormat('MMM dd, yyyy').parse(this);
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    } catch (e) {
      return 'Invalid date';
    }
  }

  String toFormattedDate() {
    try {
      DateTime parsedDate = DateTime.parse(this); // Parse the ISO date string
      return DateFormat('MMM dd, yyyy')
          .format(parsedDate); // Format to "MMM dd, yyyy"
    } catch (e) {
      return 'Invalid date'; // Handle parsing errors
    }
  }
  String toMMMyyyyDate() {
    try {
      DateTime parsedDate = DateTime.parse(this); // Parse the ISO date string
      return DateFormat('MMM, yyyy')
          .format(parsedDate); // Format to "MMM, yyyy"
    } catch (e) {
      return 'Invalid date'; // Handle parsing errors
    }
  }

  String toMMMyyyyFormat() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('MMM yyyy').format(dateTime);
    } catch (e) {
      return "-"; // Return "-" if the date format is invalid
    }
  }

  String toYearFormat() {
    if (isEmpty) {
      return "-";
    }

    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('yyyy').format(dateTime);
    } catch (e) {
      return "-";
    }
  }

  String? getYear() {
    try {
      final parts = split('/');
      if (parts.length == 3) {
        return (parts[0]);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  String toYearMonthFormat() {
    try {
      // ("Jan,2023")
      final parsedDate = DateFormat('MMM, yyyy').parse(this);
      // ( "2024/06")
      return DateFormat('yyyy/MM').format(parsedDate);
    } catch (e) {
      return '-';
    }
  }

  String toMonthYearFormat() {
    try {
      // ("2024/06")
      final parsedDate = DateFormat('yyyy/MM').parse(this);
      // ( "Jun, 2024")
      return DateFormat('MMM, yyyy').format(parsedDate);
    } catch (e) {
      return '-';
    }
  }
}

enum StartingDayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

/// Returns a numerical value associated with given `weekday`.
///
/// Returns 1 for `StartingDayOfWeek.monday`, all the way to 7 for `StartingDayOfWeek.sunday`.
int getWeekdayNumber(StartingDayOfWeek weekday) {
  return StartingDayOfWeek.values.indexOf(weekday) + 1;
}

bool hasNullField(dynamic object) {
  if (object == null) {
    return true; // Object itself is null
  }

  final fields = object.toMap(); // Assuming the object has a `toMap()` method
  log(fields.toString());
  for (final field in fields.entries) {
    // if (field['occupation'] != null && field.key == 'worksat') {
    //   if (UiString.occupationWithNullWorksat.contains(field['occupation'])) {
    //     continue;
    //   }
    // }
    if (field.key != 'linkedin' && field.value == null) {
      return true; // Found a null field
    }
  }

  return false; // No null fields found
}

List<T> rightRotate<T>(List<T> array, int rotations) {
  if (array.isEmpty) return array;

  final n = array.length;
  final shift = rotations % n;

  return [...array.sublist(n - shift), ...array.sublist(0, n - shift)];
}

List<T> leftRotate<T>(List<T> array, int rotations) {
  if (array.isEmpty) return array;

  final n = array.length;
  final shift = rotations % n;

  return [...array.sublist(shift), ...array.sublist(0, shift)];
}
