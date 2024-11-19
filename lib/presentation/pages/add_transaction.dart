import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:money_trail_proj/data/dummy_Data/categorydata/Category_dummy_data.dart';
import 'package:money_trail_proj/data/models/transaction/transaction_model.dart';
import 'package:money_trail_proj/presentation/pages/analytics_page.dart';
import 'package:money_trail_proj/presentation/pages/add_categories.dart';

class Addtransactionpage extends StatefulWidget {
  const Addtransactionpage({super.key});

  @override
  _AddtransactionpageState createState() => _AddtransactionpageState();
}

class _AddtransactionpageState extends State<Addtransactionpage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _menu = 'Expense';
  String _category = 'Lifestyle';
  bool _annualOption = false;
  bool _pushNotification = false;
  bool _appreciation = false;
  double _percentage = 10.0;

  // Reset inputs except date for "Continue" button
  void _resetFields() {
    _amountController.clear();
    _noteController.clear();
    _category = 'Lifestyle';
    _annualOption = false;
    _pushNotification = false;
    _appreciation = false;
    _percentage = 10.0;
  }
  @override
  void dispose() {
    Hive.box<TransactionModel>('transaction').close();
    super.dispose();
  }

  // Show bottom drawer for category selection
  void _showCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              ...categories.map((category) {
                return _categoryButton(category.category);
              }),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCategories()));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _categoryButton(String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _category = name;
        });
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(name),
      ),
    );
  }

  // Date picker function
  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Save function to submit data
  void _saveTransaction() {
    // Save the transaction to home screen or database
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar in f
      appBar: AppBar(
        title: const Text('Transaction'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Analytics()));
            },
          ),
        ],
      ),

      // Amount widget
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),

              //menu widget
              DropdownButton<String>(
                value: _menu,
                items: [
                  'Income',
                  'Expense',
                  'Liability',
                  'Long Term Asset',
                  'Account Receivable'
                ]
                    .map((menu) =>
                        DropdownMenuItem(value: menu, child: Text(menu)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _menu = value!;
                    // Reset optional fields
                    _annualOption = false;
                    _pushNotification = false;
                    _appreciation = false;
                  });
                },
              ),

              //category widget
             const SizedBox(height: 16),
              GestureDetector(
                onTap: _showCategoryBottomSheet,
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Category'),
                  child: Text(_category),
                ),
                ),
                
              const SizedBox(height: 16),
              TextField(
                controller: _noteController,
                decoration: const InputDecoration(labelText: 'Note'),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Date'),
                  child: Text(DateFormat('dd/MM/yy (EEE)').format(_selectedDate)),
                ),
              ),

              if (_menu == 'Income' || _menu == 'Expense') ...[
                SwitchListTile(
                  title: const Text('Annual'),
                  value: _annualOption,
                  onChanged: (bool value) {
                    setState(() {
                      _annualOption = value;
                      _pushNotification = false;
                    });
                  },
                ),
                if (_annualOption)
                  SwitchListTile(
                    title: const Text('Enable Push Notification'),
                    value: _pushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        _pushNotification = value;
                        
                      });
                    },
                  ),
              ],

              
              if (_menu == 'Liability' || _menu == 'Account Receivable')
              GestureDetector(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Date'),
                  child: Text(DateFormat('dd/MM/yy (EEE)').format(_selectedDate)),
                ),
              ),
                ListTile(
                  
                  title: const Text('Enable Push Notification'),
                  trailing: Switch(
                    value: _pushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        _pushNotification = value;
                      });
                    },
                  ),
                ),


              if (_menu == 'Long Term Asset') ...[
                ListTile(
                  title: const Text('Appreciation/Depreciation'),
                  trailing: DropdownButton<bool>(
                    value: _appreciation,
                    items: const [
                      DropdownMenuItem(value: true, child: Text('Appreciation')),
                      DropdownMenuItem(value: false, child: Text('Depreciation')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _appreciation = value!;
                      });
                    },
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Percentage',
                    hintText: '$_percentage% per year',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _percentage = double.tryParse(value) ?? _percentage;
                    });
                  },
                ),
              ],

              //save and continue button
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _resetFields();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Transaction added!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );

                        // Trigger animation or indication for the user
                      },
                      child: const Text('Continue'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveTransaction,
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}