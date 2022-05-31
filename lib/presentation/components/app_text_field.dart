import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onSuffixTap;
  const AppTextField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 19, right: 19, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: Color(0xFFA5A5A5),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                    hintStyle: const TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                    hintText: hintText,
                    border: InputBorder.none,
                    icon: prefixIcon,
                  ),
                ),
              ),
              suffixIcon != null
                  ? InkWell(
                      onTap: () {
                        if (onSuffixTap != null) {
                          onSuffixTap!();
                        }
                      },
                      child: suffixIcon!,
                    )
                  : SizedBox()
            ],
          )
        ],
      ),
    );
  }
}
