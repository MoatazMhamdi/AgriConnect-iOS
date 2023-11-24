//
//  ContentView.swift
//  AgriConnect
//
//  Created by ZinaBenSaadallah on 8/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*  VStack {
         ForEach(farmList,id: \.id){
         Farms in Farm
         }
         }
         .padding()*/
        VStack{
            
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Farm(farm: Farms(name: "SunsetFarm", description: "khflhslsdhjfjkheef", image: "farm3", location: "fahs", size: 110.235))
    }
}
  
