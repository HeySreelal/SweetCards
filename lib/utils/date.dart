class SweetDays {
  static const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static String formatedDate(DateTime date) {
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  static int daysCount(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    return difference.inMilliseconds ~/ Duration.millisecondsPerDay;
  }
}
