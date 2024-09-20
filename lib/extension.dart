extension DateTimeExt on DateTime {
  String daySuffix() {
    return day.suffix();
  }

  String getMonth() {
    return month.parseMonth();
  }
}

extension IntExt on int {
  String suffix() {
    return switch (this) {
      == 1 || 21 || 31 => "st",
      == 2 || 22 => "nd",
      == 3 || 23 => "rd",
      _ => "th"
    };
  }

  String parseMonth() {
    return switch (this) {
      1 => "January",
      2 => "February",
      3 => "March",
      4 => "April",
      5 => "May",
      6 => "June",
      7 => "July",
      8 => "August",
      9 => "September",
      10 => "October",
      11 => "November",
      _ => "December"
    };
  }
}
