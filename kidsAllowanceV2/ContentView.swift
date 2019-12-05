//
//  ContentView.swift
//  kidsAllowanceV2
//
//  Created by Ufuoma Okoro on 04/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//
//Application to calculate Weekly, Monthly and Yearly application


import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
        
            
       
            
        
        
            ZStack(alignment: .trailing) {
            
    
                Image("Other_VCBackground")
                    .resizable()
                    .scaledToFill()
            
             
                VStack {
                //Call Menu
                    Menu()
                
                }.padding(.horizontal, 250) //Menu ZStack Ends
            
            
            } //End ZStack Image
            .edgesIgnoringSafeArea(.all)
        
        
    
        
        
        .navigationBarTitle(Text("Home 🏠"))
        
        } //End Navigation End
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
