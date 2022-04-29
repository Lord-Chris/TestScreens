import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_screens/ui/components/_components.dart';
import 'package:test_screens/ui/constants/_constants.dart';
import 'package:test_screens/ui/views/second_page.dart';

import '../controllers/first_page_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstPageController>(
      init: FirstPageController(),
      builder: (ctrl) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              leading: const BackButton(color: AppColors.black),
              backgroundColor: AppColors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "${ctrl.filteredList.length} item(s)",
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.lightGrey.withOpacity(0.5),
                        child: const Icon(
                          Icons.transfer_within_a_station,
                          color: AppColors.grey,
                        ),
                      ),
                      const XMargin(30),
                      CircleAvatar(
                        backgroundColor: AppColors.lightGrey.withOpacity(0.5),
                        child: const Icon(
                          Icons.filter_alt_outlined,
                          color: AppColors.grey,
                        ),
                      ),
                      const XMargin(30),
                      InkWell(
                        onTap: () => ctrl.toggleTextField(),
                        child: CircleAvatar(
                          backgroundColor: AppColors.lightGrey.withOpacity(0.5),
                          child: const Icon(
                            Icons.search,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const YMargin(10),
                  Visibility(
                    visible: ctrl.showTextField,
                    child: AppTextField(
                      prefix: const Icon(Icons.search),
                      onChanged: ctrl.filterList,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const YMargin(15),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6.sp,
                      ),
                      padding: EdgeInsets.only(bottom: 50.h),
                      itemCount: ctrl.filteredList.length,
                      itemBuilder: (__, index) {
                        final _data = ctrl.filteredList[index];
                        return InkWell(
                          onTap: () =>
                              Get.to(() => SecondPage(medsModel: _data)),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const YMargin(10),
                                Expanded(
                                  child: Center(
                                    child: Image.network(
                                      _data.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const YMargin(30),
                                Text(
                                  _data.name,
                                  style: AppTextStyles.kTextStyle(
                                    17,
                                    weight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                ),
                                const YMargin(2),
                                Text(
                                  _data.tag,
                                  style: AppTextStyles.kTextStyle(
                                    15,
                                    weight: FontWeight.normal,
                                    color: AppColors.grey,
                                  ),
                                ),
                                const YMargin(2),
                                Text(
                                  "${_data.type} - ${_data.dosage}mg",
                                  style: AppTextStyles.kTextStyle(
                                    15,
                                    weight: FontWeight.normal,
                                    color: AppColors.grey,
                                  ),
                                ),
                                const YMargin(5),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Text(
                                      "N${_data.price}",
                                      style: AppTextStyles.kTextStyle(
                                        15,
                                        weight: FontWeight.normal,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: Container(
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
                      Flexible(
                          child: Row(
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            color: AppColors.white,
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
                      )),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
