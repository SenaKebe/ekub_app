import 'package:flutter/material.dart';

class TableViewWidget extends StatefulWidget {
  const TableViewWidget({super.key});

  @override
  State<TableViewWidget> createState() => _TableViewWidgetState();
}

class _TableViewWidgetState extends State<TableViewWidget> {
  @override
  Widget build(BuildContext context) {
    final _columns = ["First", "last", "Age"];
    final _rows = [];
    return Container(
      child: DataTable(
        columns: _getColumns(_columns),
        rows: [],
      ),
    );
  }

  List<DataColumn> _getColumns(List<String> columns) => columns
      .map((e) => DataColumn(
            label: Text(e),
          ))
      .toList();
}
