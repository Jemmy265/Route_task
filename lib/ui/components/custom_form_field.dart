import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  var controller = TextEditingController();
  String hintText;
  String labelText;
  TextInputType keyboardType;
  Widget? suffix;
  Widget? prefix;
  int? maxLines;
  Function(String?)? onChang;
  Function()? onTap;
  Function(PointerDownEvent)? onTapOutside;
  Color backgroundColor;
  Color borderSideColor;

  FocusNode? foucusNode;

  CustomFormField({
    super.key,
    required this.controller,
    this.hintText = 'what do you search for?',
    this.labelText = '', this.keyboardType = TextInputType.text,
    this.suffix,
    this.prefix,
    this.foucusNode,
    this.maxLines = 1,
    this.onChang,
    this.onTap,
    this.backgroundColor = const Color(0xffFFFFFF),
    this.borderSideColor = Colors.black,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      maxLines: maxLines,
      onChanged: onChang,
      focusNode: foucusNode,
      controller: controller,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          color: const Color(0xff06004F).withOpacity(0.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xff06004F).withOpacity(0.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: backgroundColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: borderSideColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: borderSideColor, width: 2),
        ),
        suffixIcon: suffix,
        prefixIcon: prefix,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: borderSideColor, width: 2),
        ),
      ),
    );
  }
}