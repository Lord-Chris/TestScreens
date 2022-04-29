import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_screens/models/med_model.dart';
import 'package:test_screens/ui/components/_components.dart';
import 'package:test_screens/ui/constants/_constants.dart';
import 'package:test_screens/ui/controllers/first_page_controller.dart';
import 'package:test_screens/ui/views/checkout.dart';

class SecondPage extends StatelessWidget {
  final MedModel medsModel;
  const SecondPage({
    Key? key,
    required this.medsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstPageController>(
      builder: (ctrl) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: const BackButton(
                color: AppColors.black,
              ),
              actions: [
                InkWell(
                  onTap: () => Get.to(() => const Checkout()),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    padding: EdgeInsets.all(7.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.droPurple,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shopping_bag_outlined,
                        ),
                        const XMargin(5),
                        Text(
                          "${ctrl.cart.length}",
                          style: const TextStyle(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      child: Image.network(
                        medsModel.image,
                        height: 200.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const YMargin(30),
                  Text(
                    medsModel.name,
                    style: AppTextStyles.kTextStyle(
                      20,
                      weight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "${medsModel.type} - ${medsModel.dosage}mg",
                    style: AppTextStyles.kTextStyle(
                      17,
                      weight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const YMargin(20),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColors.grey,
                      ),
                      const XMargin(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SOLD BY",
                            style: AppTextStyles.kTextStyle(
                              12,
                              weight: FontWeight.w600,
                              color: AppColors.grey,
                            ),
                          ),
                          Text(
                            "Emzor Pharmaceuticals",
                            style: AppTextStyles.kTextStyle(
                              14,
                              weight: FontWeight.w600,
                              color: AppColors.droTurqoise,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const YMargin(20),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.lightGrey,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              color: AppColors.grey,
                              onPressed: () => ctrl.decrementCount(medsModel),
                            ),
                            Text(
                              medsModel.count.toString(),
                              style: AppTextStyles.kTextStyle(
                                18,
                                weight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () => ctrl.incrementCount(medsModel),
                              icon: const Icon(Icons.add),
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ),
                      const XMargin(10),
                      Text(
                        "Pack(s)",
                        style: AppTextStyles.kTextStyle(
                          14,
                          weight: FontWeight.normal,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      const Spacer(),
                      Text.rich(
                        TextSpan(
                          text: "N",
                          style: AppTextStyles.kTextStyle(
                            8,
                            weight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          children: [
                            TextSpan(
                              text: (medsModel.totalPrice).toString(),
                              style: AppTextStyles.kTextStyle(
                                17,
                                weight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const YMargin(20),
                  Text(
                    "PRODUCT DETAILS",
                    style: AppTextStyles.kTextStyle(
                      15,
                      weight: FontWeight.w600,
                      color: AppColors.grey,
                    ),
                  ),
                  const YMargin(20),
                  Row(
                    children: const [
                      ProductDetail(
                        icon: Icons.link,
                        title: "PACK SIZE",
                        body: "3x10",
                      ),
                      Spacer(),
                      ProductDetail(
                        icon: Icons.qr_code_scanner_rounded,
                        title: "PRODUCT ID",
                        body: "ewf65af68",
                      ),
                      Spacer(),
                    ],
                  ),
                  const YMargin(10),
                  ProductDetail(
                    icon: Icons.link,
                    title: "CONSTITUENTS",
                    body: medsModel.tag,
                  ),
                  const YMargin(10),
                  ProductDetail(
                    icon: Icons.link,
                    title: "PRESCRIBED IN",
                    body: medsModel.type,
                  ),
                  const YMargin(20),
                  Center(
                    child: Text(
                      "1 pack of Garlic contains 3 units of 10 Tablet(s)",
                      style: AppTextStyles.kTextStyle(
                        13,
                        weight: FontWeight.normal,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const YMargin(10),
                  Center(
                    child: AppButton(
                      label: "Add to bag",
                      height: 50,
                      width: 200,
                      icon: Image.asset(
                        AppAssets.bag,
                        color: AppColors.white,
                      ),
                      onTap: () {
                        ctrl.addToBag(medsModel);
                        Get.dialog(SuccessDialog(medsModel: medsModel));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    Key? key,
    required this.medsModel,
  }) : super(key: key);

  final MedModel medsModel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 300.h,
        width: 250.w,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 40.h,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const YMargin(20),
                    Text(
                      "Succesful",
                      style: AppTextStyles.kTextStyle(
                        20,
                        weight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    const YMargin(20),
                    Text(
                      "${medsModel.name} has been added to your bag",
                      style: AppTextStyles.kTextStyle(
                        13,
                        weight: FontWeight.normal,
                        color: AppColors.black,
                      ),
                    ),
                    const YMargin(20),
                    AppButton(
                      label: "View Bag",
                      height: 50,
                      width: 200,
                      borderRadius: 0,
                      buttonColor: AppColors.droTurqoise,
                      onTap: () => Get.off(() => const Checkout()),
                    ),
                    const YMargin(10),
                    AppButton(
                      label: "Done",
                      height: 50,
                      width: 200,
                      borderRadius: 0,
                      buttonColor: AppColors.droTurqoise,
                      onTap: () => Get.back(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 40.sp,
                child: CircleAvatar(
                  backgroundColor: AppColors.droTurqoise,
                  radius: 30.sp,
                  child: Icon(
                    Icons.done,
                    size: 30.sp,
                    color: AppColors.white,
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

class ProductDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const ProductDetail({
    Key? key,
    required this.icon,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.droPurple,
        ),
        const XMargin(5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.kTextStyle(
                12,
                weight: FontWeight.w600,
                color: AppColors.grey,
              ),
            ),
            Text(
              body,
              style: AppTextStyles.kTextStyle(
                13,
                weight: FontWeight.w600,
                color: AppColors.droTurqoise,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
