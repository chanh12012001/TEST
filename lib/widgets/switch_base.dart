import 'package:flutter/material.dart';

class SwitchBase extends StatefulWidget {
  final void Function(bool isToggled) onChanged;
  final bool value;

  const SwitchBase({Key? key, required this.onChanged, required this.value})
      : super(key: key);

  @override
  State<SwitchBase> createState() => _SwitchBaseState();
}

class _SwitchBaseState extends State<SwitchBase> {
  double size = 26;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      onPanEnd: (b) {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        height: size,
        width: size * 1.6,
        padding: EdgeInsets.all(innerPadding),
        alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: widget.value ? const Color(0xff6D018C) : Color(0xffE0E0E0),
        ),
        child: Container(
          width: size - innerPadding * 2 - 1,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xffffffff),
          ),
          child: widget.value
              ? Image.asset(
                  scale: 2,
                  "assets/add_new_member/ic_check.png",
                )
              : null,
        ),
      ),
    );
  }
}
