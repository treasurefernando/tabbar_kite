import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  final String symbol; // Stock symbol (e.g., AAPL, TSLA)
  final String exchange; // Stock exchange name (e.g., NSE, BSE)
  // ignore: non_constant_identifier_names
  final double last_price; // Last traded price of the stock
  final double change; // Change in price from the previous close
  // ignore: non_constant_identifier_names
  final double change_percent; // Percentage change in price
  final int quantity; // Quantity of stock available or traded

  Stock({
    required this.symbol,
    required this.exchange,
    // ignore: non_constant_identifier_names
    required this.last_price,
    required this.change,
    // ignore: non_constant_identifier_names
    required this.change_percent,
    required this.quantity,
  });

  // Factory constructor to create a Stock object from JSON data
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  // Method to convert Stock object into JSON format
  Map<String, dynamic> toJson() => _$StockToJson(this);
}
