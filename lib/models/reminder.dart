class Reminder {
  final String id;
  final String businessUnit;
  final String reminderType;
  final DateTime entryDate;
  final String reminderCategory;

  Reminder(
      {required this.id,
      required this.businessUnit,
      required this.reminderCategory,
      required this.reminderType,
      required this.entryDate});
}
