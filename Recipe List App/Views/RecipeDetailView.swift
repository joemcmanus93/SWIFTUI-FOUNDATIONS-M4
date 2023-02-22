//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by joe mcmanus on 12/02/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
//            MARK: Recipe Image
                 Image(recipe.image)
                     .resizable()
                     .scaledToFill()
     //            MARK: Ingredients
                 VStack(alignment: .leading){
                     Text("Ingredients")
                         .font(.headline)
                         .padding(.bottom, 2)
                     
                     ForEach (recipe.ingredients) {item in
                         Text("· " + item.name)
                             .padding(.bottom, 1)
                     }
                 }
                 .scenePadding()
//                MARK: Divider
                Divider()
                
                 //            MARK: Directions
                 VStack(alignment: .leading) {
                     Text("Directions")
                         .font(.headline)
                         .padding([.bottom, .top], 5)
                     
                     ForEach(0..<recipe.directions.count, id: \.self) {index in
                         Text(String(index+1) + ". " + recipe.directions[index])
                             .scenePadding()
                     }
                 }
                 .scenePadding()
            }
            
//
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
//        create a dummy recipe and pass it in to the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
