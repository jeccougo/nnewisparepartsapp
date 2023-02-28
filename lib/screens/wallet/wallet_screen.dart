import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key, required List transactions}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Groceries',
      date: DateTime.now(),
      amount: 55.99,
      type: TransactionType.EXPENSE,
    ),
    Transaction(
      id: 't2',
      title: 'Salary',
      date: DateTime.now().subtract(Duration(days: 2)),
      amount: 1500.00,
      type: TransactionType.INCOME,
    ),
    Transaction(
      id: 't3',
      title: 'Rent',
      date: DateTime.now().subtract(Duration(days: 5)),
      amount: 800.00,
      type: TransactionType.EXPENSE,
    ),
    Transaction(
      id: 't4',
      title: 'Car Payment',
      date: DateTime.now().subtract(Duration(days: 8)),
      amount: 250.00,
      type: TransactionType.EXPENSE,
    ),
    Transaction(
      id: 't5',
      title: 'Freelance Work',
      date: DateTime.now().subtract(Duration(days: 10)),
      amount: 500.00,
      type: TransactionType.INCOME,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wallet',
        style: TextStyle(
          color: Colors.black45
        ),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '\$3,200.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_upward_rounded,
                          color: Colors.white,
                          size: 36.0,
                        ),
                      ),
                      Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white,
                          size: 36.0,
                        ),
                      ),
                      Text(
                        'Receive',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = _transactions[index];
                return ListTile(
                  leading: Icon(
                    transaction.type == TransactionType.EXPENSE ? Icons.arrow_circle_down : Icons.arrow_circle_up,
                    color: transaction.type == TransactionType.EXPENSE ? Colors.red : Colors.green,
                  ),
                  title: Text(transaction.title),
                  subtitle: Text(transaction.date.toString()),
                  trailing: Text(
                    '\$${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: transaction.type == TransactionType.EXPENSE ? Colors.red : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final TransactionType type;

  Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
  });
}

enum TransactionType {
  INCOME,
  EXPENSE,
}

