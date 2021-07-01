import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.
class MyHomePage extends StatefulWidget {
  /// Creates the home page.
  MyHomePage({Key? key}) : super(key: key);

  @override
  _StackedHeaderDataGridState createState() => _StackedHeaderDataGridState();
}

class _StackedHeaderDataGridState extends State<MyHomePage> {
  late _StackedHeaderDataGridSource stackedHeaderDataGridSource;

  final Random random = Random();

  List<Product> productData = [];

  final List<String> product = <String>[
    'Lax',
    'Chocolate',
    'Syrup',
    'Chai',
    'Bags',
    'Meat',
    'Filo',
    'Cashew',
    'Walnuts',
    'Geitost',
    'Cote de',
    'Crab',
    'Chang',
    'Cajun',
    'Gum',
    'Filo',
    'Cashew',
    'Walnuts',
    'Geitost',
    'Bag',
    'Meat',
    'Filo',
    'Cashew',
    'Geitost',
    'Cote de',
    'Crab',
    'Chang',
    'Cajun',
    'Gum',
  ];

  final List<String> cities = <String>[
    'Bruxelles',
    'Rosario',
    'Recife',
    'Graz',
    'Montreal',
    'Tsawassen',
    'Campinas',
    'Resende',
  ];

  final List<int> productId = <int>[
    3524,
    2523,
    1345,
    5243,
    1803,
    4932,
    6532,
    9475,
    2435,
    2123,
    3652,
    4523,
    4263,
    3527,
    3634,
    4932,
    6532,
    9475,
    2435,
    2123,
    6532,
    9475,
    2435,
    2123,
    4523,
    4263,
    3527,
    3634,
    4932,
  ];

  final List<DateTime> orderDate = <DateTime>[
    DateTime.now(),
    DateTime(2002, 8, 27),
    DateTime(2015, 7, 4),
    DateTime(2007, 4, 15),
    DateTime(2010, 12, 23),
    DateTime(2010, 4, 20),
    DateTime(2004, 6, 13),
    DateTime(2008, 11, 11),
    DateTime(2005, 7, 29),
    DateTime(2009, 4, 5),
    DateTime(2003, 3, 20),
    DateTime(2011, 3, 8),
    DateTime(2013, 10, 22),
  ];

  List<String> names = [
    'Kyle',
    'Gina',
    'Irene',
    'Katie',
    'Michael',
    'Oscar',
    'Ralph',
    'Torrey',
    'William',
    'Bill',
    'Daniel',
    'Frank',
    'Brenda',
    'Danielle',
    'Fiona',
    'Howard',
    'Jack',
    'Larry',
    'Holly',
    'Jennifer',
    'Liz',
    'Pete',
    'Steve',
    'Vince',
    'Zeke'
  ];

  StackedHeaderRow? orderRow;

  List<Product> _generateProductData(int count) {
    final List<Product> productData = <Product>[];
    for (int i = 0; i < count; i++) {
      productData.add(
        Product(
            i + 1000,
            productId[i < productId.length
                ? i
                : random.nextInt(productId.length - 1)],
            product[
                i < product.length ? i : random.nextInt(product.length - 1)],
            random.nextInt(count),
            70.0 + random.nextInt(100),
            cities[i < cities.length ? i : random.nextInt(cities.length - 1)],
            1700 + random.nextInt(100),
            orderDate[random.nextInt(orderDate.length - 1)],
            names[i < names.length ? i : random.nextInt(names.length - 1)]),
      );
    }
    return productData;
  }

  Color _getHeaderCellBackgroundColor() {
    return const Color(0xFFF1F1F1);
  }

  StackedHeaderRow stackedHeaderRow = StackedHeaderRow(cells: [
    StackedHeaderCell(
        columnNames: ['customerName', 'city'],
        child: Container(
            color: const Color(0xFFF1F1F1),
            child: Center(child: Text('Customer Details')))),
    StackedHeaderCell(
        columnNames: ['productId', 'product'],
        child: Container(
            color: const Color(0xFFF1F1F1),
            child: Center(child: Text('Product Details'))))
  ]);

  List<StackedHeaderRow> _getStackedHeaderRows() {
    final List<StackedHeaderRow> stackedHeaderCollection = [];
    stackedHeaderCollection.add(stackedHeaderRow);
    if (orderRow != null) {
      stackedHeaderCollection.insert(0, orderRow!);
    }
    return stackedHeaderCollection;
  }

  SfDataGridTheme _buildDataGrid() {
    return SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: _getHeaderCellBackgroundColor(),
        ),
        child: SfDataGrid(
          gridLinesVisibility: GridLinesVisibility.vertical,
          headerGridLinesVisibility: GridLinesVisibility.both,
          source: stackedHeaderDataGridSource,
          columns: [
            GridColumn(
                columnName: 'customerName',
                width: 140,
                label: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Customer Name',
                    overflow: TextOverflow.ellipsis,
                  ),
                  color: _getHeaderCellBackgroundColor(),
                )),
            GridColumn(
                columnName: 'city',
                width: 100,
                label: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'City',
                    overflow: TextOverflow.ellipsis,
                  ),
                  color: _getHeaderCellBackgroundColor(),
                )),
            GridColumn(
                columnName: 'product',
                width: 100,
                label: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Product',
                    overflow: TextOverflow.ellipsis,
                  ),
                  color: _getHeaderCellBackgroundColor(),
                )),
            GridColumn(
                columnName: 'productId',
                width: 100,
                label: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Product ID',
                    overflow: TextOverflow.ellipsis,
                  ),
                  color: _getHeaderCellBackgroundColor(),
                )),
          ],
          stackedHeaderRows: _getStackedHeaderRows(),
        ));
  }

  @override
  void initState() {
    super.initState();
    productData = _generateProductData(30);
    stackedHeaderDataGridSource =
        _StackedHeaderDataGridSource(productData: productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stacked Header Demo')),
      body: Column(
        children: [
          MaterialButton(
              color: Colors.blue[200],
              onPressed: () {
                orderRow = StackedHeaderRow(cells: [
                  StackedHeaderCell(
                      columnNames: [
                        'customerName',
                        'city',
                        'product',
                        'productId',
                      ],
                      child: Container(
                          color: const Color(0xFFF1F1F1),
                          child: Center(child: Text('Order Shipment Details'))))
                ]);
                setState(() {});
              },
              child: Text('Add Stacked Header Row')),
          Expanded(child: _buildDataGrid()),
        ],
      ),
    );
  }
}

class Product {
  Product(
      this.orderId,
      this.productId,
      this.product,
      this.quantity,
      this.unitPrice,
      this.city,
      this.customerId,
      this.orderDate,
      this.customerName);
  final int orderId;
  final int productId;
  final String product;
  final int quantity;
  final double unitPrice;
  final String city;
  final int customerId;
  final DateTime orderDate;
  final String customerName;
}

class _StackedHeaderDataGridSource extends DataGridSource {
  _StackedHeaderDataGridSource({required List<Product> productData}) {
    _productData = productData.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'customerName', value: e.customerName),
        DataGridCell(columnName: 'city', value: e.city),
        DataGridCell(columnName: 'product', value: e.product),
        DataGridCell(columnName: 'productId', value: e.productId),
      ]);
    }).toList(growable: false);
  }
  late List<DataGridRow> _productData;

  @override
  List<DataGridRow> get rows => _productData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
}
