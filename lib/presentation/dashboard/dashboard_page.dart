import 'package:charity_cashier/common/constants/app_colors.dart';
import 'package:charity_cashier/common/constants/route_constant.dart';
import 'package:charity_cashier/common/extensions/string.dart';
import 'package:charity_cashier/presentation/dashboard/bloc/cart_home/cart_home_bloc.dart';
import 'package:charity_cashier/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/di_module/app_module.dart';
import '../../common/widgets/skeleton.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<DashboardBloc>()..add(DashboardStarted()),
        ),
        BlocProvider(
          create: (context) => sl<CartHomeBloc>()..add(CartHomeStarted()),
        ),
      ],
      child: Scaffold(
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
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return Text(
                    state.user?.name ?? "",
                    style: const TextStyle(color: Colors.black),
                  );
                },
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
          child: const CartHomeWidget(),
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
                child: const CategoryWidget(),
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
              child: const ProductWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class CartHomeWidget extends StatelessWidget {
  const CartHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartHomeBloc, CartHomeState>(
      builder: (context, state) {
        return InkWell(
          onTap: state.listCart.isNotEmpty
              ? () {
                  Navigator.pushNamed(context, RouteConstants.cart);
                }
              : null,
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
                  "${state.listCart.length} Item",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  state.totalPrice.toString().toCurrencyFormatted(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state.status == DashboardStatus.loading) {
          return Wrap(
            runSpacing: 16.h,
            spacing: 8.w,
            children: List.generate(
              4,
              (index) {
                return Skeleton(
                  width: 158.w,
                  height: 232.h,
                );
              },
            ),
          );
        }

        return Wrap(
          runSpacing: 16.h,
          spacing: 8.w,
          children: List.generate(
            state.listProduct.length,
            (index) {
              final product = state.listProduct[index];

              return Container(
                width: 158.w,
                height: 232.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: product.isSelected
                      ? Border.all(color: AppColors.blue, width: 2)
                      : null,
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
                            product.nama,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            product.harga.toString().toCurrencyFormatted(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          !product.isSelected
                              ? SizedBox(
                                  width: 1.sw,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<DashboardBloc>()
                                          .add(DashboardProductAdded(product));
                                    },
                                    child: const Text("Add"),
                                  ),
                                )
                              : Row(
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          shape: const CircleBorder()),
                                      onPressed: () {
                                        context.read<DashboardBloc>().add(
                                            DashboardProductDecreased(
                                                product.id));
                                      },
                                      child: const Icon(Icons.remove),
                                    ),
                                    Text(product.count.toString()),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          shape: const CircleBorder()),
                                      onPressed: () {
                                        context.read<DashboardBloc>().add(
                                            DashboardProductAdded(product));
                                      },
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state.status == DashboardStatus.loading) {
          return Row(
              children: List.generate(4, (index) {
            return Skeleton(
              width: 80.w,
              height: 28.h,
            );
          }));
        }

        return Row(
          children: List.generate(
            state.listCategory.length + 1,
            (index) {
              return Container(
                margin: EdgeInsets.only(right: 4.w),
                child: Chip(
                  label: Text(
                    index == 0
                        ? "All Products"
                        : state.listCategory[index - 1].nama,
                    style: TextStyle(
                      color: index == 0 ? Colors.white : null,
                    ),
                  ),
                  backgroundColor: index == 0 ? AppColors.blue : null,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
