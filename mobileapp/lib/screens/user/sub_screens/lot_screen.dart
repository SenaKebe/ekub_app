import 'package:flutter/material.dart';
import 'package:mobileapp/screens/user/sub_screens/category_screen.dart';
import 'package:mobileapp/provider/data_provider.dart';
import 'package:mobileapp/services/api/lot_service.dart';
import 'package:mobileapp/services/local/message_service.dart';
import 'package:mobileapp/utils/time_date_formater.dart';
import 'package:mobileapp/widgets/button_wiget.dart';
import 'package:provider/provider.dart';
import 'package:mobileapp/models/lots_model.dart';

class LotoScreen extends StatefulWidget {
  const LotoScreen({super.key});

  @override
  State<LotoScreen> createState() => _LotoScreenState();
}

class _LotoScreenState extends State<LotoScreen> {
  TextEditingController _categoryIdController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _middleNametController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _genderController.text = "MALE";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PaginatedDataTable(
              showEmptyRows: false,
              arrowHeadColor: Colors.blue,
              showCheckboxColumn: true,
              header: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lotos list",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  CustomButtonWidget(
                    text: "Add Loto",
                    onPressed: _addLotForm,
                  ),
                ],
              ),
              columns: [
                DataColumn(label: Text("Id")),
                DataColumn(label: Text("Category")),
                DataColumn(label: Text("IsCompleted")),
                DataColumn(label: Text("Remaining Date")),
                DataColumn(label: Text("Created Date")),
              ],
              source: LotDataSource(
                Provider.of<DataProvider>(context).lots,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addLotForm() {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              _genderController.text = '';
              _cityController.text = '';
              _streetController.text = '';
              _categoryIdController.text = '';
              _firstNameController.text = '';
              _middleNametController.text = '';
              _lastNameController..text = '';
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () {
              final _jsonData = {
                "categoryId": int.parse(_categoryIdController.text),
                "gender": _genderController.text,
                "city": _cityController.text,
                "street": _streetController.text,
                "firstName": _firstNameController.text,
                "middleName": _middleNametController.text,
                "lastName": _lastNameController.text
              };
              _handleSubmit(_jsonData);
              Navigator.of(context).pop();
            },
          ),
        ],
        content: Padding(
          padding: EdgeInsets.all(4),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //category Id
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Colors.blueAccent, style: BorderStyle.solid),
                  ),
                  child: DropdownButton<int>(
                    items: Provider.of<DataProvider>(context)
                        .categories
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e.name),
                            value: e.id,
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      _onCategorySelect(val!.toString());
                    },
                    value: Provider.of<DataProvider>(context).categories[0].id,
                  ),
                ),

                // TextFormField(
                //   keyboardType: TextInputType.emailAddress,
                //   controller: _categoryIdController,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     hoverColor: Colors.blue,
                //     suffixIconColor: Colors.grey,
                //     fillColor: Colors.blueGrey,
                //     suffix: Icon(Icons.close),
                //     label: Text(
                //       "Category Id",
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.w200,
                //         color: Colors.blueAccent,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                //Gender
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.blueAccent,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        child: Text("MALE"),
                        value: "MALE",
                      ),
                      DropdownMenuItem(
                        child: Text("FEMALE"),
                        value: "FEMALE",
                      ),
                    ],
                    value: _genderController.text,
                    onChanged: (val) => {_onGenderChanged(val!)},
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _genderController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hoverColor: Colors.blue,
                    suffixIconColor: Colors.grey,
                    fillColor: Colors.blueGrey,
                    suffix: Icon(Icons.close),
                    label: Text(
                      "Gender",
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
                //firstname
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hoverColor: Colors.blue,
                    suffixIconColor: Colors.grey,
                    fillColor: Colors.blueGrey,
                    suffix: Icon(Icons.close),
                    label: Text(
                      "First Name",
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
                //middle name
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _middleNametController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hoverColor: Colors.blue,
                    suffixIconColor: Colors.grey,
                    fillColor: Colors.blueGrey,
                    suffix: Icon(Icons.close),
                    label: Text(
                      "Middle Name",
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
                //last name
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hoverColor: Colors.blue,
                    suffixIconColor: Colors.grey,
                    fillColor: Colors.blueGrey,
                    suffix: Icon(Icons.close),
                    label: Text(
                      "Last Name",
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
                //City
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _cityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hoverColor: Colors.blue,
                    suffixIconColor: Colors.grey,
                    fillColor: Colors.blueGrey,
                    suffix: Icon(Icons.close),
                    label: Text(
                      "City",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _streetController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hoverColor: Colors.blue,
                    suffixIconColor: Colors.grey,
                    fillColor: Colors.blueGrey,
                    suffix: Icon(Icons.close),
                    label: Text(
                      "Street",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCategorySelect(String data) {
    _categoryIdController.text = data;
  }

  void _onGenderChanged(String data) {
    _genderController.text = data;
  }

  _handleSubmit(Map<String, dynamic> json) async {
    final Map<String, dynamic> _response = await LotService().addLot(json);
    // print(_response);
    SnackBarService.showSnackBar(context, _response['message'],
        _response['success'] ? Colors.greenAccent : Colors.redAccent);

    if (_response['success']) {
      _genderController.text = '';
      _cityController.text = '';
      _streetController.text = '';
      _categoryIdController.text = '';
      _firstNameController.text = '';
      _middleNametController.text = '';
      _lastNameController..text = '';
      WidgetsBinding.instance!.addPostFrameCallback((_) =>
          {Provider.of<DataProvider>(context, listen: false).fetchLots()});
      return true;
    } else {
      return false;
    }
  }
}

class LotDataSource extends DataTableSource {
  LotDataSource(this.lots);
  final List<LotsModel> lots;
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(lots[index].id.toString())),
      DataCell(Text(lots[index].category.name.toString())),
      DataCell(Text(lots[index].isCompleted.toString())),
      DataCell(Text(lots[index].remainingDay.toString())),
      DataCell(Text((formatDateTime(lots[index].createdAt)).toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => lots.length;

  @override
  int get selectedRowCount => 0;
}
