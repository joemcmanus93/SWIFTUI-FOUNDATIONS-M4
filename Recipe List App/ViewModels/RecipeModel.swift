//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by joe mcmanus on 10/02/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
  
//        create an instance of data service and get the data
        self.recipes = dataService.getLocalData()
    }
}
