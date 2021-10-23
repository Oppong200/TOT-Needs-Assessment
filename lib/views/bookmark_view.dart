import 'package:flutter/material.dart';
import 'package:recipe_app/controller/bookmark_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';

//TODO: GET ALL BOOKMARKED RECIPES
//TODO: DELETE RECIPE

class BookmarkView extends StatelessWidget {
  BookmarkView({ Key? key }) : super(key: key);
  final BookmarkControl _bookmarkControl=BookmarkControl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: FutureBuilder(
        future: _bookmarkControl.getBookMRecipies(),
        builder: (context,snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting && snapshot.data==null){
            return CircularProgressIndicator();
          }

          List<RecipeModel> recipeModels=snapshot.data as List<RecipeModel>;
          return ListView.separated(itemBuilder: (context,index){
            RecipeModel recipeModel =recipeModels[index];
            return ListTile(
                  leading: Image.network(
                    recipeModel.image,
                    width: 150,
                    height: 150,
                  ),
                  title: Text(recipeModel.title),
                  subtitle: Text(recipeModel.category),
                  trailing: Icon(Icons.delete),
                  onTap: () {
                    _bookmarkControl.removeRecipeBookmark(recipeModel.id!);
                  },
                );
          }, separatorBuilder: (context,index){
            return const SizedBox(height: 15,);
          }, 
          itemCount: recipeModels.length,
          );
        }
      ),
    );
  }
}