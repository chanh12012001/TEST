import 'package:example_ui/model/waitlist_rule_tyle.dart';
import 'package:example_ui/widgets/button_base.dart';
import 'package:example_ui/widgets/switch_base.dart';
import 'package:flutter/material.dart';

class AppointmentOnlineRules extends StatefulWidget {
  const AppointmentOnlineRules({super.key});

  @override
  State<AppointmentOnlineRules> createState() => _AppointmentOnlineRulesState();
}

class _AppointmentOnlineRulesState extends State<AppointmentOnlineRules> {
  var waitlistTypeSelected = WaitlistRuleTyle.makeYourChoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //header//
            const _HeaderWidget(),
            // body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            "Set criteria for when appointments may be booked, whether online booking requires permission, how waitlist preferences are managed, and how members can cancel or reschedule appointments.",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(height: 10),
                          _dividerWidget(),
                          _AppointmentRuleSwitch(
                            text: "Show HIPAA compliance on the calendar.",
                            description:
                                "The member's name and service will be truncated into shorter characters to hide their full meaning or identity.",
                            onChanged: (value) {},
                            value: false,
                          ),
                          _dividerWidget(),
                          const _AppointmentRuleTextField(
                            name: "Lead time for appointments",
                            hintText: "",
                            unitRule: "hrs",
                            description:
                                "Limit how quickly your member may set an appointment with you online, allowing you time to appropriately respond to the request.",
                          ),
                          _dividerWidget(),
                          _AppointmentRuleTextField(
                            name: "Appointment search restrictions",
                            hintText: "",
                            controller: TextEditingController(text: "30"),
                            description:
                                "Set the amount of open appointments that your members will see when they make an appointment with your care provider online.",
                          ),
                          _dividerWidget(),
                          _AppointmentRuleSwitch(
                            text:
                                "When appointments are not available, display the business phone number.",
                            description:
                                "If no appointments are available on a specified day, the member will be given the company phone number as an alternate method of booking.",
                            onChanged: (value) {},
                            value: false,
                          ),
                        ],
                      ),
                    ),
                    //
                    // Booking
                    //
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: const Color(0xff64B5FB).withOpacity(0.11),
                      child: const Text(
                        "BOOKING",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _AppointmentRuleTextField(
                            name:
                                "Limit the amount of time a member may book a service online.",
                            hintText: "",
                            controller: TextEditingController(text: "120"),
                            unitRule: "days",
                            maxWidth: 250,
                            description:
                                "Set the maximum amount of time a member may arrange an appointment.",
                          ),
                          _AppointmentRuleSwitch(
                            text: "Acceptance is required for online booking.",
                            description:
                                "If you choose this option, you must accept appointments that are scheduled online.",
                            onChanged: (value) {},
                            value: false,
                          ),
                          _dividerWidget(),
                          _AppointmentRuleSwitch(
                            text:
                                "Require deposits and capture credit cards at the time of booking.",
                            description:
                                "Avoid major revenue losses due to no-shows or cancellations. Require deposits or collect members' credit cards at the time of booking to charge a fee if they do not show up or cancel their appointment late.",
                            onChanged: (value) {},
                            value: false,
                          ),
                        ],
                      ),
                    ),

                    //
                    // WAITLIST
                    //
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: const Color(0xff64B5FB).withOpacity(0.11),
                      child: const Text(
                        "WAITLIST",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "When your calendar is completely booked, members may be added to a waitlist. If a member cancels, you may choose a member from the waitlist manually, or wiHelper will automatically inform waitlist members of their availability.",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          Column(
                            children: List.generate(
                              WaitlistRuleTyle.values.length,
                              (index) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Radio(
                                        activeColor: const Color(0xff6D018C),
                                        value: WaitlistRuleTyle.values[index],
                                        groupValue: waitlistTypeSelected,
                                        onChanged: (value) {
                                          setState(() {
                                            waitlistTypeSelected = value!;
                                          });
                                        },
                                        visualDensity: const VisualDensity(
                                            horizontal: -4, vertical: -4),
                                      ),
                                      const SizedBox(width: 10),
                                      Flexible(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: WaitlistRuleTyle
                                                    .values[index].name,
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              TextSpan(
                                                text: WaitlistRuleTyle
                                                    .values[index].description,
                                                style: const TextStyle(
                                                    color: Color(0xff000000),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w200),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          _dividerWidget(),
                          _AppointmentRuleSwitch(
                            text: "Waitlist notifications",
                            description:
                                "Avoid major revenue losses due to no-shows or cancellations. Require deposits or collect members' credit cards at the time of booking to charge a fee if they do not show up or cancel their appointment late.",
                            onChanged: (value) {},
                            value: false,
                          ),
                          _dividerWidget(),
                          _AppointmentRuleSwitch(
                            text:
                                "A member may put their name on the waiting list.",
                            description:
                                "Members should be able to join the waitlist directly from your online booking page.",
                            onChanged: (value) {},
                            value: false,
                          ),
                        ],
                      ),
                    ),

                    //
                    // CANCELLATION
                    //
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: const Color(0xff64B5FB).withOpacity(0.11),
                      child: const Text(
                        "CANCELLATION",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _AppointmentRuleSwitch(
                            text: "Appointments may be canceled by members.",
                            description:
                                "Members should be able to cancel their appointments.",
                            onChanged: (value) {},
                            value: true,
                          ),
                          _dividerWidget(),
                          _AppointmentRuleTextField(
                            controller: TextEditingController(text: "1"),
                            name: "Cancel hours before appointment",
                            hintText: '',
                            unitRule: "hrs",
                          ),
                          _AppointmentRuleSwitch(
                            text: "Automatically refund pre-paid appointments.",
                            description:
                                "If a member cancels at least 1 hour prior to their appointment, they will be automatically refunded in the form of their initial payment.",
                            onChanged: (value) {},
                            value: false,
                          ),
                          _dividerWidget(),
                          const _AppointmentRuleTextField(
                            name: "Refund policy",
                            hintText: '0/1000 characters',
                            maxLine: 4,
                          ),
                          _AppointmentRuleSwitch(
                            text: "Members can reschedule appointments.",
                            description:
                                "Members should be able to reschedule their appointments.",
                            onChanged: (value) {},
                            value: true,
                          ),
                          _dividerWidget(),
                          _AppointmentRuleTextField(
                            controller: TextEditingController(text: "1"),
                            name: "Reschedule hours before appointment.",
                            hintText: '',
                            unitRule: "hrs",
                          ),
                          _AppointmentRuleSwitch(
                            text:
                                "Members have the option to terminate their memberships.",
                            description:
                                "Members should be able to cancel their recurring subscriptions.",
                            onChanged: (value) {},
                            value: false,
                          ),
                          _dividerWidget(),
                          _AppointmentRuleSwitch(
                            text: "Packages may be canceled by members.",
                            description:
                                "Allow members to cancel their recurring packages.",
                            onChanged: (value) {},
                            value: false,
                          ),
                          _dividerWidget(),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Appointment cancellation policy",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextFormField(
                                  maxLines: 4,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //
                    // HOUSE CALLS
                    //
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: const Color(0xff64B5FB).withOpacity(0.11),
                      child: const Text(
                        "HOUSE CALLS",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _AppointmentRuleTextField(
                            controller: TextEditingController(text: "0"),
                            name: "House visits need one-way travel time.",
                            hintText: '',
                            maxWidth: 250,
                            unitRule: "min",
                          ),
                          const _AppointmentRuleTextField(
                            name: "House calls incur additional charges.",
                            hintText: "\$ 0.00",
                            maxWidth: 250,
                          ),
                          _AppointmentRuleTextField(
                            controller: TextEditingController(text: "0"),
                            name:
                                "House calls may be redeemed for more points.",
                            hintText: '',
                            maxWidth: 250,
                            unitRule: "pts",
                          ),
                          _AppointmentRuleSwitch(
                            text: "House calls are required.",
                            description:
                                "House call services will be provided exclusively at off-site locations and will not be provided within the corporate building. When making a reservation, the member must specify an address where the service will be performed.",
                            onChanged: (value) {},
                            value: false,
                          ),
                        ],
                      ),
                    ),

                    //
                    // HOUSE CALLS
                    //
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: const Color(0xff64B5FB).withOpacity(0.11),
                      child: const Text(
                        "REVIEWS",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _AppointmentRuleSwitch(
                            text:
                                "Allow only verified members to provide reviews.",
                            description:
                                "Only members who have finished an appointment at the business are permitted to submit a review.",
                            onChanged: (value) {},
                            value: true,
                          ),
                          _dividerWidget(),
                        ],
                      ),
                    ),

                    //
                    //// Button
                    //
                    Container(
                      color: const Color(0xff5C2E85).withOpacity(0.1),
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ButtonBase(
                              onPressed: () {},
                              backgroundColor: const Color(0xff5C2E85),
                              borderColor: const Color(0xff5C008D),
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              text: 'Save',
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            child: ButtonBase(
                              onPressed: () {},
                              backgroundColor: const Color(0xffffffff),
                              borderColor: const Color(0xffE80881),
                              textStyle: const TextStyle(
                                color: Color(0xffE80881),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              text: 'Cancel',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Divider _dividerWidget() {
    return const Divider(height: 0, thickness: 0.5, color: Color(0xffC0C0C0));
  }
}

class _AppointmentRuleSwitch extends StatelessWidget {
  final String text;
  final String description;
  final Function(bool) onChanged;
  final bool value;
  const _AppointmentRuleSwitch(
      {required this.text,
      required this.description,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchBase(onChanged: onChanged, value: value),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                      color: Color(0xff999999),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentRuleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String name;
  final String hintText;
  final bool readOnly;
  final int? maxLine;
  final String? unitRule;
  final String? description;
  final double? maxWidth;
  const _AppointmentRuleTextField(
      {required this.name,
      required this.hintText,
      this.controller,
      this.readOnly = false,
      this.maxLine = 1,
      this.description,
      this.unitRule,
      this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: maxLine != 1
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: maxWidth == null
                          ? null
                          : BoxConstraints(maxWidth: maxWidth!),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        readOnly: readOnly,
                        maxLines: maxLine,
                        controller: controller,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: const TextStyle(
                            color: Color(0xff999999),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (unitRule != null)
                Text(
                  " $unitRule",
                  style: const TextStyle(
                    color: Color(0xff999999),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
            ],
          ),
          const Divider(height: 3, thickness: 0.5, color: Color(0xffC0C0C0)),
          if (description != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                description!,
                style: const TextStyle(
                  color: Color(0xff999999),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      color: const Color(0xff3B0168),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                width: 32,
                height: 32,
                "assets/appointment_online_rules/ic_person_outline.png",
              ),
              const Spacer(),
              Image.asset(
                width: 24,
                height: 24,
                "assets/appointment_online_rules/ic_language.png",
              ),
              const SizedBox(width: 15),
              Image.asset(
                width: 24,
                height: 24,
                "assets/appointment_online_rules/ic_notification.png",
              ),
              const SizedBox(width: 15),
              Image.asset(
                width: 24,
                height: 24,
                "assets/appointment_online_rules/ic_menu.png",
              )
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  width: 34,
                  height: 34,
                  "assets/add_new_appointment/ic_back_button.png",
                ),
              ),
              const Text(
                "Appointment online rules",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.asset(
                width: 34,
                height: 34,
                "assets/add_new_appointment/ic_close.png",
              )
            ],
          ),
        ],
      ),
    );
  }
}
