import 'package:charity_cashier/common/constants/app_colors.dart';
import 'package:charity_cashier/common/constants/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F4F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Alief",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Powered by Progrity.id",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteConstants.cart);
          },
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: const Color(0xff000072),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Text(
                  "0 Item",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  "Rp 0",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 8.r,
              horizontal: 16.w,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xffC8BDD0),
                ),
                suffixIcon: const Icon(
                  Icons.qr_code_scanner,
                  color: Color(0xffC8BDD0),
                ),
                fillColor: Colors.white,
                hintText: "Find product or items",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 30.h, minWidth: 1.sw),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: 8.r,
                horizontal: 16.w,
              ),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  2,
                  (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 4.w),
                      child: Chip(
                        label: Text(
                          "All Products",
                          style: TextStyle(
                            color: index == 0 ? Colors.white : null,
                          ),
                        ),
                        backgroundColor: index == 0 ? AppColors.blue : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            child: const Text("Select Menu"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Wrap(
              runSpacing: 16.h,
              spacing: 8.w,
              children: List.generate(
                4,
                (index) {
                  return Container(
                    width: 158.w,
                    height: 232.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.025),
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          child: Container(
                            width: 162.w,
                            height: 121.h,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Minyak Goreng 1 L",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp 25.000",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 1.sw,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text("Add"),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
