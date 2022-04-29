import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_screens/ui/components/_components.dart';
import 'package:test_screens/ui/constants/_constants.dart';
import 'package:test_screens/ui/controllers/first_page_controller.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstPageController>(builder: (ctrl) {
      return SafeArea(
        child: Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              ctrl.closeCheckout();
              return true;
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.droPurple,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Row(
                    children: [
                      const XMargin(30),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: AppColors.white,
                              size: 20.sp,
                            ),
                            const XMargin(5),
                            Text(
                              "Bag",
                              style: AppTextStyles.kTextStyle(
                                15,
                                weight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: Text(
                          "${ctrl.cart.length}",
                          style: AppTextStyles.kTextStyle(
                            15,
                            weight: FontWeight.normal,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const YMargin(20),
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Tap on an item for add, remove, delete options",
                      style: AppTextStyles.kTextStyle(
                        13,
                        weight: FontWeight.w600,
                        color: AppColors.droTurqoise,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: ctrl.cart.length,
                      padding: const EdgeInsets.all(20),
                      separatorBuilder: (context, index) => const YMargin(10),
                      itemBuilder: (context, index) {
                        final _data = ctrl.cart[index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: (() => ctrl.toggleSelected(_data)),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25.r,
                                    backgroundColor: AppColors.white,
                                    backgroundImage:
                                        Image.network(_data.image).image,
                                  ),
                                  const XMargin(10),
                                  Text(
                                    "${_data.count}X",
                                    style: AppTextStyles.kTextStyle(
                                      13,
                                      weight: FontWeight.normal,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  const XMargin(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _data.name,
                                        style: AppTextStyles.kTextStyle(
                                          15,
                                          weight: FontWeight.w500,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        _data.type,
                                        style: AppTextStyles.kTextStyle(
                                          13,
                                          weight: FontWeight.normal,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    "N${_data.totalPrice}",
                                    style: AppTextStyles.kTextStyle(
                                      15,
                                      weight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _data.isSelected,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete_outlined),
                                    color: AppColors.white,
                                    iconSize: 20.sp,
                                    onPressed: () => ctrl.removeFromBag(_data),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => ctrl.decrementCount(_data),
                                    child: const CircleAvatar(
                                      child: Icon(Icons.remove),
                                      backgroundColor: AppColors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.sp),
                                    child: Text(
                                      _data.count.toString(),
                                      style: AppTextStyles.kTextStyle(
                                        18,
                                        weight: FontWeight.w600,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => ctrl.incrementCount(_data),
                                    child: const CircleAvatar(
                                      child: Icon(Icons.add),
                                      backgroundColor: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          "Total",
                          style: AppTextStyles.kTextStyle(
                            17,
                            weight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "N${ctrl.bagTotal}",
                          style: AppTextStyles.kTextStyle(
                            17,
                            weight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppButton(
                    label: "Checkout",
                    width: 250,
                    height: 50,
                    buttonColor: AppColors.white,
                    labelColor: AppColors.darkPurple,
                    borderRadius: 50,
                    onTap: () {},
                  ),
                  const YMargin(20),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
