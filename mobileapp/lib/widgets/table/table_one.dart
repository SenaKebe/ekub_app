import 'package:flutter/material.dart';

class CustomeTableWidget extends StatefulWidget {
  const CustomeTableWidget({super.key});

  @override
  State<CustomeTableWidget> createState() => _CustomeTableWidgetState();
}

class _CustomeTableWidgetState extends State<CustomeTableWidget> {
  String sortOrder = "ASC";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, const Color.fromARGB(255, 202, 211, 216)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //left part
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bills Summmary",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            "Bills Summmary",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
                    ),
                    //right part
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //input field
                          // CustomeButtonWidget(),
                          // CustomAvatorWidget(),
                          // CustomeInputWidget(),
                          // CustomeCurvedLableWidget(),

                          //dropdown button
                          // CustomeDropeDownWidget(
                          //   value: sortOrder,
                          //   onTap: sortChange,
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sortChange(String? val) {
    if (val != null) {
      setState(() {
        sortOrder = val;
      });
    }
  }
}

class CustomeInputWidget extends StatefulWidget {
  const CustomeInputWidget({super.key});

  @override
  State<CustomeInputWidget> createState() => _CustomeInputWidgetState();
}

class _CustomeInputWidgetState extends State<CustomeInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: 'Enter your username',
          hintText: "search",
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          prefix: IconButton(
            padding: EdgeInsets.only(right: 10),
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: Color.fromARGB(255, 80, 79, 79),
          ),
          labelStyle: TextStyle(
            fontSize: 10,
            fontStyle: FontStyle.italic,
            color: Colors.blueAccent,
          ),
        ),
        keyboardType: TextInputType.name,
      ),
    );
  }
}

class CustomeDropeDownWidget extends StatefulWidget {
  const CustomeDropeDownWidget(
      {super.key, required this.value, required this.onTap});
  final String value;
  final Function(String?) onTap;

  @override
  State<CustomeDropeDownWidget> createState() => _CustomeDropeDownWidgetState();
}

class _CustomeDropeDownWidgetState extends State<CustomeDropeDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: [
        DropdownMenuItem(
          child: Text("ASC"),
          value: "ASC",
        ),
        DropdownMenuItem(
          child: Text("DES"),
          value: "DES",
        ),
      ],
      onChanged: (value) {
        widget.onTap(value);
      },
      value: widget.value,
    );
  }
}

class CustomeButtonWidget extends StatefulWidget {
  const CustomeButtonWidget({super.key});

  @override
  State<CustomeButtonWidget> createState() => _CustomeButtonWidgetState();
}

class _CustomeButtonWidgetState extends State<CustomeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(
              Icons.add,
              size: 16,
              color: Colors.white,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "Add user",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAvatorWidget extends StatelessWidget {
  const CustomAvatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ClipOval(
        child: Image.network(
          "https://media.istockphoto.com/id/1316604492/photo/profile-portrait-of-middle-aged-man-over-grey-background.jpg?s=1024x1024&w=is&k=20&c=PPGsTk2lZ78xFf3jbBbVKyQ4TU-UoBv62R6WBNuRxWM=",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CustomeCurvedLableWidget extends StatelessWidget {
  const CustomeCurvedLableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color.fromARGB(164, 130, 178, 255).withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.blueAccent,
        ),
      ),
      child: Text(
        "new order",
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
