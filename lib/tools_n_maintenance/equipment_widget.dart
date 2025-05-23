import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app_f/colors.dart';
import 'package:my_app_f/tools_n_maintenance/operational.dart';

class EquipmentWidget extends StatefulWidget {
  const EquipmentWidget({
    super.key,
    required this.index,
    required this.equipment,
  });
  final int index;
  final EquipmentList equipment;

  @override
  State<EquipmentWidget> createState() => _EquipmentWidgetState();
}

class _EquipmentWidgetState extends State<EquipmentWidget> {
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
                            widget.equipment.category,
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
                            widget.equipment.name,
                            style: TextTheme.of(
                              context,
                            ).titleMedium?.copyWith(color: AppColors.dark),
                          ),
                          Text(
                            "#${widget.equipment.equipmentId}",
                            style: TextTheme.of(context).bodySmall?.copyWith(
                              color: AppColors.primaryLight,
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
                                    "Total Equipment",
                                    style: TextTheme.of(context).bodyMedium
                                        ?.copyWith(color: AppColors.darkLight),
                                  ),
                                  Text(
                                    "${widget.equipment.totalQuantity}",
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
                                    "Functional",
                                    style: TextTheme.of(context).bodyMedium
                                        ?.copyWith(color: AppColors.darkLight),
                                  ),
                                  Text(
                                    "${widget.equipment.functional}",
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
                                    "Non Functional",
                                    style: TextTheme.of(context).bodyMedium
                                        ?.copyWith(color: AppColors.darkLight),
                                  ),
                                  Text(
                                    "${widget.equipment.nonFunctional}",
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

                          const SizedBox(height: 15),

                          SizedBox(
                            width: 200,
                            child: const Divider(
                              color: AppColors.border,
                              thickness: 1,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Issues",
                                style: TextTheme.of(
                                  context,
                                ).titleMedium?.copyWith(
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                widget.equipment.issues.isEmpty
                                    ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "No Issues",
                                        style: TextTheme.of(
                                          context,
                                        ).bodyMedium?.copyWith(
                                          color: AppColors.primaryDark,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    )
                                    : Table(
                                      columnWidths: const {
                                        0: FlexColumnWidth(1.5),
                                        1: FlexColumnWidth(1),
                                        2: FlexColumnWidth(1),
                                      },
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children:
                                          widget.equipment.issues.map((e) {
                                            return TableRow(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "#${e.unitId}",
                                                      style: TextTheme.of(
                                                        context,
                                                      ).bodyMedium?.copyWith(
                                                        color:
                                                            AppColors
                                                                .primaryDark,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Reported: ${df.format(e.reportedDate)}",
                                                      style: TextTheme.of(
                                                        context,
                                                      ).bodySmall?.copyWith(
                                                        color:
                                                            AppColors
                                                                .primaryDark,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    e.status.toUpperCase(),
                                                    style: TextTheme.of(
                                                      context,
                                                    ).bodyMedium?.copyWith(
                                                      color: AppColors.error,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),

                                                Column(
                                                  children: [
                                                    Text(
                                                      e.issue,
                                                      style: TextTheme.of(
                                                        context,
                                                      ).bodyMedium?.copyWith(
                                                        color:
                                                            AppColors
                                                                .primaryDark,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      e.action,
                                                      style: TextTheme.of(
                                                        context,
                                                      ).bodySmall?.copyWith(
                                                        color:
                                                            AppColors
                                                                .primaryDark,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                    ),
                          ),

                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
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
                            widget.equipment.name,
                            style: TextTheme.of(context).bodyMedium?.copyWith(
                              color: AppColors.dark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Text(
                            "#${widget.equipment.equipmentId}",
                            style: TextTheme.of(context).bodySmall?.copyWith(
                              color: AppColors.primaryLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.equipment.category,
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
                      widget.equipment.issues.isNotEmpty
                          ? "${widget.equipment.issues.length} Issues"
                          : "No Issues",
                      style: TextTheme.of(context).bodySmall?.copyWith(
                        color:
                            widget.equipment.issues.isNotEmpty
                                ? AppColors.error
                                : AppColors.primaryDark,
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
