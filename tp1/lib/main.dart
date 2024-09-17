import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Currency Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  String _selectedCurrency = 'USD';
  TextEditingController _amountController = TextEditingController();
  String _result = '';

  void _convertCurrency() {
    double rate = _selectedCurrency == 'USD' ? 0.85 : 1.18; // Example rates
    double amount = double.tryParse(_amountController.text) ?? 0;
    double convertedAmount = amount * rate;
    setState(() {
      _result = '$amount $_selectedCurrency = $convertedAmount ${_selectedCurrency == 'USD' ? 'EUR' : 'USD'}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Currency Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // EditText equivalent
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Enter amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // Radio Buttons in a Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: const Text('USD'),
                    leading: Radio<String>(
                      value: 'USD',
                      groupValue: _selectedCurrency,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedCurrency = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('EUR'),
                    leading: Radio<String>(
                      value: 'EUR',
                      groupValue: _selectedCurrency,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedCurrency = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Button
            ElevatedButton(
              onPressed: _convertCurrency,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            // TextView equivalent
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                _result,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}