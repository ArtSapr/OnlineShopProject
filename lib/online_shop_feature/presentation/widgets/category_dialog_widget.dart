import 'package:flutter/material.dart';

const ALL = "All";
const MENS_CLOTHING = "Men's clothing";
const JEWELERY = "Jewelery";
const ELECTRONICS = "Electronics";
const WOMENS_CLOTHING = "Women's clothing";

class CategoryDialog extends StatefulWidget {
  final String initialCategory;
  final ValueChanged<String> onCategorySelected;

  CategoryDialog({
    required this.initialCategory,
    required this.onCategorySelected,
  });

  @override
  _CategoryDialogState createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {

  late String _tempSelectedCategory;

  @override
  void initState() {
    super.initState();
    _tempSelectedCategory = widget.initialCategory;
  }

  void _selectCategory(String category) {
    setState(() {
      _tempSelectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.layers,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      title: const Text(
        'Categories',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _categoryChanger(textCategory: ALL, category: _tempSelectedCategory),
          const Divider(
            height: 0,
          ),
          _categoryChanger(textCategory: MENS_CLOTHING, category: _tempSelectedCategory),
          const Divider(
            height: 0,
          ),
          _categoryChanger(textCategory: JEWELERY, category: _tempSelectedCategory),
          const Divider(
            height: 0,
          ),
          _categoryChanger(textCategory: ELECTRONICS, category: _tempSelectedCategory),
          const Divider(
            height: 0,
          ),
          _categoryChanger(textCategory: WOMENS_CLOTHING, category: _tempSelectedCategory),
          const Divider(
            height: 0,
          ),

        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Text(
            'Decline',
            style: TextStyle(color: Colors.red),
          ),
        ),
        IconButton(
          onPressed: () {
            widget.onCategorySelected(_tempSelectedCategory);
            Navigator.pop(context);
          },
          icon: const Text(
            'Accept',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
  _categoryChanger({required String textCategory, required String category}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            textCategory, style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        IconButton(
          color: Colors.black,
          icon: category == textCategory ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_unchecked),
          onPressed: () => _selectCategory(textCategory),
        ),
      ],
    );
  }
}

