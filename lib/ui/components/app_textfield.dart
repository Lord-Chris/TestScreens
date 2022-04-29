import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_screens/ui/constants/_constants.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final Widget? prefix;
  final bool readOnly;
  final bool expands;
  final int? minLines, maxLines, maxLength;
  final bool enabled;
  final Color? fillColor;

  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.prefix,
    this.initialValue,
    this.onChanged,
    this.readOnly = false,
    this.expands = false,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.enabled = true,
    this.fillColor,
  })  : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      cursorColor: AppColors.darkPurple,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      expands: expands,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        suffixIcon: suffix,
        prefixIcon: prefix,
        filled: true,
        enabled: enabled,
        fillColor: fillColor ?? (enabled ? AppColors.white : AppColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
            width: 1,
          ),
        ),
        labelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: AppColors.lightGrey,
            ),
        hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: AppColors.lightGrey,
            ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
