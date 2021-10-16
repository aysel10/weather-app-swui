//
//  ContentView.swift
//  WeatherAppSWUI
//
//  Created by icelkas on 16/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            TextField("Enter city name", text: self.$weatherVM.cityName){
                self.weatherVM.search()
                print("asdads")
            }.padding().font(.custom("Arial", size: 40))
            
            Text(self.weatherVM.temperature)
                .foregroundColor(.white)
                .padding()
                .font(.custom("Arial", size: 25))
                .offset(y: 50)
                
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
