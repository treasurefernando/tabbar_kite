import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:tabbar/model/stock.dart';
import 'package:tabbar/bloc/stockevent.dart';
import 'package:tabbar/bloc/stockstate.dart';

/// Bloc class to manage stock data state
class StockBloc extends Bloc<StockEvent, StockState> {
  /// Constructor initializes the Bloc and sets up the event handler
  StockBloc() : super(StockInitial()) {
    on<LoadStocksEvent>(_onLoadStocks);
  }

  /// Handles loading stock data based on the selected tab index
  Future<void> _onLoadStocks(
      LoadStocksEvent event, Emitter<StockState> emit) async {
    emit(StockLoading()); // Emit loading state before fetching data
    try {
      String file = '';

      // Determine the JSON file to load based on the tab index
      switch (event.tabIndex) {
        case 0:
          file = 'assets/tab2.json';
          break;
        case 1:
          file = 'assets/nifty_data.json';
          break;
        case 2:
          file = 'assets/banknifty_data.json';
          break;
        case 3:
          file = 'assets/sensex_data.json';
          break;
        default:
          throw Exception("Invalid tab index");
      }

      // Load JSON file from assets
      final String response = await rootBundle.loadString(file);

      // Decode JSON data into a list of Stock objects
      final List<dynamic> data = json.decode(response);
      List<Stock> stocks = data.map((json) => Stock.fromJson(json)).toList();

      // Emit success state with loaded stock data
      emit(StockLoaded(stocks: stocks));
    } catch (e) {
      // Emit error state if loading fails
      emit(StockError(message: "Failed to load data: ${e.toString()}"));
    }
  }
}
