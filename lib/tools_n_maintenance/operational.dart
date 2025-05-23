// To parse this JSON data, do
//
//     final operationalModel = operationalModelFromJson(jsonString);

import 'dart:convert';

OperationalModel operationalModelFromJson(String str) =>
    OperationalModel.fromJson(json.decode(str));

String operationalModelToJson(OperationalModel data) =>
    json.encode(data.toJson());

class OperationalModel {
  OperationalReport operationalReport;

  OperationalModel({required this.operationalReport});

  factory OperationalModel.fromJson(Map<String, dynamic> json) =>
      OperationalModel(
        operationalReport: OperationalReport.fromJson(
          json["operational_report"],
        ),
      );

  Map<String, dynamic> toJson() => {
    "operational_report": operationalReport.toJson(),
  };
}

class OperationalReport {
  List<OperationalStock> operationalStock;
  List<EquipmentList> equipmentList;
  List<MaintenanceSchedule> maintenanceSchedule;
  Summary summary;

  OperationalReport({
    required this.operationalStock,
    required this.equipmentList,
    required this.maintenanceSchedule,
    required this.summary,
  });

  factory OperationalReport.fromJson(Map<String, dynamic> json) =>
      OperationalReport(
        operationalStock: List<OperationalStock>.from(
          json["operational_stock"].map((x) => OperationalStock.fromJson(x)),
        ),
        equipmentList: List<EquipmentList>.from(
          json["equipment_list"].map((x) => EquipmentList.fromJson(x)),
        ),
        maintenanceSchedule: List<MaintenanceSchedule>.from(
          json["maintenance_schedule"].map(
            (x) => MaintenanceSchedule.fromJson(x),
          ),
        ),
        summary: Summary.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
    "operational_stock": List<dynamic>.from(
      operationalStock.map((x) => x.toJson()),
    ),
    "equipment_list": List<dynamic>.from(equipmentList.map((x) => x.toJson())),
    "maintenance_schedule": List<dynamic>.from(
      maintenanceSchedule.map((x) => x.toJson()),
    ),
    "summary": summary.toJson(),
  };
}

class EquipmentList {
  String equipmentId;
  String name;
  String category;
  int totalQuantity;
  int functional;
  int nonFunctional;
  List<Issue> issues;

  EquipmentList({
    required this.equipmentId,
    required this.name,
    required this.category,
    required this.totalQuantity,
    required this.functional,
    required this.nonFunctional,
    required this.issues,
  });

