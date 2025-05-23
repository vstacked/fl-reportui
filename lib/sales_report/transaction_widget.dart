import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app_f/colors.dart';
import 'package:my_app_f/sales_report/transactions.dart' show Transactions;

class Transactionwidget extends StatefulWidget {
  const Transactionwidget({super.key, required this.transaction});
  final Transactions transaction;

  @override
  State<Transactionwidget> createState() => _TransactionwidgetState();
}

class _TransactionwidgetState extends State<Transactionwidget> {
  final oCcy = NumberFormat("#,##0.00", "en_US");

  bool isTapped = false;
  bool animatedText = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isTapped != animatedText) {
          return;
        }

        setState(() {
          isTapped = !isTapped;
          if (animatedText) animatedText = false;
        });

        if (isTapped) {
          Future.delayed(const Duration(milliseconds: 300), () {
            setState(() {
              animatedText = !animatedText;
            });
          });
        }
      },
      child: AnimatedContainer(
        height: isTapped ? 275 : 70,
        color: AppColors.surface,
        duration: const Duration(milliseconds: 300),
        child: Column(
          spacing: 12,
          children: [
            Row(
              spacing: 12,
              children: [
                Placeholder(fallbackHeight: 35, fallbackWidth: 35),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.transaction.customerName!,
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: AppColors.dark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${widget.transaction.items!.length} Item(s) • ${widget.transaction.orderTime}",
                        style: TextTheme.of(
                          context,
                        ).bodySmall?.copyWith(color: AppColors.primaryDark),
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    getStatus(widget.transaction.status!),
                    Text(
                      "#${widget.transaction.orderId}",
                      style: TextTheme.of(context).bodySmall?.copyWith(
                        color: AppColors.primaryLight,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            if (animatedText)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                    },
                    children:
                        widget.transaction.items!.map((item) {
                          return TableRow(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name!,
                                    style: TextTheme.of(context).bodyMedium
                                        ?.copyWith(color: AppColors.dark),
                                  ),
                                  Text(
                                    "#${item.itemId}",
                                    style: TextTheme.of(
                                      context,
                                    ).bodySmall?.copyWith(
                                      color: AppColors.primaryLight,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                              Center(
                                child: Text(
                                  "x${item.quantity}",
                                  style: TextTheme.of(
                                    context,
                                  ).bodySmall?.copyWith(color: AppColors.dark),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  oCcy.format(item.price),
                                  style: TextTheme.of(
                                    context,
                                  ).bodySmall?.copyWith(color: AppColors.dark),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                  ),

                  SizedBox(
                    height: 12,
                    child: Divider(color: AppColors.border, height: 1),
                  ),

                  Table(
                    children: [
                      TableRow(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Payment Method",
                                style: TextTheme.of(
                                  context,
                                ).bodySmall?.copyWith(
                                  color: AppColors.darkLight,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.transaction.paymentMethod ?? "-",
                                style: TextTheme.of(
                                  context,
                                ).bodyLarge?.copyWith(
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Total Amount",
                                style: TextTheme.of(
                                  context,
                                ).bodySmall?.copyWith(
                                  color: AppColors.darkLight,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                oCcy.format(widget.transaction.totalAmount),
                                style: TextTheme.of(
                                  context,
                                ).bodyLarge?.copyWith(
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  if (widget.transaction.refundReason != null) ...[
                    SizedBox(
                      height: 12,
                      child: Divider(color: AppColors.border, height: 1),
                    ),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.bottom,
                      children: [
                        TableRow(
                          children: [
                            Text(
                              "Refund Reason",
                              style: TextTheme.of(context).bodyMedium?.copyWith(
                                color: AppColors.refunded,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.transaction.refundReason!,
                              style: TextTheme.of(
                                context,
                              ).bodySmall?.copyWith(color: AppColors.dark),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ],
              ),

            Divider(color: AppColors.border, height: 1),
          ],
        ),
      ),
    );
  }

  Widget getStatus(String status) {
    switch (status) {
      case "Paid":
        return Text(
          status,
          style: TextTheme.of(context).bodySmall?.copyWith(
            color: AppColors.paid,
            fontWeight: FontWeight.w500,
          ),
        );
      case "Pending":
        return Text(
          status,
          style: TextTheme.of(context).bodySmall?.copyWith(
            color: AppColors.pending,
            fontWeight: FontWeight.w500,
          ),
        );
      case "Cancelled":
        return Text(
          status,
          style: TextTheme.of(context).bodySmall?.copyWith(
            color: AppColors.cancelled,
            fontWeight: FontWeight.w500,
          ),
        );
      case "Completed":
        return Text(
          status,
          style: TextTheme.of(context).bodySmall?.copyWith(
            color: AppColors.completed,
            fontWeight: FontWeight.w500,
          ),
        );
      case "Processing":
        return Text(
          status,
          style: TextTheme.of(context).bodySmall?.copyWith(
            color: AppColors.processing,
            fontWeight: FontWeight.w500,
          ),
        );
      case "Refunded":
        return Text(
          status,
          style: TextTheme.of(context).bodySmall?.copyWith(
            color: AppColors.refunded,
            fontWeight: FontWeight.w500,
          ),
        );
      default:
        return Container();
    }
  }
}
