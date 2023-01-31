//
//  CharacterViewModel.swift
//  Marvel
//
//  Created by İlker Yasin Memişoğlu on 31.01.2023.
//

import SwiftUI

class CharacterViewModel : ObservableObject {
    
    let webService = WebService()
    
    
    @Published var character = [Character]()
    
    init () {
        fetchData()
    }
    
    
    func fetchData() {
       
        webService.getCharacter(url: webService.fullUrl) { [self] wrapper in
            switch wrapper {
                
            case .success(let response):
                
                guard let results = response.data?.results else {return}
                
                character = results
                
            case .failure(let error):
                print(error)
            }

        }
        
        
        
    }
    
    
  
    
    
    
    
   
    
}