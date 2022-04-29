import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_screens/ui/constants/_constants.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final double? width, height, borderRadius;
  final double? horizPad, vertPad;
  final Color? buttonColor;
  final String label;
  final Color? labelColor, loaderColor, borderColor;
  final bool hasShadow, hasBorder, isBusy, hasGradient;
  final FontWeight fontWeight;
  final Widget? icon;
  const AppButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.icon,
    this.buttonColor = AppColors.droPurple,
    required this.label,
    this.labelColor = AppColors.white,
    this.loaderColor = AppColors.white,
    this.borderColor,
    this.hasShadow = false,
    this.hasBorder = false,
    this.isBusy = false,
    this.hasGradient = false,
    this.fontWeight = FontWeight.w600,
    this.borderRadius,
    this.horizPad,
    this.vertPad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w ?? 335.w,
      height: height?.h ?? 51.h,
      child: MaterialButton(
        onPressed: onTap,
        color: buttonColor,
        elevation: hasShadow ? 5 : 0,
        padding: EdgeInsets.zero,
        disabledColor: buttonColor?.withOpacity(0.5),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 10.r),
          side: hasBorder
              ? BorderSide(
                  color: borderColor ?? Colors.grey[400]!,
                  width: 2.r,
                )
              : BorderSide.none,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: hasGradient
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.2, 0.8],
                    tileMode: TileMode.decal,
                    colors: [
                      AppColors.white.withOpacity(0.15),
                      AppColors.black.withOpacity(0.15),
                    ],
                  )
                : null,
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizPad?.w ?? 25.w,
                vertical: vertPad?.h ?? 15.h,
              ),
              child: Visibility(
                visible: !isBusy,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // if (icon != null) const Spacer(flex: 3),
                    if (icon != null)
                      Container(
                        padding: const EdgeInsets.only(right: 5),
                        child: icon,
                      ),
                    if (icon != null) const XMargin(15),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.kTextStyle(
                        16,
                        height: 19.2,
                        weight: FontWeight.bold,
                        color: labelColor,
                      ),
                    ),
                    // if (icon != null) const Spacer(flex: 3),
                  ],
                ),
                replacement: CircularProgressIndicator(
                  color: loaderColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
