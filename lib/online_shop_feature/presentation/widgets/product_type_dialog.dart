import 'package:flutter/material.dart';

class ProductTypeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Categories'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Тип товара 1'),
            onTap: () {
              // Действие при выборе типа товара 1
              Navigator.pop(context); // Закрыть диалоговое окно
            },
          ),
          ListTile(
            title: Text('Тип товара 2'),
            onTap: () {
              // Действие при выборе типа товара 2
              Navigator.pop(context); // Закрыть диалоговое окно
            },
          ),
          // Добавьте другие варианты типов товаров при необходимости
        ],
      ),
    );
  }
}