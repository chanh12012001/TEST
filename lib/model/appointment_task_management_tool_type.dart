enum AppointmentTaskManagementType {
  forms,
  insuranceVerification,
  chartNote,
  prescription,
  orders,
  referral,
  instructions
}

extension AppointmentTaskManagementTypeExtension
    on AppointmentTaskManagementType {
  String get name {
    switch (this) {
      case AppointmentTaskManagementType.forms:
        return "Forms and files";
      case AppointmentTaskManagementType.insuranceVerification:
        return "Insurance verification";
      case AppointmentTaskManagementType.chartNote:
        return "Chart notes";
      case AppointmentTaskManagementType.prescription:
        return "Prescriptions";
      case AppointmentTaskManagementType.orders:
        return "Orders";
      case AppointmentTaskManagementType.referral:
        return "Referrals";
      case AppointmentTaskManagementType.instructions:
        return "Instructions and handouts";
    }
  }

  String get description {
    switch (this) {
      case AppointmentTaskManagementType.forms:
        return "Add customer files and forms..";
      case AppointmentTaskManagementType.insuranceVerification:
        return "Check the customer's insurance.";
      case AppointmentTaskManagementType.chartNote:
        return "View or take brief or detailed notes.";
      case AppointmentTaskManagementType.prescription:
        return "View or write prescriptions.";
      case AppointmentTaskManagementType.orders:
        return "View or write lab, imaging, and health-related orders.";
      case AppointmentTaskManagementType.referral:
        return "Refer to healthcare providers or services.";
      case AppointmentTaskManagementType.instructions:
        return "Provide post-op care and treatment directions.";
    }
  }

  String get iconPath {
    switch (this) {
      case AppointmentTaskManagementType.forms:
        return "assets/calendar_dialog_filled_slot/ic_apointment_form_tool.png";
      case AppointmentTaskManagementType.insuranceVerification:
        return "assets/calendar_dialog_filled_slot/ic_appointment_insurance_verify_tool.png";
      case AppointmentTaskManagementType.chartNote:
        return "assets/calendar_dialog_filled_slot/ic_appointment_chart_note_tool.png";
      case AppointmentTaskManagementType.prescription:
        return "assets/calendar_dialog_filled_slot/ic_appointment_prescription_tool.png";
      case AppointmentTaskManagementType.orders:
        return "assets/calendar_dialog_filled_slot/ic_appointment_order_tool.png";
      case AppointmentTaskManagementType.referral:
        return "assets/calendar_dialog_filled_slot/ic_appointment_referrals_tool.png";
      case AppointmentTaskManagementType.instructions:
        return "assets/calendar_dialog_filled_slot/ic_appointment_instructions_tool.png";
    }
  }
}
