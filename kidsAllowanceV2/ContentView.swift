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
                    .border(Color.black, width: 2)
                    
            
             
                VStack {
                    //Call Menu
                    Menu()
                    
                    } //Menu ZStack Ends
                    .padding(.horizontal, 110)
                
            } //End ZStack Image
    
                
            .navigationBarTitle(Text("Home 🏠"))
        
        } //End Navigation End
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
