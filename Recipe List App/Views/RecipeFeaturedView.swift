//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by joe mcmanus on 22/02/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
   
    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter({ $0.featured })
       
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .bold()
                .font(.largeTitle)
            
            GeometryReader {     geo in
              
                TabView (selection: $tabSelectionIndex) {
                    
                    //            loop through each recipe
                    ForEach(0..<featuredRecipes.count, id: \.self){ index in
                        
                   
                        
//                            recipe card button
                        Button(action: {
                            
//                                show the recipe detail sheet
                            self.isDetailViewShowing = true
                        }, label: {
                            
                            //                    recipe card
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0){
                                    Image(featuredRecipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(featuredRecipes[index].name)
                                        .padding(5)
                                }
                            }
                        })
                        .tag(index)
                        
                        .buttonStyle(PlainButtonStyle())
                         .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .shadow(color: .black, radius: 10, x:-5, y: 5)
                       
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                 Text("PreperationTime:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights:")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .sheet(isPresented: $isDetailViewShowing) {
//                                show the recipe detial view
            RecipeDetailView(recipe: featuredRecipes[tabSelectionIndex])
        }
            }
    }


struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
