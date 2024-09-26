import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.icon,
    required this.hint,
    required this.labelText,
    this.obscure = false,
    this.textEditingController,
    this.validator,
    this.inputType,
    this.suffixIcon,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.numberOfLines,
    this.isEnable = true,
    this.onFieldSubmitted,
    this.isReadOnly = false,
    this.isField = false,
    this.onLeadingTap,
    this.fillColor,
    this.radius,
    this.contentPadding,
    this.isRegister = false,
    this.prefix,
  }) : super(key: key);
  final IconData? icon;
  final Widget? prefix;
  final String hint;
  final String labelText;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  final int? numberOfLines;
  final void Function()? onTap;
  final void Function()? onLeadingTap;
  final FocusNode? focusNode;
  final bool isEnable;
  final void Function(String)? onFieldSubmitted;
  final bool isReadOnly;
  final bool isField;
  final Color? fillColor;
  final double? radius;
  final EdgeInsetsGeometry? contentPadding;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: Color.fromARGB(255, 179, 92, 121),
            fontSize: 15.sp,
          ),
      obscureText: obscure,
      enabled: isEnable,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: isReadOnly,
      maxLines: numberOfLines ?? 1,
      cursorColor: isRegister ? AppColors.primaryColor : AppColors().white,
      keyboardType: inputType,
      decoration: InputDecoration(
          fillColor: fillColor ?? AppColors().grey,
          enabled: isEnable,
          filled: isField,
          suffixIcon: suffixIcon,
          // prefixIcon: Icon(Icon(color: ,))
          prefixIcon: prefix ??
              (icon != null ? Icon(icon, color: AppColors().grey) : null),
          contentPadding: contentPadding ??
              const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
          iconColor: AppColors.primaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,

          // hintStyle: const TextStyle(color: Colors.black),
          hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.black26,
              // color: isRegister ? AppColors.primaryColor : AppColors().white,
              fontSize: 12.sp),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                labelText,
                style: const TextStyle(color: AppColors.primaryColor),
              )),
          // focusColor: Colors.black26,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColors.primaryColor)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isRegister
                      ? AppColors.primaryColor
                      : AppColors().white.withOpacity(0.7))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors().red)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColors.primaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  style: BorderStyle.solid, color: Colors.black38
                  // color: isRegister
                  //     ? AppColors.primaryColor
                  //     : AppColors().white.withOpacity(0.7)
                  ))),
    );
  }
}
