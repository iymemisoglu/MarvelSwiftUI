//
//  DetailView.swift
//  Marvel
//
//  Created by İlker Yasin Memişoğlu on 30.01.2023.
//

import SwiftUI

struct DetailView: View {
    
    let contentView = ContentView()
    let webService = WebService()
    var chosenCharacter : Character
    var body: some View {
        ScrollView { 
            VStack {
                
                
                if let path = chosenCharacter.thumbnail?.path, let ext = chosenCharacter.thumbnail?.imgExt {
                    
                    let stringURL = "\(path).\(ext)"
                    let replacedString = stringURL.replacingOccurrences(of: "http", with: "https")
                    AsyncImage(url: URL(string: replacedString )) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height/2)
                                .aspectRatio(contentMode: .fit)
                            
                            
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            // Since the AsyncImagePhase enum isn't frozen,
                            // we need to add this currently unused fallback
                            // to handle any new cases that might be added
                            // in the future:
                            EmptyView()
                        }
                    }
                }
                if let name = chosenCharacter.name, let description = chosenCharacter.description {
                    VStack {
                        
                            Text(name)
                                .font(.largeTitle)
                                .foregroundColor(.accentColor)
                                .frame(maxWidth:.infinity, alignment: .leading)

                            Text(description)
                                .font(.title3)
                                .foregroundColor(.black)
                                .frame(maxWidth:.infinity, alignment: .leading)

                        Spacer()
                    }.padding()
                    
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(chosenCharacter: ContentView().character[1])
    }
}
