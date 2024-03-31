class ProductOrderHistoryItem {
  final int id;
  final String customer_name;
  final int sum_price;
  final int amount;
  final DateTime date;

  ProductOrderHistoryItem({
    required this.id,
    required this.customer_name,
    required this.sum_price,
    required this.amount,
    required this.date,
  });
}
