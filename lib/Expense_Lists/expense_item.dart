import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Expense_item extends StatelessWidget {
  const Expense_item({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(context) {
    return Container(
      child: Card(
        color: const Color.fromARGB(255, 0, 33, 48),
               
        
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Text(expense.title , style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
                color: Colors.white,),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                     const Icon(Icons.currency_rupee_sharp,size: 16,color: Colors.white,),
      
                    Text(expense.amount.toStringAsFixed(2),style: const TextStyle(
                      color: Colors.white
                    ),),
                    //12.22233 =>12.22
                    const Spacer(),
                    Row(
                      children: [
                        Icon( catgoryIcon[expense.category],color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(expense.dateformatted,
                        style:const  TextStyle(color: Colors.white),),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
