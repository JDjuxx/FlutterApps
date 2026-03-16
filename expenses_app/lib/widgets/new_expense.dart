import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense newExpense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  // void _setTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(2010, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    // .then((value){
    // },);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final amountIsValid = double.tryParse(_amountController.text) == null ||
        double.tryParse(_amountController.text)! <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsValid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Make sure all fields are fill'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Okaaay Makey'),
            ),
          ],
        ),
      );
      return;
    } else {
      widget.onAddExpense(Expense(
          _titleController.text,
          double.tryParse(_amountController.text)!,
          _selectedDate!,
          _selectedCategory));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 40,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            label: Text('Escribe el gasto que realizaste'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Ingresa el dinero que gastaste'),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 40,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('Escribe el gasto que realizaste'),
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? 'Sin seleccionar'
                                  : formatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: Icon(Icons.date_range),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Ingresa el dinero que gastaste'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? 'Sin seleccionar'
                                  : formatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: Icon(Icons.date_range),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 21,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: Text('Guardar Gasto'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: Text('Guardar Gasto'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
