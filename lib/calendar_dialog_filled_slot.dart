import 'package:example_ui/model/appointment_action_type.dart';
import 'package:example_ui/model/appointment_status_type.dart';
import 'package:example_ui/model/appointment_task_management_tool_type.dart';
import 'package:example_ui/widgets/button_base.dart';
import 'package:flutter/material.dart';

class CalendarDialogFilledSlot extends StatefulWidget {
  final ScrollController scrollController;
  const CalendarDialogFilledSlot({
    super.key,
    required this.scrollController,
  });

  @override
  State<CalendarDialogFilledSlot> createState() =>
      _CalendarDialogFilledSlotState();
}

class _CalendarDialogFilledSlotState extends State<CalendarDialogFilledSlot> {
  int selectedAppointmentStatusIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
            color: const Color(0xFF64B5FB).withOpacity(0.11),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF6D018C),
                radius: 18,
                child: Text(
                  "PN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Jane Smith (F)",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "New consultation",
                    style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    "Mon, April 16, 2023 at 6:00 PM",
                    style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                child: Image.asset(
                  "assets/calendar_dialog_filled_slot/ic_arrow_right.png",
                  height: 14,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            controller: widget.scrollController,
            physics: const ClampingScrollPhysics(),
            children: [
              //
              // Appointment Action ////
              //
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: List.generate(AppointmentActionType.values.length,
                      (index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _itemAppointmentAction(
                              AppointmentActionType.values[index],
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                width: 36,
                                height: 36,
                                AppointmentActionType.values[index].iconPath,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppointmentActionType.values[index].name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    AppointmentActionType
                                        .values[index].description,
                                    style: const TextStyle(
                                      color: Color(0Xff999999),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (index != AppointmentActionType.values.length - 1)
                          const Divider(height: 24)
                      ],
                    );
                  }),
                ),
              ),
              //
              // appointment status
              //
              Column(
                children: [
                  Container(
                    height: 54,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: const Color(0xffE0E0E0),
                    child: const Text(
                      "CHANGE APPOINTMENT STATUS",
                      style: TextStyle(
                        color: Color(0Xff000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: List.generate(
                          AppointmentStatusType.values.length, (index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAppointmentStatusIndex = index;
                                });
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppointmentStatusType
                                        .values[index].color,
                                    radius: 16,
                                    child:
                                        selectedAppointmentStatusIndex == index
                                            ? const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 20,
                                              )
                                            : null,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppointmentStatusType
                                            .values[index].name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        AppointmentStatusType
                                            .values[index].description,
                                        style: const TextStyle(
                                          color: Color(0Xff999999),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (index !=
                                AppointmentStatusType.values.length - 1)
                              const Divider(height: 24)
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
              //
              // TASK MANAGEMENT TOOLS
              //
              Column(
                children: [
                  Container(
                    height: 54,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: const Color(0xffE0E0E0),
                    child: const Text(
                      "TASK MANAGEMENT TOOLS",
                      style: TextStyle(
                        color: Color(0Xff000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: List.generate(
                          AppointmentTaskManagementType.values.length, (index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  width: 36,
                                  height: 36,
                                  AppointmentTaskManagementType
                                      .values[index].iconPath,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppointmentTaskManagementType
                                          .values[index].name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      AppointmentTaskManagementType
                                          .values[index].description,
                                      style: const TextStyle(
                                        color: Color(0Xff999999),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (index !=
                                AppointmentTaskManagementType.values.length - 1)
                              const Divider(height: 24)
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
              //
              //// Button
              //
              Container(
                padding: const EdgeInsets.all(20),
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
                        text: 'Checkout',
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
      ],
    );
  }

  void _itemAppointmentAction(AppointmentActionType type) {
    switch (type) {
      case AppointmentActionType.edit:
        break;
      case AppointmentActionType.move:
        break;
      case AppointmentActionType.reschedule:
        break;
      case AppointmentActionType.doubleBook:
        break;
      default:
    }
  }
}
