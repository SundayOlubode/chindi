String truncateDescription(String description, int length) {
  if (description.length <= length) {
    return description;
  } else {
    return '${description.substring(0, length - 4)}...';
  }
}
