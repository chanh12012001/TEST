enum WaitlistRuleTyle {
  makeYourChoice,
  makeMoney,
  firstInLine,
  immediatelyBook,
}

extension WaitlistRuleTyleExtension on WaitlistRuleTyle {
  String get name {
    switch (this) {
      case WaitlistRuleTyle.makeYourChoice:
        return "You make your choice. ";
      case WaitlistRuleTyle.makeMoney:
        return "Make money. ";
      case WaitlistRuleTyle.firstInLine:
        return "The first in line. ";
      case WaitlistRuleTyle.immediatelyBook:
        return "Immediately book. ";
    }
  }

  String get description {
    switch (this) {
      case WaitlistRuleTyle.makeYourChoice:
        return "Manually choose a waitlist member and transfer them to an open spot on the provider schedule. (Default)";
      case WaitlistRuleTyle.makeMoney:
        return "Offer the highest-paid appointment on the queue automatically. The offer is extended to the next highest-paying appointment.";
      case WaitlistRuleTyle.firstInLine:
        return "Offer it to the first person on the queue automatically. Then pass it to the next person in line.";
      case WaitlistRuleTyle.immediatelyBook:
        return "Offer appointments to everyone on the waiting automatically. The first person to book it wins.";
    }
  }
}
