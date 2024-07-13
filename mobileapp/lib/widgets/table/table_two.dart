import 'dart:math';

import 'package:flutter/material.dart';

class TableTwoWidget extends StatefulWidget {
  const TableTwoWidget({super.key});

  @override
  State<TableTwoWidget> createState() => _TableTwoWidgetState();
}

class _TableTwoWidgetState extends State<TableTwoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("NAME")),
              DataColumn(label: Text("Price")),
            ],
            source: TableThree(),
          ),
        ],
      ),
    );
  }
}

class TableThree extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            'id': index,
            'name': "Titile $index",
            'price': Random().nextInt(700)
          });
  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(
          Text(_data[index]['id'].toString()),
        ),
        DataCell(
          Text(_data[index]['name'].toString()),
        ),
        DataCell(
          Text(_data[index]['price'].toString()),
        )
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
