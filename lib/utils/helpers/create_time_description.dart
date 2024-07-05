// If it was made today, we want to show the time
// It it was made some other day, we want to show the date

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

String createTimeDescription(DateTime dateTime) {
  DateTime today = DateTime.now();
  if (dateTime.day == today.day &&
      dateTime.month == today.month &&
      dateTime.year == today.year) {
    return '${dateTime.hour}:${dateTime.minute}';
  } else {
    return '${dateTime.day} ${months[dateTime.month]} ${dateTime.year}';
  }
}
