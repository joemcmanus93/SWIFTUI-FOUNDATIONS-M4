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
            
            VStack(alignment: .leading){
                Text("All Recipes")
                    .padding(.top, 40)
                    .bold()
                    .font(.largeTitle)
                
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(destination: RecipeDetailView(recipe: r), label:
                                            
                                            
                                            //                                MARK: Row item
                                           { HStack(spacing: 20.0){
                                Image(r.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .cornerRadius(5)
                                Text(r.name)
                                    .foregroundColor(.black)
                            }
                            })
                            
                        }
                    }
                }
                
            }
        }
        .padding(.leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
