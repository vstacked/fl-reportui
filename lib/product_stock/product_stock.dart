import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:intl/intl.dart';
import 'package:my_app_f/colors.dart';
import 'package:my_app_f/product_stock/stock.dart';
import 'package:my_app_f/product_stock/product_widget.dart';

class ProductStockPage extends StatefulWidget {
  const ProductStockPage({super.key});

  @override
  State<ProductStockPage> createState() => _ProductStockPageState();
}

class _ProductStockPageState extends State<ProductStockPage> {
  final df = DateFormat('dd MMMM yyyy');

  final alertCriticalStock = stock?.dailyStock![0].dailySummary?.criticalStock;
  final alertExpiringSoon = stock?.dailyStock![0].dailySummary?.expiringSoon;

  final productMaster = stock?.productMaster ?? [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              "Product Stock",
              style: TextTheme.of(
                context,
              ).headlineMedium?.copyWith(color: AppColors.dark),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: AppColors.border.withValues(alpha: 0.5)),
                      BoxShadow(
                        color: AppColors.background,
                        blurRadius: 5,
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Critical Stock",
                        style: TextTheme.of(context).titleMedium?.copyWith(
                          color: AppColors.darkLight,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Divider(color: AppColors.error, thickness: 2),
                      ),

                      const SizedBox(height: 10),

                      for (var item in alertCriticalStock!)
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item.name!,
                                  style: TextTheme.of(
                                    context,
                                  ).titleSmall?.copyWith(
                                    color: AppColors.primaryDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "#${item.productId}",
                                  style: TextTheme.of(
                                    context,
                                  ).bodySmall?.copyWith(
                                    color: AppColors.primaryLight,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FAProgressBar(
                                currentValue: item.remainingStock! / 30 * 100,
                                displayText: '%',
                                backgroundColor: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(7.5),
                                progressColor: AppColors.error,
                                displayTextStyle: TextTheme.of(
                                  context,
                                ).bodySmall!.copyWith(
                                  color: AppColors.background,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: AppColors.error,
                                  size: 15,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  item.status!,
                                  style: TextTheme.of(
                                    context,
                                  ).bodySmall?.copyWith(
                                    color: AppColors.error,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      const SizedBox(height: 25),

                      Text(
                        "Expiring Soon",
                        style: TextTheme.of(context).titleMedium?.copyWith(
                          color: AppColors.darkLight,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Divider(color: AppColors.error, thickness: 2),
                      ),

                      const SizedBox(height: 10),

                      for (var item in alertExpiringSoon!)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name!,
                                  style: TextTheme.of(
                                    context,
                                  ).titleSmall?.copyWith(
                                    color: AppColors.primaryDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "#${item.productId}",
                                  style: TextTheme.of(
                                    context,
                                  ).bodySmall?.copyWith(
                                    color: AppColors.primaryLight,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${item.daysLeft} days left",
                                  style: TextTheme.of(
                                    context,
                                  ).bodyMedium?.copyWith(
                                    color: AppColors.error,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                if (item.expirationDate != null)
                                  Text(
                                    df.format(
                                      DateTime.parse(item.expirationDate!),
                                    ),
                                    style: TextTheme.of(context).bodySmall
                                        ?.copyWith(color: AppColors.primary),
                                  ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 20,
                  height: 286,
                  color: AppColors.background,
                ),

                Positioned(
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 20,
                    height: 286,
                    color: AppColors.background,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stock Report",
                  style: TextTheme.of(
                    context,
                  ).titleLarge?.copyWith(color: AppColors.dark),
                ),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: 'Daily',
                      child: Text(
                        'Daily',
                        style: TextTheme.of(
                          context,
                        ).labelLarge?.copyWith(color: AppColors.dark),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Monthly',
                      child: Text(
                        'Monthly',
                        style: TextTheme.of(
                          context,
                        ).labelLarge?.copyWith(color: AppColors.dark),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Yearly',
                      child: Text(
                        'Yearly',
                        style: TextTheme.of(
                          context,
                        ).labelLarge?.copyWith(color: AppColors.dark),
                      ),
                    ),
                  ],
                  value: "Monthly",
                  dropdownColor: AppColors.background,
                  underline: SizedBox.shrink(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.darkDarker,
                    size: 20,
                  ),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: LineChartSample1(),
          ),

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
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products",
                      style: TextTheme.of(
                        context,
                      ).titleLarge?.copyWith(color: AppColors.darkLight),
                    ),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          value: 'Last Purchased',
                          child: Text(
                            'Last Purchased',
                            style: TextTheme.of(
                              context,
                            ).labelLarge?.copyWith(color: AppColors.dark),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Stock Levels',
                          child: Text(
                            'Stock Levels',
                            style: TextTheme.of(
                              context,
                            ).labelLarge?.copyWith(color: AppColors.dark),
                          ),
                        ),
                      ],
                      value: "Last Purchased",
                      dropdownColor: AppColors.surface,
                      underline: SizedBox.shrink(),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.darkDarker,
                        size: 20,
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                ),

                ListView.builder(
                  itemCount: productMaster.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      index: index,
                      product: productMaster[index],
                    );
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

class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(sampleData2, duration: const Duration(milliseconds: 250));
  }

  LineChartData get sampleData2 => LineChartData(
    lineTouchData: lineTouchData2,
    gridData: gridData,
    titlesData: titlesData2,
    borderData: borderData,
    lineBarsData: lineBarsData2,
    minX: 0,
    maxX: 13,
    maxY: 6,
    minY: 0,
  );

  LineTouchData get lineTouchData2 => const LineTouchData(enabled: false);

  FlTitlesData get titlesData2 => FlTitlesData(
    bottomTitles: AxisTitles(sideTitles: bottomTitles),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    leftTitles: AxisTitles(sideTitles: leftTitles()),
  );

  List<LineChartBarData> get lineBarsData2 => [
    lineChartBarData2_1,
    lineChartBarData2_11,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.secondaryLight,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0';
        break;
      case 2:
        text = '10';
        break;
      case 3:
        text = '20';
        break;
      case 4:
        text = '30';
        break;
      case 5:
        text = '40';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.secondaryLight,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Mon', style: style);
        break;
      case 2:
        text = const Text('Tue', style: style);
        break;
      case 4:
        text = const Text('Wed', style: style);
        break;
      case 6:
        text = const Text('Thu', style: style);
        break;
      case 8:
        text = const Text('Fri', style: style);
        break;
      case 10:
        text = const Text('Sat', style: style);
        break;
      case 12:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(meta: meta, space: 10, child: text);
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData =>
      const FlGridData(show: true, drawHorizontalLine: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom: BorderSide(color: AppColors.darkDarker, width: 0.5),
      left: const BorderSide(color: Colors.transparent),
      right: const BorderSide(color: Colors.transparent),
      top: const BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color: AppColors.primaryDark,
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    isStrokeJoinRound: true,
    spots: const [
      FlSpot(0, 2.5),
      FlSpot(2, 3.25),
      FlSpot(4, 2.8),
      FlSpot(6, 4),
      FlSpot(8, 3),
      FlSpot(10, 4.5),
      FlSpot(12, 4.8),
    ],
  );

  LineChartBarData get lineChartBarData2_11 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color: AppColors.primaryLight,
    barWidth: 5,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    isStrokeJoinRound: true,
    spots: const [
      FlSpot(0, 1.8),
      FlSpot(2, 2.4),
      FlSpot(4, 1.75),
      FlSpot(6, 3.5),
      FlSpot(8, 3.3),
      FlSpot(10, 5),
      FlSpot(12, 5),
    ],
  );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 25,
            children: [
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.circle, color: AppColors.primaryDark, size: 15),
                  Text(
                    "Stock In",
                    style: TextTheme.of(
                      context,
                    ).labelLarge?.copyWith(color: AppColors.darkLight),
                  ),
                ],
              ),
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.circle, color: AppColors.primaryLight, size: 15),
                  Text(
                    "Stock Out",
                    style: TextTheme.of(
                      context,
                    ).labelLarge?.copyWith(color: AppColors.darkLight),
                  ),
                ],
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: isLandscape ? 3 : 1.5,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 6),
            child: _LineChart(),
          ),
        ),
      ],
    );
  }
}
