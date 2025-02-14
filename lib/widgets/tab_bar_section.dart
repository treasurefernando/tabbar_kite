import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabbar/widgets/search_box.dart';
import 'package:tabbar/bloc/bloc.dart';
import 'package:tabbar/model/stock.dart';
import 'package:tabbar/bloc/stockevent.dart';
import 'package:tabbar/bloc/stockstate.dart';

class TabBarSection extends StatefulWidget {
  const TabBarSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // Controller for tab navigation

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    // Load initial stock data for the first tab
    Future.delayed(Duration.zero, () {
      // ignore: use_build_context_synchronously
      context.read<StockBloc>().add(LoadStocksEvent(tabIndex: 0));
    });

    // Add listener to update data when the tab changes
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        context
            .read<StockBloc>()
            .add(LoadStocksEvent(tabIndex: _tabController.index));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevents UI shift when keyboard appears
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90), // Adjusted height for the tab bar
          child: Column(
            children: [
              // TabBar with four categories
              Row(
                children: [
                  Expanded(
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: '2'),
                        Tab(text: 'NIFTY'),
                        Tab(text: 'BANKNIFTY'),
                        Tab(text: 'SENSEX'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.menu_open),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: SizedBox(
                  height: 50, // Search box height
                  child: search_boxx(), // Search input field
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildStockList(), // Tab 0: Load `tab2.json`
          buildStockList(), // Tab 1: Load `nifty_data.json`
          buildStockList(), // Tab 2: Load `banknifty_data.json`
          buildStockList(), // Tab 3: Load `sensex_data.json`
        ],
      ),
    );
  }

  /// Widget to display stock data based on the selected tab
  Widget buildStockList() {
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state is StockLoading) {
          return Center(child: CircularProgressIndicator()); // Show loader
        } else if (state is StockLoaded) {
          return ListView.builder(
            itemCount: state.stocks.length, // Number of stocks
            itemBuilder: (context, index) {
              final Stock stock = state.stocks[index]; // Get stock details
              return Column(
                children: [
                  ListTile(
                    title: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(stock.symbol,
                                style: TextStyle(fontSize: 22)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_upward_outlined,
                                  color: Colors.greenAccent,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('${stock.last_price}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.greenAccent)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ), // Stock name
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(stock.exchange),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('+${stock.change}'
                              '   (${stock.change_percent}%)'),
                        )
                      ],
                    ), // Exchange and price
                  ),
                  Divider(
                    color: const Color.fromARGB(
                        255, 68, 68, 68), // Light-colored divider
                  ),
                ],
              );
            },
          );
        } else if (state is StockError) {
          return Center(child: Text(state.message)); // Show error message
        }
        return Center(
            child: Text('Press a tab to load items')); // Default message
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose tab controller
    super.dispose();
  }
}
