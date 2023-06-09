import 'package:flutter/material.dart';

enum AppointmentStatusType {
  accept,
  confirm,
  checkedIn,
  inProgressWithStaff,
  inProgressWithProvider,
  deny,
  cancel,
  delete
}

extension AppointmentStatusTypeExtension on AppointmentStatusType {
  String get name {
    switch (this) {
      case AppointmentStatusType.accept:
        return "Accept";
      case AppointmentStatusType.confirm:
        return "Confirm";
      case AppointmentStatusType.checkedIn:
        return "Checked in";
      case AppointmentStatusType.inProgressWithStaff:
        return "In progress with the staff";
      case AppointmentStatusType.inProgressWithProvider:
        return "In progress with the provider";
      case AppointmentStatusType.deny:
        return "Deny";
      case AppointmentStatusType.cancel:
        return "Cancel";
      case AppointmentStatusType.delete:
        return "Delete";
    }
  }

  String get description {
    switch (this) {
      case AppointmentStatusType.accept:
        return "Accept this appointment.";
      case AppointmentStatusType.confirm:
        return "The member has confirmed the appointment.";
      case AppointmentStatusType.checkedIn:
        return "The member has checked in for this appointment.";
      case AppointmentStatusType.inProgressWithStaff:
        return "Service is currently in progress with the staff. ";
      case AppointmentStatusType.inProgressWithProvider:
        return "Service is currently in progress with the provider.";
      case AppointmentStatusType.deny:
        return "Deny this appointment.";
      case AppointmentStatusType.cancel:
        return "Cancel this appointment.";
      case AppointmentStatusType.delete:
        return "Delete this appointment.";
    }
  }

  Color get color {
    switch (this) {
      case AppointmentStatusType.accept:
        return const Color(0xff2C74B3);
      case AppointmentStatusType.confirm:
        return const Color(0xffFF0000);
      case AppointmentStatusType.checkedIn:
        return const Color(0xffA4FBA6);
      case AppointmentStatusType.inProgressWithStaff:
        return const Color(0xff30CB00);
      case AppointmentStatusType.inProgressWithProvider:
        return const Color(0xff006203);
      case AppointmentStatusType.deny:
        return const Color(0xff999999);
      case AppointmentStatusType.cancel:
        return const Color(0xff000000);
      case AppointmentStatusType.delete:
        return const Color(0xffD70202);
    }
  }
}
