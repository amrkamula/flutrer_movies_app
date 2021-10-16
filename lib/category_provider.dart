import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier{
  List<String> _categories = ['Most Popular','Top Rated','Now Playing'];
  int _selectedCategory =0;

  List<String> get categories => _categories;
  int get selectedCategory => _selectedCategory;

  void changeCategory(int  index){
    _selectedCategory = index;
    notifyListeners();
}



}