  factory EquipmentList.fromJson(Map<String, dynamic> json) => EquipmentList(
    equipmentId: json["equipment_id"],
    name: json["name"],
    category: json["category"],
    totalQuantity: json["total_quantity"],
    functional: json["functional"],
    nonFunctional: json["non_functional"],
    issues: List<Issue>.from(json["issues"].map((x) => Issue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "equipment_id": equipmentId,
    "name": name,
    "category": category,
    "total_quantity": totalQuantity,
    "functional": functional,
    "non_functional": nonFunctional,
    "issues": List<dynamic>.from(issues.map((x) => x.toJson())),
  };
}

class Issue {
  String unitId;
  String issue;
  DateTime reportedDate;
  String status;
  String action;

  Issue({
    required this.unitId,
    required this.issue,
    required this.reportedDate,
    required this.status,
    required this.action,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
    unitId: json["unit_id"],
    issue: json["issue"],
    reportedDate: DateTime.parse(json["reported_date"]),
    status: json["status"],
    action: json["action"],
  );

  Map<String, dynamic> toJson() => {
    "unit_id": unitId,
    "issue": issue,
    "reported_date":
        "${reportedDate.year.toString().padLeft(4, '0')}-${reportedDate.month.toString().padLeft(2, '0')}-${reportedDate.day.toString().padLeft(2, '0')}",
    "status": status,
    "action": action,
  };
}

class MaintenanceSchedule {
  String taskId;
  String equipmentName;
  String type;
  DateTime scheduleDate;
  DateTime lastMaintenanceDate;
  String technician;
  String notes;
  String? status;

  MaintenanceSchedule({
    required this.taskId,
    required this.equipmentName,
    required this.type,
    required this.scheduleDate,
    required this.lastMaintenanceDate,
    required this.technician,
    required this.notes,
    this.status,
  });

  factory MaintenanceSchedule.fromJson(Map<String, dynamic> json) =>
      MaintenanceSchedule(
        taskId: json["task_id"],
        equipmentName: json["equipment_name"],
        type: json["type"],
        scheduleDate: DateTime.parse(json["schedule_date"]),
        lastMaintenanceDate: DateTime.parse(json["last_maintenance_date"]),
        technician: json["technician"],
        notes: json["notes"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    "task_id": taskId,
    "equipment_name": equipmentName,
    "type": type,
    "schedule_date":
        "${scheduleDate.year.toString().padLeft(4, '0')}-${scheduleDate.month.toString().padLeft(2, '0')}-${scheduleDate.day.toString().padLeft(2, '0')}",
    "last_maintenance_date":
        "${lastMaintenanceDate.year.toString().padLeft(4, '0')}-${lastMaintenanceDate.month.toString().padLeft(2, '0')}-${lastMaintenanceDate.day.toString().padLeft(2, '0')}",
    "technician": technician,
    "notes": notes,
    "status": status,
  };
}

class OperationalStock {
  String itemId;
  String name;
  String category;
  int currentStock;
  int minStock;
  DateTime lastPurchase;
  String restockRecommendation;
  String status;

  OperationalStock({
    required this.itemId,
    required this.name,
    required this.category,
    required this.currentStock,
    required this.minStock,
    required this.lastPurchase,
    required this.restockRecommendation,
    required this.status,
  });

  factory OperationalStock.fromJson(Map<String, dynamic> json) =>
      OperationalStock(
        itemId: json["item_id"],
        name: json["name"],
        category: json["category"],
        currentStock: json["current_stock"],
        minStock: json["min_stock"],
        lastPurchase: DateTime.parse(json["last_purchase"]),
        restockRecommendation: json["restock_recommendation"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "name": name,
    "category": category,
    "current_stock": currentStock,
    "min_stock": minStock,
    "last_purchase":
        "${lastPurchase.year.toString().padLeft(4, '0')}-${lastPurchase.month.toString().padLeft(2, '0')}-${lastPurchase.day.toString().padLeft(2, '0')}",
    "restock_recommendation": restockRecommendation,
    "status": status,
  };
}

class Summary {
  List<CriticalStock> criticalStock;
  List<UrgentMaintenance> urgentMaintenance;
  List<UpcomingMaintenance> upcomingMaintenance;

  Summary({
    required this.criticalStock,
    required this.urgentMaintenance,
    required this.upcomingMaintenance,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    criticalStock: List<CriticalStock>.from(
      json["critical_stock"].map((x) => CriticalStock.fromJson(x)),
    ),
    urgentMaintenance: List<UrgentMaintenance>.from(
      json["urgent_maintenance"].map((x) => UrgentMaintenance.fromJson(x)),
    ),
    upcomingMaintenance: List<UpcomingMaintenance>.from(
      json["upcoming_maintenance"].map((x) => UpcomingMaintenance.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "critical_stock": List<dynamic>.from(criticalStock.map((x) => x.toJson())),
    "urgent_maintenance": List<dynamic>.from(
      urgentMaintenance.map((x) => x.toJson()),
    ),
    "upcoming_maintenance": List<dynamic>.from(
      upcomingMaintenance.map((x) => x.toJson()),
    ),
  };
}

class CriticalStock {
  String itemId;
  String name;
  int remainingStock;
  String status;

  CriticalStock({
    required this.itemId,
    required this.name,
    required this.remainingStock,
    required this.status,
  });

  factory CriticalStock.fromJson(Map<String, dynamic> json) => CriticalStock(
    itemId: json["item_id"],
    name: json["name"],
    remainingStock: json["remaining_stock"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "name": name,
    "remaining_stock": remainingStock,
    "status": status,
  };
}

class UpcomingMaintenance {
  String taskId;
  String equipmentName;
  int daysLeft;

  UpcomingMaintenance({
    required this.taskId,
    required this.equipmentName,
    required this.daysLeft,
  });

  factory UpcomingMaintenance.fromJson(Map<String, dynamic> json) =>
      UpcomingMaintenance(
        taskId: json["task_id"],
        equipmentName: json["equipment_name"],
        daysLeft: json["days_left"],
      );

  Map<String, dynamic> toJson() => {
    "task_id": taskId,
    "equipment_name": equipmentName,
    "days_left": daysLeft,
  };
}

class UrgentMaintenance {
  String equipmentId;
  String name;
  String issue;
  int daysUnresolved;

  UrgentMaintenance({
    required this.equipmentId,
    required this.name,
    required this.issue,
    required this.daysUnresolved,
  });

  factory UrgentMaintenance.fromJson(Map<String, dynamic> json) =>
      UrgentMaintenance(
        equipmentId: json["equipment_id"],
        name: json["name"],
        issue: json["issue"],
        daysUnresolved: json["days_unresolved"],
      );

  Map<String, dynamic> toJson() => {
    "equipment_id": equipmentId,
    "name": name,
    "issue": issue,
    "days_unresolved": daysUnresolved,
  };
}

final jsonValue = {
  "operational_report": {
    "operational_stock": [
      {
        "item_id": "G001",
        "name": "Gas LPG 3kg",
        "category": "Consumable",
        "current_stock": 2,
        "min_stock": 3,
        "last_purchase": "2024-03-28",
        "restock_recommendation": "Pesan 4 tabung (stok kritis!)",
        "status": "critical",
      },
      {
        "item_id": "T001",
        "name": "Tissue Roll",
        "category": "Consumable",
        "current_stock": 15,
        "min_stock": 10,
        "last_purchase": "2024-03-25",
        "restock_recommendation": "Pesan 5 pack",
        "status": "safe",
      },
    ],
    "equipment_list": [
      {
        "equipment_id": "E001",
        "name": "Kulkas 2 Pintu",
        "category": "Kitchen Equipment",
        "total_quantity": 3,
        "functional": 2,
        "non_functional": 1,
        "issues": [
          {
            "unit_id": "E001-03",
            "issue": "Tidak dingin",
            "reported_date": "2024-03-28",
            "status": "urgent",
            "action": "Panggil teknisi (081xxx)",
          },
        ],
      },
      {
        "equipment_id": "E002",
        "name": "Kompor Industri",
        "category": "Kitchen Equipment",
        "total_quantity": 2,
        "functional": 2,
        "non_functional": 0,
        "issues": [],
      },
    ],
    "maintenance_schedule": [
      {
        "task_id": "M001",
        "equipment_name": "Mesin Kopi",
        "type": "Preventive",
        "schedule_date": "2024-04-05",
        "last_maintenance_date": "2024-03-01",
        "technician": "PT Service Mesin",
        "notes": "Ganti filter dan bersihkan steam wand",
      },
      {
        "task_id": "M002",
        "equipment_name": "Exhaust Hood",
        "type": "Corrective",
        "schedule_date": "2024-03-30",
        "last_maintenance_date": "2024-01-10",
        "technician": "Internal Team",
        "notes": "Perbaikan kipas tersumbat",
        "status": "completed",
      },
    ],
    "summary": {
      "critical_stock": [
        {
          "item_id": "G001",
          "name": "Gas LPG 3kg",
          "remaining_stock": 2,
          "status": "Kritis (sisa 2 tabung < min. 3)",
        },
      ],
      "urgent_maintenance": [
        {
          "equipment_id": "E001-03",
          "name": "Kulkas 2 Pintu (Unit 03)",
          "issue": "Tidak dingin",
          "days_unresolved": 2,
        },
      ],
      "upcoming_maintenance": [
        {"task_id": "M001", "equipment_name": "Mesin Kopi", "days_left": 7},
      ],
    },
  },
};

final operationalModel = OperationalModel.fromJson(jsonValue).operationalReport;
