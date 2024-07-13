import 'package:flutter/material.dart';
import 'package:mobileapp/models/user_model.dart';
import 'package:mobileapp/provider/data_provider.dart';
import 'package:mobileapp/services/api/category_service.dart';
import 'package:mobileapp/services/api/user_service.dart';
import 'package:mobileapp/services/local/message_service.dart';
import 'package:mobileapp/widgets/button_wiget.dart';
import 'package:provider/provider.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _middleNametController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.99,
      child: SingleChildScrollView(
        child: Column(
          children: [
            PaginatedDataTable(
              header: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Users list",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  CustomButtonWidget(
                      text: "Add User",
                      onPressed: () {
                        _addUser(context);
                      })
                ],
              ),
              showEmptyRows: false,
              columns: [
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Role")),
                DataColumn(label: Text("Email")),
                DataColumn(label: Text("First name")),
                DataColumn(label: Text("Middle name")),
                DataColumn(label: Text("Last name")),
              ],
              source: UsesDataSource(Provider.of<DataProvider>(context).users),
            ),
          ],
        ),
      ),
    );
  }

  _addUser(BuildContext contex) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              _emailController.text = '';
              _passwordController.text = '';
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
                "email": _emailController.text,
                "password": _passwordController.text,
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
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hoverColor: Colors.blue,
                    suffixIconColor: Colors.grey,
                    fillColor: Colors.blueGrey,
                    suffix: Icon(Icons.close),
                    label: Text(
                      "Email",
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
                //password
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hoverColor: Colors.blue,
                    suffixIconColor: Colors.grey,
                    fillColor: Colors.blueGrey,
                    suffix: Icon(Icons.close),
                    label: Text(
                      "Password",
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

  _handleSubmit(Map<String, dynamic> json) async {
    final Map<String, dynamic> _response = await UserService().addUser(json);
    // print(_response);
    SnackBarService.showSnackBar(context, _response['message'],
        _response['success'] ? Colors.greenAccent : Colors.redAccent);

    if (_response['success']) {
      _emailController.text = '';
      _passwordController.text = '';
      _firstNameController.text = '';
      _middleNametController.text = '';
      _lastNameController..text = '';
      WidgetsBinding.instance!.addPostFrameCallback((_) =>
          {Provider.of<DataProvider>(context, listen: false).fetchUsers()});
      return true;
    } else {
      return false;
    }
  }
}

class UsesDataSource extends DataTableSource {
  final List<User> _users;
  UsesDataSource(this._users);
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_users[index].id.toString())),
      DataCell(Text(_users[index].role.toString())),
      DataCell(Text(_users[index].email.toString())),
      DataCell(Text(_users[index].firstName.toString())),
      DataCell(Text(_users[index].middleName.toString())),
      DataCell(Text(_users[index].lastName.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _users.length;

  @override
  int get selectedRowCount => 0;
}
