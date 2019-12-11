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
        
            
      
              
            ZStack(alignment: .top) {
                
                
                
    
                Image("Other_VCBackground")
                    .resizable()
                    .scaledToFill()
                    .border(Color.black, width: 2)
                    .padding(.vertical, -150)
                    
                    
         
                     
            
                
                ZStack {
                    
                  
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.blue)
                    .overlay(Rectangle().stroke(Color.black,lineWidth: 4))
    
                    
                    Capsule()
                        .frame(width: 200, height: 30)
                        .foregroundColor(Color.red)
                        .overlay(Capsule().stroke(Color.black,lineWidth: 4))
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.green)
                        .overlay(Circle().stroke(Color.black,lineWidth: 4))
                    
                    Text("🤪")
                        .font(.system(size: 40))
                        
                        
                }//ZStack Ends
                  
                    .padding(.vertical, 200)
                    
                VStack {
                    Spacer().frame(height: 50)
                    
                    Text("Kiddy Payroll")
                        .font(.largeTitle)
                        .foregroundColor(Color.blue)
                }
                
                
                
                
                VStack {
                    
        
                    //Call Menu
                    Menu()
                
                    } //Menu ZStack Ends
                    
                
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
