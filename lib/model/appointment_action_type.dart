enum AppointmentActionType { edit, move, reschedule, doubleBook }

extension AppointmentActionTypeExtension on AppointmentActionType {
  String get name {
    switch (this) {
      case AppointmentActionType.edit:
        return "Edit";
      case AppointmentActionType.move:
        return "Move";
      case AppointmentActionType.reschedule:
        return "Reschedule";
      case AppointmentActionType.doubleBook:
        return "Double book";
    }
  }

  String get description {
    switch (this) {
      case AppointmentActionType.edit:
        return "Edit this appointment.";
      case AppointmentActionType.move:
        return "Move the appointment to a different time.";
      case AppointmentActionType.reschedule:
        return "Reschedule this appointment.";
      case AppointmentActionType.doubleBook:
        return "Book another appointment at 6:30 p.m.";
    }
  }

  String get iconPath {
    switch (this) {
      case AppointmentActionType.edit:
        return "assets/calendar_dialog_filled_slot/ic_appointment_edit.png";
      case AppointmentActionType.move:
        return "assets/calendar_dialog_filled_slot/ic_appointment_move.png";
      case AppointmentActionType.reschedule:
        return "assets/calendar_dialog_filled_slot/ic_appointment_reschedule.png";
      case AppointmentActionType.doubleBook:
        return "assets/calendar_dialog_filled_slot/ic_appointment_double_book.png";
    }
  }
}
