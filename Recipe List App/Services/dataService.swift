//
//  dataService.swift
//  Recipe List App
//
//  Created by joe mcmanus on 11/02/2023.
//

import Foundation

class dataService {
    
   static func getLocalData() -> [Recipe] {
        
//        parse local json file
        
//        get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
//        check if pathString is not nil otherwise...
        guard pathString != nil else{
            return [Recipe]()
        }
//        create a url object
        let url = URL(filePath: pathString!)
        
        do {
            //        create a data object
            let data = try Data(contentsOf: url)
            
    //        decode the data with json decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
        //        add the unique id's
                for r in recipeData{
                    r.id = UUID()
                    
//                    add unique ID'd to ingredients
                    for i in r.ingredients{
                        i.id = UUID()
                    }
                    
                }
        //        return the recipes
                return recipeData
            }
            catch{
//                error with parse json
                print(error)
            }
          
            
        }
        catch {
//            error with getting date
            print(error)
        }
        return [Recipe]()
    }
}
