//
//  Menu.swift
//  kidsAllowanceV2
//
//  Created by Ufuoma Okoro on 04/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

//This file deals with the menu
import SwiftUI

struct Menu: View {
    
    //Variable for all menu options
    @State var showMenuWeekly = false
    @State var showMenuMonthly = false
    @State var showMenuYearly = false
    
    
    
    var body: some View {
        
        VStack {
            
            //Push Menu down to the bottom of screen
            Spacer()
            
            if showMenuWeekly {
                HStack {
                    menuIcons(icon: "sterlingsign.circle.fill")
                        .foregroundColor(Color.green)
                    
                    
                Text("Week")
                    .font(.system(size: 14))
                    .foregroundColor(.green)
                }
            } //End of Weekly
            
            if showMenuMonthly {
                HStack {
                    menuIcons(icon: "sterlingsign.circle.fill")
                        .foregroundColor(Color.blue)
                    
                    Text("Month")
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                }
            } //End of Monthly
            
            
            if showMenuYearly {
                HStack {
                    menuIcons(icon: "sterlingsign.circle.fill")
                        
                Text("Year")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                }
            } //End of Yearly
        
            //Button for the plus sign
            Button(action: {
                
                //Call Show Menu function
                self.showMenu()
                
                
            }) {
            
            //Main Button
            HStack {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.red)
                    .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
                
            Text("Menu")
                .foregroundColor(Color.red)
                
                }.padding()
        
            } //End of Button
            
        }
        
    }
    
    
    //Function to toggle when the Plus button is pressed
    func showMenu() {
        
        //Toggle Menu with Animation
        
        withAnimation {
            self.showMenuWeekly.toggle()
            
        } //End Weekly
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            withAnimation {
                self.showMenuMonthly.toggle()
            }
        } //End Monthly
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                
                self.showMenuYearly.toggle()
            }
            
        }
        
        
    }
    
        
    
    
    
    
    
    
}//End View




struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}


//Menu Icons
struct menuIcons: View {
    
    var icon: String
    
    var body: some View {
        
        ZStack {
        
            Image(systemName: icon)
                .resizable()
                .frame(width: 55, height: 55)
                .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
        
        }
    }
}
