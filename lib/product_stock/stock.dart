class Stock {
  ProductStock? productStock;

  Stock({this.productStock});

  Stock.fromJson(Map<String, dynamic> json) {
    productStock =
        json['product_stock'] != null
            ? new ProductStock.fromJson(json['product_stock'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productStock != null) {
      data['product_stock'] = this.productStock!.toJson();
    }
    return data;
  }
}

class ProductStock {
  List<ProductMaster>? productMaster;
  List<DailyStock>? dailyStock;

  ProductStock({this.productMaster, this.dailyStock});

  ProductStock.fromJson(Map<String, dynamic> json) {
    if (json['product_master'] != null) {
      productMaster = <ProductMaster>[];
      json['product_master'].forEach((v) {
        productMaster!.add(new ProductMaster.fromJson(v));
      });
    }
    if (json['daily_stock'] != null) {
      dailyStock = <DailyStock>[];
      json['daily_stock'].forEach((v) {
        dailyStock!.add(new DailyStock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productMaster != null) {
      data['product_master'] =
          this.productMaster!.map((v) => v.toJson()).toList();
    }
    if (this.dailyStock != null) {
      data['daily_stock'] = this.dailyStock!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductMaster {
  String? productId;
  String? name;
  String? category;
  int? currentStock;
  String? unit;
  int? minStock;
  String? lastPurchase;
  String? expirationDate;
  String? restockRecommendation;

  ProductMaster({
    this.productId,
    this.name,
    this.category,
    this.currentStock,
    this.unit,
    this.minStock,
    this.lastPurchase,
    this.expirationDate,
    this.restockRecommendation,
  });

  ProductMaster.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    category = json['category'];
    currentStock = json['current_stock'];
    unit = json['unit'];
    minStock = json['min_stock'];
    lastPurchase = json['last_purchase'];
    expirationDate = json['expiration_date'];
    restockRecommendation = json['restock_recommendation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['current_stock'] = this.currentStock;
    data['unit'] = this.unit;
    data['min_stock'] = this.minStock;
    data['last_purchase'] = this.lastPurchase;
    data['expiration_date'] = this.expirationDate;
    data['restock_recommendation'] = this.restockRecommendation;
    return data;
  }
}

class DailyStock {
  String? date;
  List<Products>? products;
  DailySummary? dailySummary;

  DailyStock({this.date, this.products, this.dailySummary});

  DailyStock.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    dailySummary =
        json['daily_summary'] != null
            ? new DailySummary.fromJson(json['daily_summary'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.dailySummary != null) {
      data['daily_summary'] = this.dailySummary!.toJson();
    }
    return data;
  }
}

class Products {
  String? productId;
  int? stockIn;
  int? stockOut;
  String? notes;

  Products({this.productId, this.stockIn, this.stockOut, this.notes});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    stockIn = json['stock_in'];
    stockOut = json['stock_out'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['stock_in'] = this.stockIn;
    data['stock_out'] = this.stockOut;
    data['notes'] = this.notes;
    return data;
  }
}

class DailySummary {
  int? totalStockIn;
  int? totalStockOut;
  List<CriticalStock>? criticalStock;
  List<ExpiringSoon>? expiringSoon;

  DailySummary({
    this.totalStockIn,
    this.totalStockOut,
    this.criticalStock,
    this.expiringSoon,
  });

  DailySummary.fromJson(Map<String, dynamic> json) {
    totalStockIn = json['total_stock_in'];
    totalStockOut = json['total_stock_out'];
    if (json['critical_stock'] != null) {
      criticalStock = <CriticalStock>[];
      json['critical_stock'].forEach((v) {
        criticalStock!.add(new CriticalStock.fromJson(v));
      });
    }
    if (json['expiring_soon'] != null) {
      expiringSoon = <ExpiringSoon>[];
      json['expiring_soon'].forEach((v) {
        expiringSoon!.add(new ExpiringSoon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_stock_in'] = this.totalStockIn;
    data['total_stock_out'] = this.totalStockOut;
    if (this.criticalStock != null) {
      data['critical_stock'] =
          this.criticalStock!.map((v) => v.toJson()).toList();
    }
    if (this.expiringSoon != null) {
      data['expiring_soon'] =
          this.expiringSoon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CriticalStock {
  String? productId;
  String? name;
  int? remainingStock;
  String? status;

  CriticalStock({this.productId, this.name, this.remainingStock, this.status});

  CriticalStock.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    remainingStock = json['remaining_stock'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['remaining_stock'] = this.remainingStock;
    data['status'] = this.status;
    return data;
  }
}

class ExpiringSoon {
  String? productId;
  String? name;
  String? expirationDate;
  int? daysLeft;

  ExpiringSoon({this.productId, this.name, this.expirationDate, this.daysLeft});

  ExpiringSoon.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    expirationDate = json['expiration_date'];
    daysLeft = json['days_left'];
  }

  get expiredDate => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['expiration_date'] = this.expirationDate;
    data['days_left'] = this.daysLeft;
    return data;
  }
}

final json = {
  "product_stock": {
    "product_master": [
      {
        "product_id": "B001",
        "name": "Telur",
        "category": "Bahan Baku",
        "current_stock": 500,
        "unit": "butir",
        "min_stock": 300,
        "last_purchase": "2024-03-25",
        "expiration_date": "2024-04-10",
        "restock_recommendation": "Pesan 500 butir",
      },
      {
        "product_id": "B002",
        "name": "Ayam Segar",
        "category": "Bahan Baku",
        "current_stock": 50,
        "unit": "kg",
        "min_stock": 30,
        "last_purchase": "2024-03-27",
        "expiration_date": "2024-03-30",
        "restock_recommendation": "Pesan 40 kg (urgent)",
      },
      {
        "product_id": "B003",
        "name": "Tepung Terigu",
        "category": "Bahan Baku",
        "current_stock": 100,
        "unit": "kg",
        "min_stock": 50,
        "last_purchase": "2024-03-20",
        "expiration_date": "2024-12-01",
        "restock_recommendation": "Pesan 70 kg",
      },
      {
        "product_id": "O001",
        "name": "Gas LPG 3kg",
        "category": "Operasional",
        "current_stock": 4,
        "unit": "tabung",
        "min_stock": 2,
        "last_purchase": "2024-03-25",
        "expiration_date": null,
        "restock_recommendation": "Pesan 3 tabung",
      },
    ],
    "daily_stock": [
      {
        "date": "2024-03-28",
        "products": [
          {
            "product_id": "B001",
            "stock_in": 0,
            "stock_out": 200,
            "notes": "Pemakaian harian untuk nasi goreng",
          },
          {
            "product_id": "B002",
            "stock_in": 40,
            "stock_out": 25,
            "notes": "Pengiriman dari supplier AyamXYZ",
          },
          {
            "product_id": "O001",
            "stock_in": 0,
            "stock_out": 1,
            "notes": "Tabung habis di dapur utama",
          },
        ],
        "daily_summary": {
          "total_stock_in": 40,
          "total_stock_out": 226,
          "critical_stock": [
            {
              "product_id": "B002",
              "name": "Ayam Segar",
              "remaining_stock": 15,
              "status": "Kritis (sisa 15 kg < min. 30 kg)",
            },
          ],
          "expiring_soon": [
            {
              "product_id": "B002",
              "name": "Ayam Segar",
              "expiration_date": "2024-03-30",
              "days_left": 2,
            },
          ],
        },
      },
      {
        "date": "2024-03-29",
        "products": [
          {
            "product_id": "B001",
            "stock_in": 0,
            "stock_out": 180,
            "notes": "Pemakaian harian",
          },
          {
            "product_id": "B002",
            "stock_in": 0,
            "stock_out": 20,
            "notes": "Stok tersisa 15 kg (kritis)",
          },
          {
            "product_id": "B003",
            "stock_in": 70,
            "stock_out": 30,
            "notes": "Restock tepung dari SupplierA",
          },
        ],
        "daily_summary": {
          "total_stock_in": 70,
          "total_stock_out": 230,
          "critical_stock": [
            {
              "product_id": "B002",
              "name": "Ayam Segar",
              "remaining_stock": -5,
              "status": "Stok habis! (melebihi min. 30 kg)",
            },
          ],
          "expiring_soon": [
            {
              "product_id": "B002",
              "name": "Ayam Segar",
              "expiration_date": "2024-03-30",
              "days_left": 1,
            },
          ],
        },
      },
      {
        "date": "2024-03-30",
        "products": [
          {
            "product_id": "B001",
            "stock_in": 500,
            "stock_out": 150,
            "notes": "Restock telur dari FarmTelur",
          },
          {
            "product_id": "B002",
            "stock_in": 50,
            "stock_out": 0,
            "notes": "Restock urgent ayam",
          },
          {
            "product_id": "O001",
            "stock_in": 3,
            "stock_out": 0,
            "notes": "Restock gas dari SupplierGas",
          },
        ],
        "daily_summary": {
          "total_stock_in": 553,
          "total_stock_out": 150,
          "critical_stock": [],
          "expiring_soon": [],
        },
      },
    ],
  },
};

final stock = Stock.fromJson(json).productStock;
