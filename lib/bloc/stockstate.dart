import 'package:equatable/equatable.dart';
import 'package:tabbar/model/stock.dart';

/// Abstract class representing different states of stock data
abstract class StockState extends Equatable {
  const StockState();
  
  @override
  List<Object> get props => [];
}

/// Initial state when no data is loaded
class StockInitial extends StockState {}

/// State when stocks are being loaded
class StockLoading extends StockState {}

/// State when stocks are successfully loaded
class StockLoaded extends StockState {
  final List<Stock> stocks; // List of stocks loaded from JSON

  const StockLoaded({required this.stocks});

  @override
  List<Object> get props => [stocks]; // Ensures proper state comparison
}

/// State when there is an error loading stocks
class StockError extends StockState {
  final String message; // Error message to display

  const StockError({required this.message});

  @override
  List<Object> get props => [message]; // Ensures proper state comparison
}
