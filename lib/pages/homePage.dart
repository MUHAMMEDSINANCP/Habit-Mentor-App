// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../services.dart/lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    void addToHabitList(String habitName, String habitDescription) {
      habitList.add([false, habitName, habitDescription, Icon(Icons.abc)]);
    }

    void addHabit(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController habitNameController =
                TextEditingController(text: "Habit Name");
            TextEditingController habitDescriptionController =
                TextEditingController(
              text: "Habit Description",
            );
            return AlertDialog(
              title: Text("Add a Habit"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: 'Enter a new habit here'),
                    controller: habitNameController,
                  ),
                  TextFormField(
                    controller: habitDescriptionController,
                    decoration:
                        InputDecoration(hintText: 'Enter a description'),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        surfaceTintColor:
                            MaterialStateProperty.all(Colors.redAccent)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        surfaceTintColor:
                            MaterialStateProperty.all(Colors.purpleAccent)),
                    onPressed: () {
                      setState(() {
                        addToHabitList(habitNameController.text,
                            habitDescriptionController.text);
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Save"))
              ],
            );
          });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Add New Habit",
        mini: false,
        backgroundColor: Colors.purple,
        onPressed: (() {
          addHabit(context);
        }),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(children: [
                  Image.asset('assets/MainBackground.png'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 140, 0, 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(children: [
                        Text(
                          "Hey Sinan CP!",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "You have ${habitList.length - counter} habits left for today",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ]),
                    ),
                  )
                ]),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Keep Going!",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 16),
                          ),
                          Text(
                              habitList.isEmpty
                                  ? '0%'
                                  : "${((counter / (habitList.isNotEmpty ? habitList.length : 1)) * 100).round()}%",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 16))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          minHeight: 12,
                          color: Colors.deepPurpleAccent,
                          backgroundColor: Color.fromARGB(255, 192, 170, 250),
                          value: habitList.isEmpty
                              ? 0.0 // Set to 0.0 if habitList is empty
                              : counter <= 0 || habitList.isEmpty
                                  ? 0.0 // Set to 0.0 if either counter or habitList's length is zero or negative
                                  : (counter / habitList.length)
                                      .clamp(0.0, 1.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Divider(),
                    ),
                    SizedBox(
                      child: habitList.isEmpty
                          ? Center(
                              // Display a message when habitList is empty
                              child: Text(
                                'Your habit list is empty!',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: habitList.length,
                              itemBuilder: (context, int index) {
                                return Dismissible(
                                  direction: DismissDirection.endToStart,
                                  key: Key(habitList[index][1]),
                                  onDismissed: (direction) {
                                    setState(() {
                                      List<dynamic> deletedHabit = habitList[
                                          index]; // Store the deleted habit temporarily
                                      if (habitList[index][0] == true) {
                                        counter--;
                                      }
                                      habitList.removeAt(index);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '${deletedHabit[1]} deleted'), // Display the habit name
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              setState(() {
                                                habitList.insert(index,
                                                    deletedHabit); // Undo delete using stored habit
                                                if (deletedHabit[0] == true) {
                                                  counter++;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.delete, color: Colors.white),
                                        SizedBox(height: 5),
                                        Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Colors
                                                  .white), // Change label color here
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: ListTile(
                                      title: Text(habitList[index][1]),
                                      subtitle: Text(habitList[index][2]),
                                      trailing: habitList[index][3],
                                      leading: Checkbox(
                                        value: habitList[index][0],
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == false) {
                                              counter--; // Decrement counter if checkbox is unchecked
                                            } else {
                                              counter++; // Increment counter if checkbox is checked
                                            }
                                            habitList[index][0] =
                                                value; // Update checkbox value in the list
                                          });
                                        },
                                      )),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
