import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/service/bookmark_recipe.dart';

class BookmarkControl{
  final BookmarkService _bookmarkService =BookmarkService();

  Future<List<RecipeModel>>getBookMRecipies()async{
    try{
      await _bookmarkService.open();
      var data = await _bookmarkService.getAllRecipe();
      if(data !=null){
        print('All recipes: $data');
        await _bookmarkService.close();
        return data;
      }
    }catch(e){
      print(e);
    }
    await _bookmarkService.close();
    return [];
  }

  addRecipeBookmark(RecipeModel recipeModel)async{
    try{
      await _bookmarkService.open();
    _bookmarkService.insert(recipeModel);
    await getBookMRecipies();
    await _bookmarkService.close();
    }catch(e){
      print(e);
    }

  }

  removeRecipeBookmark(int id)async{
    try{
      await _bookmarkService.open();
      _bookmarkService.delete(id);
      await getBookMRecipies();
      await _bookmarkService.close();
    }catch(e){
      print(e);
    }
  }
}

