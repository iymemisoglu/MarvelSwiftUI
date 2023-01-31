//
//  ContentView.swift
//  Marvel
//
//  Created by İlker Yasin Memişoğlu on 29.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var characterViewModel = CharacterViewModel()
    
    let webService = WebService()
    
    @State var character = [Character]()
    
    //.adaptive(minimum: 120)
    let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    var body: some View {
        
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 40) {
                        ForEach(characterViewModel.character, id: \.id) { item in
                            NavigationLink(destination: DetailView(chosenCharacter: item)) {
                                VStack {
                                    if let path = item.thumbnail?.path, let ext = item.thumbnail?.imgExt {
                                        
                                        let stringURL = "\(path).\(ext)"
                                        let replacedString = stringURL.replacingOccurrences(of: "http", with: "https")
                                        
                                        AsyncImage(url: URL(string: replacedString )) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image.resizable()
                                                    .frame(width: 160, height: 180)
                                                    .aspectRatio(contentMode: .fill)
                                                
                                                
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
                                    
                                    if let name = item.name {
                                        Text(name).frame(width: (UIScreen.main.bounds.width/2)-40, height: 30)
                                            .scaledToFit()
                                            .minimumScaleFactor(0.3)
                                            .backgroundStyle(.gray)
                                    }
                                }.frame(width: 160, height: 180)
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: .infinity)
                .navigationTitle("Marvel Characters")
                .font(.largeTitle)
                .padding(.top)
                
                
            }

        .onAppear(){
           
 
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
