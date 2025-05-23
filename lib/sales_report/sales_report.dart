import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app_f/colors.dart';
import 'package:my_app_f/sales_report/transaction_widget.dart';
import 'package:my_app_f/sales_report/transactions.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({super.key});

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  final df = DateFormat('dd MMMM yyyy');

  final List<Map<String, Object>> data = [
    {
      "title": "Total Costumer",
      "value": "32,502",
      "isProfit": false,
      "percent": "2.5%",
    },
    {
      "title": "Total Order",
      "value": "40,284",
      "isProfit": true,
      "percent": "8.2%",
    },
    {
      "title": "Total Sales",
      "value": "40,284",
      "isProfit": true,
      "percent": "17.2%",
    },
  ];

  late Map<String, List<Transactions>> _transactions;

  @override
  void initState() {
    super.initState();
    _transactions = groupBy(transactions!, (e) => e.orderDate!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              "Sales Report",
              style: TextTheme.of(
                context,
              ).headlineMedium?.copyWith(color: AppColors.dark),
            ),
          ),

          Container(
            height: 75,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: AppColors.border,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$2,347.41",
                      style: TextTheme.of(context).titleLarge?.copyWith(
                        color: AppColors.secondaryDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Total sales of past 6 months",
                      style: TextTheme.of(
                        context,
                      ).labelMedium?.copyWith(color: AppColors.dark),
                    ),
                  ],
                ),
                DropdownButton(
                  items:
                      ["3M", "6M", "9M"].map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextTheme.of(
                              context,
                            ).labelMedium?.copyWith(color: AppColors.dark),
                          ),
                        );
                      }).toList(),
                  value: "6M",
                  dropdownColor: AppColors.surface,
                  underline: SizedBox.shrink(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.darkDarker,
                    size: 15,
                  ),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),

          StockBarChart(),

          SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                padding: const EdgeInsets.all(4),
                itemBuilder: (context, index) {
                  final isProfit = data[index]["isProfit"] as bool;

                  return Container(
                    margin:
                        index == 2
                            ? const EdgeInsets.only(right: 16, left: 10)
                            : index > 0
                            ? const EdgeInsets.only(left: 10)
                            : const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.surface,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.border,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.primaryLight,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Center(
                                child: Icon(
                                  index == 0
                                      ? Icons.people_alt_rounded
                                      : index == 1
                                      ? Icons.shopping_cart_rounded
                                      : Icons.attach_money_rounded,
                                  color: AppColors.secondary,
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              data[index]["title"] as String,
                              style: TextTheme.of(context).titleSmall?.copyWith(
                                color: AppColors.secondaryLight,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          data[index]["value"] as String,
                          style: TextTheme.of(context).headlineMedium?.copyWith(
                            color: AppColors.dark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            isProfit
                                ? Icon(
                                  Icons.arrow_upward_rounded,
                                  color: AppColors.success,
                                  size: 15,
                                )
                                : Icon(
                                  Icons.arrow_downward_rounded,
                                  color: AppColors.error,
                                  size: 15,
                                ),
                            Text(
                              data[index]["percent"] as String,
                              style: TextTheme.of(context).labelLarge?.copyWith(
                                color:
                                    isProfit
                                        ? AppColors.success
                                        : AppColors.error,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              isProfit
                                  ? " greater than last month"
                                  : " less than last month",
                              style: TextTheme.of(context).labelLarge?.copyWith(
                                color: AppColors.secondaryLight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Recent Transactions",
              style: TextTheme.of(
                context,
              ).titleLarge?.copyWith(color: AppColors.dark),
            ),
          ),

          SizedBox(height: 8),

          for (final item in _transactions.entries.sorted(
            (a, b) => b.key.compareTo(a.key),
          ))
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.border,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.key == "2024-03-30"
                        ? "Today"
                        : df.format(DateTime.parse(item.key)),
                    style: TextTheme.of(context).bodyLarge?.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    itemCount: item.value.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Transactionwidget(transaction: item.value[index]);
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class StockBarChart extends StatefulWidget {
  const StockBarChart({super.key});
  // final Color leftBarColor = Colors.yellow;
  final Color rightBarColor = Colors.red;
  final Color avgColor = Colors.amber;
  @override
  State<StatefulWidget> createState() => StockBarChartState();
}

class StockBarChartState extends State<StockBarChart> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 18);
    final barGroup2 = makeGroupData(1, 24);
    final barGroup3 = makeGroupData(2, 22);
    final barGroup4 = makeGroupData(3, 28);
    final barGroup5 = makeGroupData(4, 26);
    final barGroup6 = makeGroupData(5, 25);
    final barGroup7 = makeGroupData(6, 20);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return AspectRatio(
      aspectRatio: isLandscape ? 2.5 : 1.35,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BarChart(
          BarChartData(
            maxY: 30,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: ((group) {
                  return Colors.grey;
                }),
                getTooltipItem: (a, b, c, d) => null,
              ),
              touchCallback: (FlTouchEvent event, response) {
                if (response == null || response.spot == null) {
                  setState(() {
                    touchedGroupIndex = -1;
                    showingBarGroups = List.of(rawBarGroups);
                  });
                  return;
                }

                touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                setState(() {
                  if (!event.isInterestedForInteractions) {
                    touchedGroupIndex = -1;
                    showingBarGroups = List.of(rawBarGroups);
                    return;
                  }
                  showingBarGroups = List.of(rawBarGroups);
                  if (touchedGroupIndex != -1) {
                    var sum = 0.0;
                    for (final rod
                        in showingBarGroups[touchedGroupIndex].barRods) {
                      sum += rod.toY;
                    }
                    final avg =
                        sum /
                        showingBarGroups[touchedGroupIndex].barRods.length;

                    showingBarGroups[touchedGroupIndex] =
                        showingBarGroups[touchedGroupIndex].copyWith(
                          barRods:
                              showingBarGroups[touchedGroupIndex].barRods.map((
                                rod,
                              ) {
                                return rod.copyWith(
                                  toY: avg,
                                  color: AppColors.dark,
                                  backDrawRodData: BackgroundBarChartRodData(
                                    show: true,
                                    toY: 30,
                                    color: AppColors.primaryLight,
                                  ),
                                );
                              }).toList(),
                        );
                  }
                });
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                  reservedSize: 42,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 28,
                  interval: 1,
                  getTitlesWidget: leftTitles,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: showingBarGroups,
            gridData: const FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.secondaryLight,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '10K';
    } else if (value == 15) {
      text = '15K';
    } else if (value == 20) {
      text = '20K';
    } else if (value == 25) {
      text = '25K';
    } else if (value == 30) {
      text = '30K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: AppColors.secondaryLight,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      meta: meta,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: AppColors.primaryDark,
          width: 20,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }
}
