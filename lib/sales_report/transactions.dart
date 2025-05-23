class Transaction {
  List<Transactions>? _transactions;

  Transaction({List<Transactions>? transactions}) {
    if (transactions != null) {
      _transactions = transactions;
    }
  }

  List<Transactions>? get transactions => _transactions;
  set transactions(List<Transactions>? transactions) =>
      _transactions = transactions;

  Transaction.fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      _transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        _transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (_transactions != null) {
      data['transactions'] = _transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? _orderId;
  String? _customerName;
  String? _orderDate;
  String? _orderTime;
  String? _status;
  String? _paymentMethod;
  int? _totalAmount;
  List<Items>? _items;
  String? _cancellationReason;
  String? _refundReason;

  Transactions({
    String? orderId,
    String? customerName,
    String? orderDate,
    String? orderTime,
    String? status,
    String? paymentMethod,
    int? totalAmount,
    List<Items>? items,
    String? cancellationReason,
    String? refundReason,
  }) {
    if (orderId != null) {
      _orderId = orderId;
    }
    if (customerName != null) {
      _customerName = customerName;
    }
    if (orderDate != null) {
      _orderDate = orderDate;
    }
    if (orderTime != null) {
      _orderTime = orderTime;
    }
    if (status != null) {
      _status = status;
    }
    if (paymentMethod != null) {
      _paymentMethod = paymentMethod;
    }
    if (totalAmount != null) {
      _totalAmount = totalAmount;
    }
    if (items != null) {
      _items = items;
    }
    if (cancellationReason != null) {
      _cancellationReason = cancellationReason;
    }
    if (refundReason != null) {
      _refundReason = refundReason;
    }
  }

  String? get orderId => _orderId;
  set orderId(String? orderId) => _orderId = orderId;
  String? get customerName => _customerName;
  set customerName(String? customerName) => _customerName = customerName;
  String? get orderDate => _orderDate;
  set orderDate(String? orderDate) => _orderDate = orderDate;
  String? get orderTime => _orderTime;
  set orderTime(String? orderTime) => _orderTime = orderTime;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get paymentMethod => _paymentMethod;
  set paymentMethod(String? paymentMethod) => _paymentMethod = paymentMethod;
  int? get totalAmount => _totalAmount;
  set totalAmount(int? totalAmount) => _totalAmount = totalAmount;
  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;
  String? get cancellationReason => _cancellationReason;
  set cancellationReason(String? cancellationReason) =>
      _cancellationReason = cancellationReason;
  String? get refundReason => _refundReason;
  set refundReason(String? refundReason) => _refundReason = refundReason;

  Transactions.fromJson(Map<String, dynamic> json) {
    _orderId = json['order_id'];
    _customerName = json['customer_name'];
    _orderDate = json['order_date'];
    _orderTime = json['order_time'];
    _status = json['status'];
    _paymentMethod = json['payment_method'];
    _totalAmount = json['total_amount'];
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(new Items.fromJson(v));
      });
    }
    _cancellationReason = json['cancellation_reason'];
    _refundReason = json['refund_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = _orderId;
    data['customer_name'] = _customerName;
    data['order_date'] = _orderDate;
    data['order_time'] = _orderTime;
    data['status'] = _status;
    data['payment_method'] = _paymentMethod;
    data['total_amount'] = _totalAmount;
    if (_items != null) {
      data['items'] = _items!.map((v) => v.toJson()).toList();
    }
    data['cancellation_reason'] = _cancellationReason;
    data['refund_reason'] = _refundReason;
    return data;
  }
}

class Items {
  String? _itemId;
  String? _name;
  int? _quantity;
  int? _price;
  String? _notes;

  Items({
    String? itemId,
    String? name,
    int? quantity,
    int? price,
    String? notes,
  }) {
    if (itemId != null) {
      _itemId = itemId;
    }
    if (name != null) {
      _name = name;
    }
    if (quantity != null) {
      _quantity = quantity;
    }
    if (price != null) {
      _price = price;
    }
    if (notes != null) {
      _notes = notes;
    }
  }

  String? get itemId => _itemId;
  set itemId(String? itemId) => _itemId = itemId;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get notes => _notes;
  set notes(String? notes) => _notes = notes;

  Items.fromJson(Map<String, dynamic> json) {
    _itemId = json['item_id'];
    _name = json['name'];
    _quantity = json['quantity'];
    _price = json['price'];
    _notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = _itemId;
    data['name'] = _name;
    data['quantity'] = _quantity;
    data['price'] = _price;
    data['notes'] = _notes;
    return data;
  }
}

