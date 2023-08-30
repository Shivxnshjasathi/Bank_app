import 'package:flutter/material.dart';

void main() {
  runApp(SimpleBankingApp());
}

class SimpleBankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BankingHomePage(),
    );
  }
}

class BankingHomePage extends StatefulWidget {
  @override
  _BankingHomePageState createState() => _BankingHomePageState();
}

class _BankingHomePageState extends State<BankingHomePage> {
  Map<String, double> accounts = {
    'Account 1': 1000.0,
    'Account 2': 2500.0,
  };

  String selectedAccount = 'Account 1';

  void changeSelectedAccount(String accountName) {
    setState(() {
      selectedAccount = accountName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Banking App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Account: $selectedAccount',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Balance: \$${accounts[selectedAccount]?.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            DropdownButton<String>(
              value: selectedAccount,
              onChanged: (String? newValue) {
                changeSelectedAccount(newValue!);
              },
              items:
                  accounts.keys.map<DropdownMenuItem<String>>((String account) {
                return DropdownMenuItem<String>(
                  value: account,
                  child: Text(account),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
