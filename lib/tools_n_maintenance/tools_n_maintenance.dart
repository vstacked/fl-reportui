import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:intl/intl.dart';
import 'package:my_app_f/colors.dart';
import 'package:my_app_f/tools_n_maintenance/equipment_widget.dart';
import 'package:my_app_f/tools_n_maintenance/operational.dart';
import 'package:my_app_f/tools_n_maintenance/operational_widget.dart';

class ToolsNMaintenancePage extends StatefulWidget {
  const ToolsNMaintenancePage({super.key});

  @override
  State<ToolsNMaintenancePage> createState() => _ToolsNMaintenancePageState();
}

class _ToolsNMaintenancePageState extends State<ToolsNMaintenancePage> {
  final df = DateFormat('dd MMMM yyyy');

  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  final maintenanceSchedule = operationalModel.maintenanceSchedule;

  int maintenanceIndex = 0;

  final summaryCriticalStock = operationalModel.summary.criticalStock;
  final summaryUrgentMaintenance = operationalModel.summary.urgentMaintenance;
  final summaryUpcomingMaintenance =
      operationalModel.summary.upcomingMaintenance;

  final operationalStock = operationalModel.operationalStock;
  final equipmentList = operationalModel.equipmentList;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: Text(
              "Tools & Maintenance",
              style: TextTheme.of(
                context,
              ).headlineMedium?.copyWith(color: AppColors.dark),
            ),
          ),

          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: isLandscape ? 14 / 4.5 : 14 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 15),
              onPageChanged: (index, reason) {
                setState(() {
                  maintenanceIndex = index;
                });
              },
            ),
            items:
                maintenanceSchedule.map((s) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        margin: const EdgeInsets.all(8),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: AppColors.secondaryDark,
                                      size: 20,
                                    ),
                                    Text(
                                      "Maintenance Schedule",
                                      style: TextTheme.of(
                                        context,
                                      ).labelLarge?.copyWith(
                                        color: AppColors.secondaryDark,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 5,
                                  children: [
                                    if (s.status == "completed")
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.success.withValues(
                                            alpha: 0.2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        child: Text(
                                          "Completed",
                                          style: TextTheme.of(
                                            context,
                                          ).labelSmall?.copyWith(
                                            color: AppColors.success,
                                          ),
                                        ),
                                      ),
                                    Text(
                                      "#${s.taskId}",
                                      style: TextTheme.of(
                                        context,
                                      ).bodySmall?.copyWith(
                                        color: AppColors.secondaryLight,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                Placeholder(
                                  fallbackHeight: 100,
                                  fallbackWidth: 75,
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        s.type,
                                        style: TextTheme.of(
                                          context,
                                        ).labelMedium?.copyWith(
                                          color: AppColors.primary,
                                        ),
                                      ),

                                      Text(
                                        s.equipmentName,
                                        style: TextTheme.of(
                                          context,
                                        ).titleLarge?.copyWith(
                                          color: AppColors.primaryDark,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 15),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                df.format(s.scheduleDate),
                                                style: TextTheme.of(
                                                  context,
                                                ).bodyMedium?.copyWith(
                                                  color:
                                                      AppColors.secondaryDark,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Schedule Date",
                                                style: TextTheme.of(
                                                  context,
                                                ).bodySmall?.copyWith(
                                                  color:
                                                      AppColors.secondaryLight,
                                                ),
                                              ),
                                            ],
                                          ),

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                df.format(
                                                  s.lastMaintenanceDate,
                                                ),
                                                style: TextTheme.of(
                                                  context,
                                                ).bodyMedium?.copyWith(
                                                  color:
                                                      AppColors.secondaryDark,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Last Maintenance Date",
                                                style: TextTheme.of(
                                                  context,
                                                ).bodySmall?.copyWith(
                                                  color:
                                                      AppColors.secondaryLight,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: 200,
                              child: const Divider(
                                color: AppColors.border,
                                thickness: 1.5,
                              ),
                            ),

                            Table(
                              columnWidths: const {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(3),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    Text(
                                      'Technician',
                                      style: TextTheme.of(
                                        context,
                                      ).bodyMedium?.copyWith(
                                        color: AppColors.secondaryDark,
                                      ),
                                    ),
                                    Text(
                                      s.technician,
                                      style: TextTheme.of(
                                        context,
                                      ).bodyMedium?.copyWith(
                                        color: AppColors.secondaryDark,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      'Notes',
                                      style: TextTheme.of(
                                        context,
                                      ).bodyMedium?.copyWith(
                                        color: AppColors.secondaryDark,
                                      ),
                                    ),
                                    Text(
                                      s.notes,
                                      style: TextTheme.of(
                                        context,
                                      ).bodyMedium?.copyWith(
                                        color: AppColors.secondaryDark,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
          ),

          SizedBox(
            height: 10,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                itemCount: maintenanceSchedule.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 2.5),
                    decoration: BoxDecoration(
                      color:
                          maintenanceIndex == index
                              ? AppColors.primary
                              : AppColors.primaryLight,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Stack(
              children: [
                Container(
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

                      for (var item in summaryCriticalStock)
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item.name,
                                  style: TextTheme.of(
                                    context,
                                  ).titleSmall?.copyWith(
                                    color: AppColors.primaryDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "#${item.itemId}",
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
                                currentValue: item.remainingStock / 3 * 100,
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
                                  item.status,
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
                        "Urgent Maintenance",
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

                      for (var item in summaryUrgentMaintenance)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextTheme.of(
                                    context,
                                  ).titleSmall?.copyWith(
                                    color: AppColors.primaryDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "#${item.equipmentId}",
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
                                  item.issue,
                                  style: TextTheme.of(
                                    context,
                                  ).bodyMedium?.copyWith(
                                    color: AppColors.error,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Text(
                                  "${item.daysUnresolved} days unresolved",
                                  style: TextTheme.of(
                                    context,
                                  ).bodySmall?.copyWith(color: AppColors.error),
                                ),
                              ],
                            ),
                          ],
                        ),

                      const SizedBox(height: 25),

                      Text(
                        "Upcoming Maintenance",
                        style: TextTheme.of(context).titleMedium?.copyWith(
                          color: AppColors.darkLight,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Divider(color: AppColors.primary, thickness: 2),
                      ),

                      const SizedBox(height: 10),

                      for (var item in summaryUpcomingMaintenance)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.equipmentName,
                                  style: TextTheme.of(
                                    context,
                                  ).titleSmall?.copyWith(
                                    color: AppColors.primaryDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "#${item.taskId}",
                                  style: TextTheme.of(
                                    context,
                                  ).bodySmall?.copyWith(
                                    color: AppColors.primaryLight,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            Text(
                              "${item.daysLeft} days left",
                              style: TextTheme.of(context).bodyMedium?.copyWith(
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.w500,
                              ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Operational Stock",
                    style: TextTheme.of(
                      context,
                    ).titleLarge?.copyWith(color: AppColors.darkLight),
                  ),
                ),

                ListView.builder(
                  itemCount: operationalStock.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return OperationalWidget(
                      index: index,
                      operational: operationalStock[index],
                    );
                  },
                ),
              ],
            ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Equipment List",
                    style: TextTheme.of(
                      context,
                    ).titleLarge?.copyWith(color: AppColors.darkLight),
                  ),
                ),

                ListView.builder(
                  itemCount: equipmentList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return EquipmentWidget(
                      index: index,
                      equipment: equipmentList[index],
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
