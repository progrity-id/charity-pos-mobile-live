import 'package:charity_cashier/common/constants/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F4F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 34.r,
            height: 34.r,
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text(
          "Detail Order",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          const Text(
            "Customer Information",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(10.r)),
            child: Text(
              "INV-12312-123",
              style: const TextStyle(color: Color(0xffA4A4A4)),
            ),
          ),
          SizedBox(height: 8.h),
          const Text(
            "Current Order",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(10.r),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                )
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 8.w),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    width: 75.r,
                    height: 75.r,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 60.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bulog 10Kg"),
                        Text("Rp 65.000"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Row(
                  children: [
                    Container(
                      width: 28.r,
                      height: 28.r,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEEEEEE),
                          ),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.remove),
                    ),
                    SizedBox(width: 4.w),
                    Text("1"),
                    SizedBox(width: 4.w),
                    Container(
                      width: 28.r,
                      height: 28.r,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEEEEEE),
                          ),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                )
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 8.w),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    width: 75.r,
                    height: 75.r,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 60.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bulog 10Kg"),
                        Text("Rp 65.000"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Row(
                  children: [
                    Container(
                      width: 28.r,
                      height: 28.r,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEEEEEE),
                          ),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.remove),
                    ),
                    SizedBox(width: 4.w),
                    Text("1"),
                    SizedBox(width: 4.w),
                    Container(
                      width: 28.r,
                      height: 28.r,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEEEEEE),
                          ),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                )
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 8.w),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    width: 75.r,
                    height: 75.r,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 60.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bulog 10Kg"),
                        Text("Rp 65.000"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Row(
                  children: [
                    Container(
                      width: 28.r,
                      height: 28.r,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEEEEEE),
                          ),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.remove),
                    ),
                    SizedBox(width: 4.w),
                    Text("1"),
                    SizedBox(width: 4.w),
                    Container(
                      width: 28.r,
                      height: 28.r,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEEEEEE),
                          ),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Text("Order Summary"),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.only(bottom: 8.h),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xffCECECE)),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal"),
                Text("Rp125.000"),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Rp125.000",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 21.h),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteConstants.payment);
            },
            child: Text(
              "Process payment",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffA4A4A4)),
            onPressed: () {},
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
