enum AppointmentType {
  inPerson,
  video,
  phoneCall,
  houseCall,
}

extension AppointmentTypeExtension on AppointmentType {
  String get name {
    switch (this) {
      case AppointmentType.inPerson:
        return "In person";
      case AppointmentType.video:
        return "Video";
      case AppointmentType.phoneCall:
        return "Phone call";
      case AppointmentType.houseCall:
        return "House call";
    }
  }
}
