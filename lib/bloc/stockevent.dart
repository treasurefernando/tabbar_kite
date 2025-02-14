import 'package:equatable/equatable.dart';

/// Abstract class for all stock-related events
abstract class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object> get props => [];
}

/// Event to load stocks based on the selected tab index
class LoadStocksEvent extends StockEvent {
  final int tabIndex; // Indicates which tab's data should be loaded

  /// Constructor to initialize the event with the required tab index
  const LoadStocksEvent({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex]; // Ensures proper equality comparison
}
