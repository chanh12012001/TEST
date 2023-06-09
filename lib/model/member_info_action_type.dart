enum MemberInfoActionType {
  memberDetails,
  addresses,
  emergencyContact,
  careProviders,
  guarantorInformation,
  insurance,
}

extension MemberInfoActionTypeExtension on MemberInfoActionType {
  String get name {
    switch (this) {
      case MemberInfoActionType.memberDetails:
        return "Member details";
      case MemberInfoActionType.addresses:
        return "Addresses";
      case MemberInfoActionType.emergencyContact:
        return "Emergency contact";
      case MemberInfoActionType.careProviders:
        return "Care providers";
      case MemberInfoActionType.guarantorInformation:
        return "Guarantor information";
      case MemberInfoActionType.insurance:
        return "Insurance";
    }
  }
}
