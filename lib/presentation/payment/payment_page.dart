import 'package:charity_cashier/common/constants/app_colors.dart';
import 'package:charity_cashier/common/extensions/string.dart';
import 'package:charity_cashier/presentation/payment/bloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/route_constant.dart';
import '../../common/di_module/app_module.dart';
import 'payment_success_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var controller = MoneyMaskedTextController(
      initialValue: 0, leftSymbol: "Rp ", precision: 0, decimalSeparator: "");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentBloc>()..add(PaymentStarted()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<PaymentBloc, PaymentState>(
            listener: (context, state) {
              if (state.totalPayment != controller.numberValue.toInt()) {
                controller.updateValue(state.totalPayment.toDouble());
              }
            },
          ),
          BlocListener<PaymentBloc, PaymentState>(
            listenWhen: (prev, next) {
              return prev.status != next.status;
            },
            listener: (context, state) {
              if (state.status == PaymentStatus.loadingDialog) {
                EasyLoading.show(status: "Loading...");
              } else if (state.status == PaymentStatus.failureCreate) {
                EasyLoading.showError("Gagal create transaksi");
              } else if (state.status == PaymentStatus.successCreate) {
                EasyLoading.dismiss();
                Navigator.pushNamed(context, RouteConstants.paymentSuccess,
                    arguments: PaymentSuccessArg(
                        state.totalOrder, state.totalPayment));
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: const Color(0xffF2F4F6),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.black),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                width: 34.r,
                height: 34.r,
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
            title: const Text(
              "Select Payment",
              style: TextStyle(color: Colors.black),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            child: BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: state.totalPayment >= state.totalOrder
                      ? () {
                          context.read<PaymentBloc>().add(PaymentAccepted());
                        }
                      : null,
                  child: Text(
                    "Accept",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          body: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              if (state.status == PaymentStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Pilih Nominal Pembayaran"),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        context.read<PaymentBloc>().add(PaymentNominalChanged(
                            controller.numberValue.toInt()));
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
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
                    SizedBox(height: 16.h),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 50,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: state.suggestPayment.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              context.read<PaymentBloc>().add(
                                  PaymentNominalChanged(
                                      state.suggestPayment[index]));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: state.totalPayment ==
                                          state.suggestPayment[index]
                                      ? AppColors.primary
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                state.suggestPayment[index]
                                    .toString()
                                    .toCurrencyFormatted(),
                                style: TextStyle(
                                  color: state.totalPayment ==
                                          state.suggestPayment[index]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
