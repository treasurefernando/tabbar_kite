// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      symbol: json['symbol'] as String,
      exchange: json['exchange'] as String,
      last_price: (json['last_price'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      change_percent: (json['change_percent'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'exchange': instance.exchange,
      'last_price': instance.last_price,
      'change': instance.change,
      'change_percent': instance.change_percent,
      'quantity': instance.quantity,
    };
