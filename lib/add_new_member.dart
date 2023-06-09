import 'package:example_ui/model/member_info_action_type.dart';
import 'package:example_ui/widgets/button_base.dart';
import 'package:example_ui/widgets/switch_base.dart';
import 'package:example_ui/widgets/text_field_base.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class AddNewMember extends StatefulWidget {
  const AddNewMember({super.key});

  @override
  State<AddNewMember> createState() => _AddNewMemberState();
}

class _AddNewMemberState extends State<AddNewMember> {
  var genderSelected = Gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //header//
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: const Color(0xff3B0168),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Column(
                    children: [
                      Image.asset(
                        width: 38,
                        height: 38,
                        "assets/ic_logo.png",
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "New Member",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    width: 34,
                    height: 34,
                    "assets/add_new_appointment/ic_close.png",
                  )
                ],
              ),
            ),
            // body
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            width: 32,
                            height: 32,
                            "assets/add_new_member/ic_person.png",
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Add",
                            style: TextStyle(
                              color: Color(0xff2C74B3),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(18),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0),
                          ),
                          color: Color(0xffF8F8F8),
                        ),
                        child: const Text(
                          "Personal information",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const Divider(
                          height: 0, thickness: 1, color: Color(0xffE0E0E0)),
                      const TextFieldBase(hintText: "Enter first name*"),
                      const SizedBox(height: 10),
                      const TextFieldBase(hintText: "Enter last name*"),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Gender",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: List.generate(2, (index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Radio(
                                      activeColor: const Color(0xff6D018C),
                                      value: Gender.values[index],
                                      groupValue: genderSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          genderSelected = value!;
                                        });
                                      },
                                      visualDensity:
                                          const VisualDensity(horizontal: -4),
                                    ),
                                    Text(
                                      Gender.values[index] == Gender.male
                                          ? "Male"
                                          : "Female",
                                      style: const TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10)
                                  ],
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        color: const Color(0xffF8F8F8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            _DateSelectedDropdown(
                              hint: "Month",
                            ),
                            _DateSelectedDropdown(
                              hint: "Day",
                            ),
                            _DateSelectedDropdown(
                              hint: "Year",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const _PhoneNumberTextFieldWidget(
                        hintText: "Mobile",
                      ),
                      const SizedBox(height: 10),
                      const _PhoneNumberTextFieldWidget(
                        hintText: "Work",
                      ),
                      const SizedBox(height: 10),
                      const _PhoneNumberTextFieldWidget(
                        hintText: "Home",
                      ),
                      const SizedBox(height: 10),
                      const TextFieldBase(
                        hintText: "Email",
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        color: const Color(0xff64B5FB).withOpacity(0.11),
                        child: const Text(
                          "APPOINTMENT REMINDERS",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFieldBase(
                        hintText: "Send email copy",
                        readOnly: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            width: 9,
                            height: 9,
                            "assets/add_new_appointment/ic_arrow_right.png",
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        color: const Color(0xffF8F8F8),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              width: 10,
                              height: 6,
                              "assets/add_new_appointment/ic_arrow_down.png",
                            ),
                          ),
                          underline: Container(),
                          items: null,
                          hint: const Text(
                            "Online booking",
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      _MemberInfoSwitchWidget(
                        text: "SMS Text",
                        onChanged: (value) {},
                        value: true,
                      ),
                      const Divider(height: 0),
                      _MemberInfoSwitchWidget(
                        text: "Email",
                        onChanged: (value) {},
                        value: false,
                      ),
                      const Divider(height: 0),
                      _MemberInfoSwitchWidget(
                        text: "Push notification",
                        onChanged: (value) {},
                        value: true,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border:
                              Border.all(color: Color(0xffE0E0E0), width: 0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Member since",
                              style: TextStyle(
                                color: Color(0xff3A1078),
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "September 20, 2022",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xffF0F0F0),
                        child: Column(
                          children: List.generate(
                            MemberInfoActionType.values.length,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  // _itemAction(
                                  // MemberInfoActionType.values[index],
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            MemberInfoActionType
                                                .values[index].name,
                                            style: const TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Image.asset(
                                            width: 9,
                                            height: 9,
                                            "assets/add_new_appointment/ic_arrow_right.png",
                                          )
                                        ],
                                      ),
                                    ),
                                    if (index !=
                                        MemberInfoActionType.values.length - 1)
                                      const Divider(
                                        height: 0,
                                        color: Color(0xffC0C0C0),
                                      )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      //
                      //// Button
                      //
                      Container(
                        padding: const EdgeInsets.all(15),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberInfoSwitchWidget extends StatelessWidget {
  final String text;
  final Function(bool) onChanged;
  final bool value;
  const _MemberInfoSwitchWidget(
      {required this.text, required this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SwitchBase(
            onChanged: onChanged,
            value: value,
          )
        ],
      ),
    );
  }
}

class _PhoneNumberTextFieldWidget extends StatelessWidget {
  final String hintText;
  const _PhoneNumberTextFieldWidget({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFieldBase(
      prefixIcon: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton(
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  width: 10,
                  height: 6,
                  "assets/add_new_member/ic_arrow_down_filled.png",
                ),
              ),
              underline: Container(),
              items: null,
              hint: Image.asset(
                width: 25,
                height: 16,
                "assets/add_new_member/ic_american_flag.png",
              ),
              onChanged: (value) {},
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "+1",
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
      hintText: hintText,
    );
  }
}

class _DateSelectedDropdown extends StatelessWidget {
  final String hint;
  const _DateSelectedDropdown({required this.hint});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          width: 9,
          height: 9,
          "assets/add_new_appointment/ic_arrow_down.png",
        ),
      ),
      underline: Container(),
      items: null,
      hint: Text(
        hint,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
      ),
      onChanged: (value) {},
    );
  }
}
