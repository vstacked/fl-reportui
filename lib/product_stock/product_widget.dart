import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app_f/colors.dart';
import 'package:my_app_f/product_stock/stock.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.index, required this.product});
  final int index;
  final ProductMaster product;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final oCcy = NumberFormat("#,##0.00", "en_US");
  final df = DateFormat('dd MMMM yyyy');

  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SizedBox(
              height: 575,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          Text(
                            widget.product.category!,
                            style: TextTheme.of(context).titleMedium?.copyWith(
                              color: AppColors.dark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          SizedBox(
                            height: 150,
                            width: 225,
                            child: Placeholder(),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            widget.product.name!,
                            style: TextTheme.of(
                              context,
                            ).titleMedium?.copyWith(color: AppColors.dark),
                          ),
                          Text(
                            "#${widget.product.productId}",
                            style: TextTheme.of(context).bodySmall?.copyWith(
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Current Stock",
                                    style: TextTheme.of(context).bodyMedium
                                        ?.copyWith(color: AppColors.darkLight),
                                  ),
                                  Text(
                                    "${widget.product.currentStock} ${widget.product.unit}",
                                    style: TextTheme.of(
                                      context,
                                    ).bodyLarge?.copyWith(
                                      color: AppColors.primaryDark,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Minimum Stock",
                                    style: TextTheme.of(context).bodyMedium
                                        ?.copyWith(color: AppColors.darkLight),
                                  ),
                                  Text(
                                    "${widget.product.minStock} ${widget.product.unit}",
                                    style: TextTheme.of(
                                      context,
                                    ).bodyLarge?.copyWith(
                                      color: AppColors.primaryDark,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Column(
                            children: [
                              Text(
                                "Restock Recommendation",
                                style: TextTheme.of(context).bodyMedium
                                    ?.copyWith(color: AppColors.darkLight),
                              ),
                              Text(
                                widget.product.restockRecommendation!,
                                style: TextTheme.of(
                                  context,
                                ).bodyLarge?.copyWith(
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          SizedBox(
                            width: 200,
                            child: const Divider(
                              color: AppColors.border,
                              thickness: 1,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Expiration Date",
                                    style: TextTheme.of(context).bodyMedium
                                        ?.copyWith(color: AppColors.darkLight),
                                  ),
                                  Text(
                                    widget.product.expirationDate != null
                                        ? df.format(
                                          DateTime.parse(
                                            widget.product.expirationDate!,
                                          ),
                                        )
                                        : "-",
                                    style: TextTheme.of(
                                      context,
                                    ).bodyLarge?.copyWith(
                                      color: AppColors.primaryDark,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Text(
                                    "Last Purchase",
                                    style: TextTheme.of(context).bodyMedium
                                        ?.copyWith(color: AppColors.darkLight),
                                  ),
                                  Text(
                                    df.format(
                                      DateTime.parse(
                                        widget.product.lastPurchase!,
                                      ),
                                    ),
                                    style: TextTheme.of(
                                      context,
                                    ).bodyLarge?.copyWith(
                                      color: AppColors.primaryDark,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: SizedBox(
                      height: 60,
                      child: Center(
                        child: ElevatedButton.icon(
                          style: TextButton.styleFrom(
                            textStyle: TextTheme.of(
                              context,
                            ).bodyMedium?.copyWith(color: AppColors.primary),
                          ),
                          icon: const Icon(Icons.close),
                          label: const Text('Close'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: 70,
        width: double.infinity,
        color: AppColors.surface,
        child: Column(
          spacing: 12,
          children: [
            Row(
              spacing: 12,
              children: [
                Text(
                  "#${widget.index + 1}",
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: AppColors.primaryLight,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 3,
                        children: [
                          Text(
                            widget.product.name!,
                            style: TextTheme.of(context).bodyMedium?.copyWith(
                              color: AppColors.dark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Text(
                            "#${widget.product.productId}",
                            style: TextTheme.of(context).bodySmall?.copyWith(
                              color: AppColors.primaryLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${widget.product.category}",
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
                    Text(
                      df.format(DateTime.parse(widget.product.lastPurchase!)),
                      style: TextTheme.of(context).bodySmall?.copyWith(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Divider(color: AppColors.border, height: 1),
          ],
        ),
      ),
    );
  }
}
