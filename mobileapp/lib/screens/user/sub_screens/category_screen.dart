import 'package:flutter/material.dart';
import 'package:mobileapp/models/category_model.dart';
import 'package:mobileapp/provider/data_provider.dart';
import 'package:mobileapp/services/api/category_service.dart';
import 'package:mobileapp/services/local/message_service.dart';
import 'package:mobileapp/utils/time_date_formater.dart';
import 'package:mobileapp/widgets/button_wiget.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _commitionController = TextEditingController();
  TextEditingController _totalCountController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _collectionCycleController = TextEditingController();
  String cycle = "daily";
  @override
  void initState() {
    super.initState();
    _collectionCycleController.text = cycle;
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<DataProvider>(context).categories[0].lots);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PaginatedDataTable(
              showEmptyRows: false,
              sortAscending: true,
              header: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category list",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  CustomButtonWidget(
                    text: "Add Category",
                    onPressed: _addCategoryForm,
                  ),
                ],
              ),
              columns: [
                DataColumn(
                  label: Text("ID"),
                ),
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Duration"),
                ),
                DataColumn(
                  label: Text("Total count"),
                ),
                DataColumn(
                  label: Text("Created At"),
                ),
              ],
              source: CategoryTableDataSource(
                Provider.of<DataProvider>(context).categories,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(Map<String, dynamic> jsonData) async {
    final Map<String, dynamic> _response =
        await CategoryService().addCategory(jsonData);
    SnackBarService.showSnackBar(context, _response['message'],
        _response['success'] ? Colors.greenAccent : Colors.redAccent);
    //
    if (_response['success']) {
      WidgetsBinding.instance!.addPostFrameCallback((_) =>
          {Provider.of<DataProvider>(context, listen: false).fetchCategory()});
      return true;
      // }
    } else {
      return false;
    }
  }

  _addCategoryForm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.98),
        actions: [
          InkWell(
            child: Text(
              "save",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Map<String, dynamic> _jsonData = {
                "name": _nameController.text,
                "amount": int.parse(_amountController.text),
                "commition": int.parse(_commitionController.text),
                "totalCount": 78, //int.parse(_totalCountControler.text),
                "duration": _durationController.text,
                "collectionCycle": _collectionCycleController.text
              };
              _handleSubmit(_jsonData);
              _nameController.text = "";
              _amountController.text = "";
              _commitionController.text = "";
              _totalCountController.text = "";
              _durationController.text = "";
              _collectionCycleController.text = "";
              Navigator.of(context).pop();
            },
          ),
          InkWell(
            child: Text(
              "cancel",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              _nameController.text = "";
              _amountController.text = "";
              _commitionController.text = "";
              _totalCountController.text = "";
              _durationController.text = "";
              _collectionCycleController.text = "";

              Navigator.of(context).pop();
            },
          ),
        ],
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //name
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hoverColor: Colors.blue,
                  suffixIconColor: Colors.grey,
                  fillColor: Colors.blueGrey,
                  suffix: Icon(Icons.close),
                  label: Text(
                    "name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // amount
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hoverColor: Colors.blue,
                  suffixIconColor: Colors.grey,
                  fillColor: Colors.blueGrey,
                  suffix: Icon(Icons.close),
                  label: Text(
                    "amount",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //commition
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _commitionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hoverColor: Colors.blue,
                  suffixIconColor: Colors.grey,
                  fillColor: Colors.blueGrey,
                  suffix: Icon(Icons.close),
                  label: Text(
                    "commition",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //total count
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _totalCountController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hoverColor: Colors.blue,
                  suffixIconColor: Colors.grey,
                  fillColor: Colors.blueGrey,
                  suffix: Icon(Icons.close),
                  label: Text(
                    "total commition",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //collection cycle
              DropdownButton<String>(
                items: [
                  //
                  DropdownMenuItem(
                    value: "daily",
                    child: Text(
                      "daily",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "15 days",
                    child: Text(
                      "15 days",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "weekly",
                    child: Text(
                      "weekly",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "monthly",
                    child: Text(
                      "monthly",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  _onSelectData(value);
                },
                value: _collectionCycleController.text,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _durationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hoverColor: Colors.blue,
                  suffixIconColor: Colors.grey,
                  fillColor: Colors.blueGrey,
                  suffix: Icon(Icons.close),
                  label: Text(
                    "duration",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectData(String? value) {
    setState(() {
      _collectionCycleController.text = value!;
    });
  }
}

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget(
      {super.key, required this.defaultValue, required this.onSelectData});
  final String defaultValue;
  final Function(String?) onSelectData;

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    String selectedItem = widget.defaultValue;
    return DropdownButton<String>(
      items: [
        //
        DropdownMenuItem(
          value: "daily",
          child: Text(
            "daily",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
        DropdownMenuItem(
          value: "15 days",
          child: Text(
            "15 days",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
        DropdownMenuItem(
          value: "weekly",
          child: Text(
            "weekly",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
        DropdownMenuItem(
          value: "monthly",
          child: Text(
            "monthly",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
      ],
      onChanged: (value) {
        widget.onSelectData(value);
      },
      value: widget.defaultValue,
    );
  }
}

class CategoryTableDataSource extends DataTableSource {
  final List<CategoryModel> _categorys;

  CategoryTableDataSource(this._categorys);
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_categorys[index].id.toString())),
      DataCell(Text(_categorys[index].name.toString())),
      DataCell(Text(_categorys[index].duration.toString())),
      DataCell(Text(_categorys[index].totalCount.toString())),
      DataCell(Text(formatDateTime(_categorys[index].createdAt))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _categorys.length;

  @override
  int get selectedRowCount => 0;
}
