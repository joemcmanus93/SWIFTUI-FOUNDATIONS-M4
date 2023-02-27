//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by joe mcmanus on 22/02/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .bold()
                .font(.largeTitle)
            
            GeometryReader { geo in
              
                TabView {
                    
                    //            loop through each recipe
                    ForEach(0..<model.recipes.count, id: \.self){ index in
                        
                        //                only show those that should be featured
                        if model.recipes[index].featured == true {
                            
                            //                    recipe card
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0){
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                                
                            } .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .shadow(color: .black, radius: 10, x:-5, y: 5)
                           
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                 Text("PreperationTime:")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights:")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
        .padding()
        
        }
        
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
