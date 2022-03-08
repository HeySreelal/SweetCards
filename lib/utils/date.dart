const months = [
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

String formatedDate(DateTime date) {
  return '${months[date.month - 1]} ${date.day}, ${date.year}';
}
