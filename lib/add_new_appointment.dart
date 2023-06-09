import 'package:example_ui/model/appointment_type.dart';
import 'package:example_ui/widgets/button_base.dart';
import 'package:flutter/material.dart';

class AddNewAppointment extends StatelessWidget {
  const AddNewAppointment({super.key});

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
                        "New appointment",
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
            // search widget
            Container(
              color: const Color(0xffF8F8F8),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: const _SearchWidget(
                hintText: "Name, phone, email, chart no ...",
              ),
            ),
            const Divider(color: Color(0xffC0C0C0), height: 0, thickness: 1),
            // body
            const Expanded(
              child: SingleChildScrollView(child: _AppointmentForm()),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppointmentForm extends StatefulWidget {
  const _AppointmentForm();

  @override
  State<_AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<_AppointmentForm> {
  AppointmentType appointmentTypeSelected = AppointmentType.inPerson;
  @override
  Widget build(BuildContext context) {
    var dateController = TextEditingController(text: "May 5, 2023  12:45 PM");

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 51,
          color: const Color(0xff64B5FB).withOpacity(0.11),
          child: const Text(
            "Dr. Williams Qunbetique",
            style: TextStyle(
              color: Color(0xff999999),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          color: const Color(0xffffffff),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              _AppointmentInfoTextField(
                controller: dateController,
                name: "Date",
                hintText: "",
                readOnly: true,
              ),
              _dividerWidget(),
              ////
              // appoint type
              ///
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children:
                      List.generate(AppointmentType.values.length, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio(
                          activeColor: const Color(0xff6D018C),
                          value: AppointmentType.values[index],
                          groupValue: appointmentTypeSelected,
                          onChanged: (value) {
                            setState(() {
                              appointmentTypeSelected = value!;
                            });
                          },
                          visualDensity: const VisualDensity(horizontal: -4),
                        ),
                        Text(
                          AppointmentType.values[index].name,
                          style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              Container(
                color: const Color(0xffF8F8F8),
                padding: const EdgeInsets.all(10),
                child: const _SearchWidget(
                  hintText: "Type of services, CPT codes ...",
                ),
              ),
              const _AppointmentInfoTextField(
                name: "Fees or price",
                hintText: "\$ 0",
              ),
              _dividerWidget(),
              const _AppointmentInfoTextField(
                name: "CPT code",
                hintText: "91322",
              ),
              _dividerWidget(),
              const _AppointmentInfoTextField(
                name: "Duration",
                hintText: "0hr 0min",
              ),
              _dividerWidget(),
              const _AppointmentInfoTextField(
                name: "Reason",
                hintText: "0/100 characters",
                maxLine: 3,
              ),
              _dividerWidget(),
              const _ItemInfoButton(
                name: "Payment types",
                isArrowRightButton: false,
              ),
              _dividerWidget(),
              const _ItemInfoButton(
                name: "Visit type",
                isArrowRightButton: false,
              ),
              const _ItemInfoButton(
                name: "Repeat",
                value: Text(
                  "Off",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              _dividerWidget(),
              _ItemInfoButton(
                name: "Given deposit",
                value: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "% Calculation",
                        style: TextStyle(
                          color: Color(0xff0880E8),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "\$ 0",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _dividerWidget(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: 32,
                      height: 32,
                      "assets/add_new_appointment/ic_add_appointment_file.png",
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Upload appointment files.",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const _ItemInfoButton(name: "Chart notes"),
              _dividerWidget(),
              const _ItemInfoButton(name: "Card on file"),
              _dividerWidget(),
              const _ItemInfoButton(name: "Insurance on file"),
              _dividerWidget(),
              //
              //// Button
              //
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                        text: 'Book appointment',
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

  Divider _dividerWidget() =>
      const Divider(color: Color(0xffC0C0C0), height: 0, thickness: 1);
}

class _AppointmentInfoTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String name;
  final String hintText;
  final bool readOnly;
  final int? maxLine;
  const _AppointmentInfoTextField(
      {required this.name,
      required this.hintText,
      this.controller,
      this.readOnly = false,
      this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment:
            maxLine != 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            height: 35,
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
          Flexible(
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
          )
        ],
      ),
    );
  }
}

class _ItemInfoButton extends StatelessWidget {
  final String name;
  final bool isArrowRightButton;
  final Widget? value;
  const _ItemInfoButton(
      {required this.name, this.value, this.isArrowRightButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 10),
          value ??
              Image.asset(
                width: 9,
                height: 9,
                isArrowRightButton == false
                    ? "assets/add_new_appointment/ic_arrow_down.png"
                    : "assets/add_new_appointment/ic_arrow_right.png",
              )
        ],
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  final String hintText;
  const _SearchWidget({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          width: 34,
          height: 34,
          "assets/add_new_appointment/ic_add_search.png",
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            // controller: controller,
            // style: TextStyleApp.inter_s16_w6_r_black1f.style,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xff999999),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              border: InputBorder.none,
              prefixIcon: Container(
                  margin: const EdgeInsets.all(12),
                  child: Image.asset(
                    "assets/add_new_appointment/ic_search.png",
                    width: 16,
                    height: 16,
                  )),
            ),
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(
          width: 34,
          height: 34,
          "assets/add_new_appointment/ic_edit_search.png",
        ),
      ],
    );
  }
}
