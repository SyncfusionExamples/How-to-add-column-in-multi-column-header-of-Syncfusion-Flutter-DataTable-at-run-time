import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

void main() {
  runApp(MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, visualDensity: VisualDensity.standard),
      home: MyHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.
class MyHomePage extends StatefulWidget {
  /// Creates the home page.
  MyHomePage({Key key}) : super(key: key);

  @override
  _StackedHeaderDataGridState createState() => _StackedHeaderDataGridState();
}

class _StackedHeaderDataGridState extends State<MyHomePage> {
  _StackedHeaderDataGridSource _stackedHeaderDataGridSource;

  StackedHeaderRow orderRow;

  List<Product> _productData = [];
  final Random _random = Random();

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

  final List<String> _product = <String>[
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

  final List<String> _cities = <String>[
    'Bruxelles',
    'Rosario',
    'Recife',
    'Graz',
    'Montreal',
    'Tsawassen',
    'Campinas',
    'Resende',
  ];

  final List<int> _productId = <int>[
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

  final List<DateTime> _orderDate = <DateTime>[
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

  List<String> _names = [
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

  List<Product> _generateProductData(int count) {
    final List<Product> productData = <Product>[];
    for (int i = 0; i < count; i++) {
      productData.add(
        Product(
            i + 1000,
            _productId[i < _productId.length
                ? i
                : _random.nextInt(_productId.length - 1)],
            _product[
                i < _product.length ? i : _random.nextInt(_product.length - 1)],
            _random.nextInt(count),
            70.0 + _random.nextInt(100),
            _cities[
                i < _cities.length ? i : _random.nextInt(_cities.length - 1)],
            1700 + _random.nextInt(100),
            _orderDate[_random.nextInt(_orderDate.length - 1)],
            _names[i < _names.length ? i : _random.nextInt(_names.length - 1)]),
      );
    }

    return productData;
  }

  List<StackedHeaderRow> _getStackedHeaderRows() {
    final List<StackedHeaderRow> stackedHeaderCollection = [];
    stackedHeaderCollection.add(stackedHeaderRow);
    if (orderRow != null) {
      stackedHeaderCollection.insert(0, orderRow);
    }
    return stackedHeaderCollection;
  }

  Color _getHeaderCellBackgroundColor() {
    return const Color(0xFFF1F1F1);
    // : const Color(0xFF3A3A3A);
  }

  @override
  void initState() {
    super.initState();
    _productData = _generateProductData(15);
    _stackedHeaderDataGridSource = _StackedHeaderDataGridSource(_productData);
  }

  SfDataGridTheme _buildDataGrid() {
    return SfDataGridTheme(
        data: SfDataGridThemeData(
            headerStyle: DataGridHeaderCellStyle(
                backgroundColor: _getHeaderCellBackgroundColor())),
        child: SfDataGrid(
            gridLinesVisibility: GridLinesVisibility.vertical,
            headerGridLinesVisibility: GridLinesVisibility.both,
            source: _stackedHeaderDataGridSource,
            columnWidthMode: ColumnWidthMode.lastColumnFill,
            columns: [
              GridTextColumn(
                  mappingName: 'customerName',
                  columnWidthMode: ColumnWidthMode.header,
                  headerText: 'Customer Name'),
              GridTextColumn(
                  mappingName: 'city', width: 100, headerText: 'City'),
              GridTextColumn(
                  mappingName: 'product', width: 100, headerText: 'Product'),
              GridNumericColumn(
                  mappingName: 'productId',
                  width: 110,
                  headerText: 'Product ID'),
            ],
            stackedHeaderRows: _getStackedHeaderRows()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syncfusion DataGrid Demo'),
      ),
      body: Column(
        children: [
          FlatButton(
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

class _StackedHeaderDataGridSource extends DataGridSource<Product> {
  _StackedHeaderDataGridSource(List<Product> productData) {
    _productData = productData;
  }

  List<Product> _productData;

  @override
  List<Product> get dataSource => _productData;
  @override
  Object getValue(Product product, String columnName) {
    switch (columnName) {
      case 'orderId':
        return product.orderId;
        break;
      case 'product':
        return product.product;
        break;
      case 'productId':
        return product.productId;
        break;
      case 'unitPrice':
        return product.unitPrice;
        break;
      case 'quantity':
        return product.quantity;
        break;
      case 'city':
        return product.city;
        break;
      case 'customerId':
        return product.customerId;
        break;
      case 'orderDate':
        return product.orderDate;
        break;
      case 'customerName':
        return product.customerName;
        break;
      default:
        return 'empty';
        break;
    }
  }
}