final json = {
  "transactions": [
    {
      "order_id": "TRX-20240328-001",
      "customer_name": "John Doe",
      "order_date": "2024-03-28",
      "order_time": "12:30",
      "status": "Paid",
      "payment_method": "Credit Card",
      "total_amount": 450000,
      "items": [
        {
          "item_id": "F001",
          "name": "Nasi Goreng Spesial",
          "quantity": 2,
          "price": 200000,
          "notes": "Pedas level 2",
        },
        {
          "item_id": "D001",
          "name": "Es Teh Manis",
          "quantity": 1,
          "price": 50000,
        },
      ],
    },
    {
      "order_id": "TRX-20240328-002",
      "customer_name": "Jane Smith",
      "order_date": "2024-03-28",
      "order_time": "13:15",
      "status": "Pending",
      "payment_method": "Cash",
      "total_amount": 300000,
      "items": [
        {
          "item_id": "F005",
          "name": "Ayam Bakar Madu",
          "quantity": 1,
          "price": 250000,
        },
        {"item_id": "D003", "name": "Es Cincau", "quantity": 1, "price": 50000},
      ],
    },
    {
      "order_id": "TRX-20240328-003",
      "customer_name": "Alice Johnson",
      "order_date": "2024-03-28",
      "order_time": "18:45",
      "status": "Cancelled",
      "payment_method": null,
      "total_amount": 175000,
      "items": [
        {
          "item_id": "F003",
          "name": "Sate Ayam (10 tusuk)",
          "quantity": 1,
          "price": 125000,
        },
        {
          "item_id": "D002",
          "name": "Air Mineral",
          "quantity": 1,
          "price": 50000,
        },
      ],
      "cancellation_reason": "Pembeli membatalkan pesanan",
    },
    {
      "order_id": "TRX-20240329-001",
      "customer_name": "Bob Brown",
      "order_date": "2024-03-29",
      "order_time": "11:20",
      "status": "Paid",
      "payment_method": "E-Wallet",
      "total_amount": 600000,
      "items": [
        {
          "item_id": "F002",
          "name": "Mie Goreng Seafood",
          "quantity": 3,
          "price": 180000,
          "notes": "Tidak pakai udang",
        },
      ],
    },
    {
      "order_id": "TRX-20240329-002",
      "customer_name": "Charlie Green",
      "order_date": "2024-03-29",
      "order_time": "12:50",
      "status": "Completed",
      "payment_method": "Cash",
      "total_amount": 350000,
      "items": [
        {
          "item_id": "F004",
          "name": "Soto Ayam",
          "quantity": 2,
          "price": 150000,
        },
        {
          "item_id": "D004",
          "name": "Jus Alpukat",
          "quantity": 1,
          "price": 50000,
        },
      ],
    },
    {
      "order_id": "TRX-20240329-003",
      "customer_name": "Diana White",
      "order_date": "2024-03-29",
      "order_time": "19:30",
      "status": "Paid",
      "payment_method": "Credit Card",
      "total_amount": 275000,
      "items": [
        {"item_id": "F006", "name": "Gado-Gado", "quantity": 1, "price": 75000},
        {
          "item_id": "F007",
          "name": "Rendang Daging",
          "quantity": 1,
          "price": 150000,
        },
        {
          "item_id": "D005",
          "name": "Kopi Hitam",
          "quantity": 1,
          "price": 50000,
        },
      ],
    },
    {
      "order_id": "TRX-20240330-001",
      "customer_name": "Eve Black",
      "order_date": "2024-03-30",
      "order_time": "10:15",
      "status": "Processing",
      "payment_method": "Cash",
      "total_amount": 225000,
      "items": [
        {
          "item_id": "F008",
          "name": "Bakso Malang",
          "quantity": 1,
          "price": 75000,
        },
        {
          "item_id": "F009",
          "name": "Siomay Bandung",
          "quantity": 1,
          "price": 100000,
        },
      ],
    },
    {
      "order_id": "TRX-20240330-002",
      "customer_name": "Frank Gray",
      "order_date": "2024-03-30",
      "order_time": "13:45",
      "status": "Paid",
      "payment_method": "E-Wallet",
      "total_amount": 400000,
      "items": [
        {
          "item_id": "F010",
          "name": "Pecel Lele",
          "quantity": 2,
          "price": 150000,
        },
        {"item_id": "D006", "name": "Es Jeruk", "quantity": 2, "price": 50000},
      ],
    },
    {
      "order_id": "TRX-20240330-003",
      "customer_name": "Grace Lee",
      "order_date": "2024-03-30",
      "order_time": "20:00",
      "status": "Refunded",
      "payment_method": "Credit Card",
      "total_amount": 325000,
      "items": [
        {
          "item_id": "F011",
          "name": "Tahu Telur",
          "quantity": 1,
          "price": 75000,
        },
        {
          "item_id": "F012",
          "name": "Ikan Gurame Bakar",
          "quantity": 1,
          "price": 200000,
        },
      ],
      "refund_reason": "Makanan tidak sesuai pesanan",
    },
    {
      "order_id": "TRX-20240330-004",
      "customer_name": "Henry King",
      "order_date": "2024-03-30",
      "order_time": "21:15",
      "status": "Paid",
      "payment_method": "Cash",
      "total_amount": 150000,
      "items": [
        {
          "item_id": "F013",
          "name": "Sop Buntut",
          "quantity": 1,
          "price": 100000,
        },
        {"item_id": "D007", "name": "Teh Tarik", "quantity": 1, "price": 50000},
      ],
    },
  ],
};

Transaction transaction = Transaction.fromJson(json);
List<Transactions>? transactions = transaction.transactions;
