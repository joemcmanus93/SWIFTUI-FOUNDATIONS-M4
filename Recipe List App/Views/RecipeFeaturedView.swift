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
        
        VStack(alignment: .leading){
            
            Text("Featured Recipes")
                .padding(.leading)
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
                                    Image("lasagna")
                                        .resizable()
                                        .clipped()
                                    Text("Lasagna")
                                        .padding(5)
                                }
                            } .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                           
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                 Text("PreperationTime:")
                font(.headline)
                Text("1 Hour")
                Text("Highlights:")
                font(.headline)
                Text("Healthy, Hearty")
            }
            .padding(.leading)
        }
        
        }
        
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
