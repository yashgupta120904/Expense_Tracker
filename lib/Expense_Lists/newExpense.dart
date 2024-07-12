import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Newexpense extends StatefulWidget {
  const Newexpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<Newexpense> createState() {
    return Newexpensestate();
  }
}

class Newexpensestate extends State<Newexpense> {
  // var titleInputentered = '';

  // void saveTitleInput(String inputvalue) {
  //   titleInputentered = inputvalue;
  // }

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  var selectedvalue = Category.food;

  void datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 10, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void errorchecker() {
    final enteredamount = double.tryParse(amountController.text);
    // tryphase('hello') => null ,tryphase('1.22')=>1.22
    final amountisinvalid = enteredamount == null || enteredamount <= 0;
    if (titleController.text.trim().isEmpty ||
        amountisinvalid ||
        selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.black,
                title: const Text("invaild Input",style:TextStyle(color: Colors.white ,
                fontWeight: FontWeight.bold,
                )),
                content: const Text("please enter vaild amount,date and title",style:TextStyle(color: Colors.white ,
                fontWeight: FontWeight.bold,
                )),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("okay"))
                ],
              ));
      return;
    }
    widget.onAddExpense(Expense(
        title: titleController.text,
        amount: enteredamount,
        date: selectedDate!,
        category: selectedvalue));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        
        
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
      
               const Text("EXPENSE DETAILS", style: 
                  TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),),
      
                  const SizedBox(height: 4),
      
      
            TextField(
              
              //onChanged: saveTitleInput,
              style:const TextStyle(color: Colors.white,),
              
              maxLength: 50,
              controller: titleController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                label: Text("Title",style:TextStyle(color: Colors.white ,
                fontWeight: FontWeight.bold,
                )),
                // enabledBorder: OutlineInputBorder
                // )
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefix: Icon(
                        Icons.currency_rupee_sharp,
                        size: 14,color: Colors.white,
                      ),
                      label: Text("Amount",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      // enabledBorder: OutlineInputBorder
                      // )
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(selectedDate == null
                          ? 'No date selected'
                          : formatter.format(selectedDate!),style:const TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,fontSize: 15),),
                      // ! assumed to dart is not be null
                      IconButton(
                          onPressed: datePicker,
                          icon: const Icon(Icons.calendar_month_sharp,color: Colors.white,))
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                DropdownButton(
                  dropdownColor: Color.fromARGB(255, 28, 1, 40),
                    value: selectedvalue,
                    items: Category.values
                        .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase(),style: const TextStyle(color: Colors.white),),))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        selectedvalue = value;
                      });
                    }),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:const Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child:  Text("cancel",style: TextStyle(fontSize: 17),),
                    )),
                ElevatedButton(
                    onPressed: errorchecker, child: const Text("save expense"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
