//
//  ContentView.swift
//  Recipe List App
//
//  Created by joe mcmanus on 10/02/2023.
//

import SwiftUI

struct RecipeListView: View{

//        reference the model
    @EnvironmentObject var model:RecipeModel

    var body: some View {
      
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(destination: RecipeDetailView(recipe: r), label:
                                
                                
//                                MARK: Row item
                               { HStack(spacing: 20.0){
                    Image(r.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .cornerRadius(5)
                    Text(r.name)}
                })
                
              
            }
            .navigationBarTitle("All Recipes")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
