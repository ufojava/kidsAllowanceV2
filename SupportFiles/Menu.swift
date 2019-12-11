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
    
    
    @ObservedObject var personalDetails = allowanceDetails()
    
    //Activate Navigation link
    @State private var activatedLink = false
    @State private var activateMthlyLink = false
    @State private var activateYrlyLink = false
    
    
    var body: some View {
        
        VStack {
            
            //Push Menu down to the bottom of screen
            Spacer()
            
            if showMenuWeekly {
                HStack {
                  
                  
                    //Button Action
                    Button(action: {
                        self.personalDetails.allowanceWkly = "Weekly"
                        self.activatedLink = true
                        
                    }) {
                    
                        menuIcons(icon: "sterlingsign.circle.fill")
                        .foregroundColor(Color.green)
                        
                        Text("Week")
                            .font(.system(size: 14))
                            .foregroundColor(.green)
                        }
                    
                        //Navigation Link
                    NavigationLink(destination: kidAllowance(updateWklyAllowance: $personalDetails.allowanceWkly), isActive: $activatedLink) {
                        EmptyView()
                    }
                }
                
                
            } //End of Weekly
            
        
            
            
            if showMenuMonthly {
                HStack {
                    
                    //Monthly Button Action
                    Button(action: {
                        self.personalDetails.allowanceMthly = "Monthly"
                        self.activateMthlyLink = true

                        
                    }) {
                        
                        menuIcons(icon: "sterlingsign.circle.fill")
                            .foregroundColor(Color.blue)
                        
                        Text("Month")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                        
                    }
                    
                    //Navigation Link
                    NavigationLink(destination: KidMonthlyAllowance(updateMthlyAllowance: $personalDetails.allowanceMthly), isActive: $activateMthlyLink) {
                        
                        EmptyView()
                    }
                    
                } //End of HStack
            } //End of Monthly
            
            
            
            
            
            
            //Yearly Allowance
            
            if showMenuYearly {
                HStack {
                    
                    //Yearly Button Action
                    Button(action: {
                        
                        //Set personal details to yearly
                        self.personalDetails.allowanceYrly = "Yearly"
                        self.activateYrlyLink = true
                        
                    }) {
                        
                        menuIcons(icon: "sterlingsign.circle.fill")
                            .foregroundColor(Color.black)
                                
                        Text("Year")
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                        
                        
                    }
                    
                    //Set yearly Navigation link
                    NavigationLink(destination: kidYearlyAllowance(updateYrlyAllowance: $personalDetails.allowanceYrly), isActive: $activateYrlyLink) {
                        
                        EmptyView()
                    }
                    
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
                .foregroundColor(Color.black)
                
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

struct kidAllowance: View {
    
    //Access to Observable Personal Details
    @ObservedObject var personalDetails = allowanceDetails()
    
    
    //Published Bindings - Period
    @Binding var updateWklyAllowance: String
 
    //Local Variable
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var childAge = ""
    @State private var myFace = ""
    
    
    
    
    //Calculate Weekly Allowance
    var calculateWklyAllowance: Double {
        
        
                var wklyAllowace = 0.0
                var convertAge = 0
                
                //Convert age string to Integer with a default option being zero
                convertAge = Int(self.personalDetails.age) ?? 0
        
        
                    //Weekly allowance is £5.00
                    if convertAge > 0 && convertAge < 8 {
            
                        wklyAllowace = 5.0
            
                    //Weekly allowance is £7.50
                    } else if convertAge >= 8 && convertAge <= 13  {
            
                        wklyAllowace = 7.5
            
                    //Weekly allwance is £10.00
                    } else if convertAge > 13 {
            
                        wklyAllowace = 10.0
            
                    //Else allowance is £0.0
                    } else {
                        wklyAllowace = 0.0
                    }
    
                    return wklyAllowace
        
    }//Calculate
    
    var emojiFace: String {
        
        var theEmoji = ""
        var myConvertAge = 0
        myConvertAge = Int(self.personalDetails.age) ?? 0
        
        if myConvertAge > 0 && myConvertAge <= 5{
            theEmoji = "🥺"
        } else if myConvertAge > 5 && myConvertAge < 10 {
            theEmoji = "😕"
        } else if myConvertAge >= 10 {
            theEmoji = "🤪"
        }
        
        return theEmoji
    }

    
    
    var body: some View {
        
        NavigationView {
            
            
            ZStack {
                
                Image("Other_VCBackground")
                    .resizable()
                    .scaledToFill()
                    .padding(.vertical, -150)
                
                    
    
            VStack {
            
                VStack {
                        Text("Enter Child Details")
                            .foregroundColor(Color.blue)
                            .font(.system(size: 20))
                        
                    
                }
                
                        TextField("Enter your firstname",text: $firstName)
                            .border(Color.gray, width: 0.2)
                        
                
                        TextField("Enter your lastname",text: $lastName)
                            .border(Color.gray, width: 0.2)

                    
                        TextField("Enter your age",text: $personalDetails.age)
                            .border(Color.gray, width: 0.2)
                        
                        Spacer().frame(height: 40)
                        
             
                        
                        Text("Allowance Details")
                            .foregroundColor(Color.blue)
                            .font(.system(size: 20))
                
            
            
                        Text("You name is \(firstName) \(lastName)")
    
                        Text("Age \(self.personalDetails.age)")
                
                HStack {
            
                        Text("Your \(updateWklyAllowance) allowance is £\(calculateWklyAllowance,specifier: "%.2f")")
                        Text("\(emojiFace)")
                            .font(.system(size: 40))
            
                }
                        
                        
                        Spacer().frame(height: 450) //Push text to top of screen
        
                
                } //End of VStack
                
                .font(.system(size: 14))
                .autocapitalization(.words)
                .padding(.horizontal, 200)
                
                
                
            
                ZStack {
                    
                    
                    Capsule()
                    .foregroundColor(Color.blue)
                    .frame(width: 140, height: 20)
                    .overlay(Capsule().stroke(Color.black,lineWidth: 2))
                    
                    
                    Rectangle()
                        .foregroundColor(Color.red)
                        .frame(width: 100, height: 100)
                        .overlay(Rectangle().stroke(Color.black,lineWidth: 2))
                    
                    
                    
                    Circle()
                        .foregroundColor(Color.green)
                        .frame(width: 80, height: 80)
                        .overlay(Circle().stroke(Color.black,lineWidth: 2))
                    
                    Text("🏧")
                        .font(.system(size: 40))
                    
                    
                        
                    
                        
                    
                        
                    
                }
                
                
                
            }
          
               
               
            
            
        
        }.navigationBarTitle(Text("Weekly Allowance"), displayMode: .inline)
        
    
    }
}
    
    
    //Monthly Allowance
    struct KidMonthlyAllowance: View {
        
        //Access to Observable Personal Details
        @ObservedObject var personalDetails = allowanceDetails()
        
        
        //Bindings for the monthly updates
        @Binding var updateMthlyAllowance: String
        
        
        @State private var firstName = ""
        @State private var lastName = ""
        @State private var childAge = ""
        
        
        //Calculate Monthly Allowance
        var calculateMthlyAllowance: Double {
            
            
            var wklyAllowance = 0.0
            var mthlyAllowace = 0.0
            var convertAge = 0
                        
                //Convert age string to Integer with a default option being zero
                convertAge = Int(self.personalDetails.age) ?? 0
                
                
                    //Monthly allowance for up to 7 years
                    if convertAge > 0 && convertAge < 8 {
                        
                        wklyAllowance = 5.0
                        mthlyAllowace = wklyAllowance * 4
                    
                        //Monthly Allowance for less than 13 years
                        } else if convertAge >= 8 && convertAge <= 13  {
                            
                            wklyAllowance = 7.5
                            mthlyAllowace = wklyAllowance * 4
                    
                        //Monthly Allowance for 13 years and over
                        } else if convertAge > 13 {
                    
                            wklyAllowance = 10.0
                            mthlyAllowace = wklyAllowance * 4
                    
                        //Else allowance is £0.0
                        } else {
                            mthlyAllowace = 0.0
                        }
            
                            return mthlyAllowace
            
        }//End Calculation
        
        var emojiFace: String {
            
            var theEmoji = ""
            var myConvertAge = 0
            myConvertAge = Int(self.personalDetails.age) ?? 0
            
            if myConvertAge > 0 && myConvertAge <= 5{
                theEmoji = "🥺"
            } else if myConvertAge > 5 && myConvertAge < 10 {
                theEmoji = "😕"
            } else if myConvertAge >= 10 {
                theEmoji = "🤪"
            }
            
            return theEmoji
        }
        
        
        var body: some View {
            
            
            NavigationView {
                         
                         
                         ZStack {
                             
                             Image("Other_VCBackground")
                                 .resizable()
                                 .scaledToFill()
                                 .padding(.vertical, -150)
                             
                                 
                 
                         VStack {
                         
                             VStack {
                                     Text("Enter Child Details")
                                         .foregroundColor(Color.blue)
                                         .font(.system(size: 20))
                                     
                                 
                             }
                             
                                     TextField("Enter your firstname",text: $firstName)
                                         .border(Color.gray, width: 0.2)
                                     
                             
                                     TextField("Enter your lastname",text: $lastName)
                                         .border(Color.gray, width: 0.2)

                                 
                                     TextField("Enter your age",text: $personalDetails.age)
                                         .border(Color.gray, width: 0.2)
                                     
                                     Spacer().frame(height: 40)
                                     
                          
                                     
                                     Text("Allowance Details")
                                         .foregroundColor(Color.blue)
                                         .font(.system(size: 20))
                             
                         
                         
                                     Text("You name is \(firstName) \(lastName)")
                 
                                     Text("Age \(self.personalDetails.age)")
                             
                             HStack {
                         
                                     Text("Your \(updateMthlyAllowance) allowance is £\(calculateMthlyAllowance,specifier: "%.2f")")
                                     Text("\(emojiFace)")
                                         .font(.system(size: 40))
                         
                             }
                                     
                                     
                                     Spacer().frame(height: 450) //Push text to top of screen
                     
                             
                             } //End of VStack
                             
                             .font(.system(size: 14))
                             .autocapitalization(.words)
                             .padding(.horizontal, 200)
                             
                             
                             
                         
                             ZStack {
                                 
                                 
                                 Capsule()
                                 .foregroundColor(Color.blue)
                                 .frame(width: 140, height: 20)
                                 .overlay(Capsule().stroke(Color.black,lineWidth: 2))
                                 
                                 
                                 Rectangle()
                                     .foregroundColor(Color.red)
                                     .frame(width: 100, height: 100)
                                     .overlay(Rectangle().stroke(Color.black,lineWidth: 2))
                                 
                                 
                                 
                                 Circle()
                                     .foregroundColor(Color.green)
                                     .frame(width: 80, height: 80)
                                     .overlay(Circle().stroke(Color.black,lineWidth: 2))
                                 
                                 Text("🏧")
                                     .font(.system(size: 40))
                                 
                                 
                                     
                                 
                                     
                                 
                                     
                                 
                             }
                             
                             
                             
                         }
                       
                            
                            
                         
                         
                     
                     }.navigationBarTitle(Text("Monthly Allowance"), displayMode: .inline)
                     
                 
                 }
             }
    

struct kidYearlyAllowance:  View {
    
        //Get Observable personal details
        @ObservedObject var personalDetails = allowanceDetails()
        
        //Binding for Yearly updates
        @Binding var updateYrlyAllowance: String
    
    
        //State Variables to get Firstname, Lastname and Age
        @State private var firstName = ""
        @State private var lastName = ""
        @State private var childAge = ""
    
    
    //Calculate Yearly Allowance
    var calculateYrlyAllowance: Double {
        
        
        var wklyAllowance = 0.0
        var yrlyAllowance = 0.0
        var convertAge = 0
                    
            //Convert age string to Integer with a default option being zero
            convertAge = Int(self.personalDetails.age) ?? 0
            
            
                //Monthly allowance for up to 7 years
                if convertAge > 0 && convertAge < 8 {
                    
                    wklyAllowance = 5.0
                    yrlyAllowance = (wklyAllowance * 4) * 12
                
                    //Monthly Allowance for less than 13 years
                    } else if convertAge >= 8 && convertAge <= 13  {
                        
                        wklyAllowance = 7.5
                        yrlyAllowance = (wklyAllowance * 4) * 12
                
                    //Monthly Allowance for 13 years and over
                    } else if convertAge > 13 {
                
                        wklyAllowance = 10.0
                        yrlyAllowance = (wklyAllowance * 4) * 12
                
                    //Else allowance is £0.0
                    } else {
                        yrlyAllowance = 0.0
                    }
        
                        return yrlyAllowance
        
    }//End Calculation
    
    
    var emojiFace: String {
        
        var theEmoji = ""
        var myConvertAge = 0
        myConvertAge = Int(self.personalDetails.age) ?? 0
        
        if myConvertAge > 0 && myConvertAge <= 5{
            theEmoji = "🥺"
        } else if myConvertAge > 5 && myConvertAge < 10 {
            theEmoji = "😕"
        } else if myConvertAge >= 10 {
            theEmoji = "🤪"
        }
        
        return theEmoji
    }
    
    
    var body: some View {
        
         NavigationView {
                                 
                                 
                                 ZStack {
                                     
                                     Image("Other_VCBackground")
                                         .resizable()
                                         .scaledToFill()
                                         .padding(.vertical, -150)
                                     
                                         
                         
                                 VStack {
                                 
                                     VStack {
                                             Text("Enter Child Details")
                                                 .foregroundColor(Color.blue)
                                                 .font(.system(size: 20))
                                             
                                         
                                     }
                                     
                                             TextField("Enter your firstname",text: $firstName)
                                                 .border(Color.gray, width: 0.2)
                                             
                                     
                                             TextField("Enter your lastname",text: $lastName)
                                                 .border(Color.gray, width: 0.2)

                                         
                                             TextField("Enter your age",text: $personalDetails.age)
                                                 .border(Color.gray, width: 0.2)
                                             
                                             Spacer().frame(height: 40)
                                             
                                  
                                             
                                             Text("Allowance Details")
                                                 .foregroundColor(Color.blue)
                                                 .font(.system(size: 20))
                                     
                                 
                                 
                                             Text("You name is \(firstName) \(lastName)")
                         
                                             Text("Age \(self.personalDetails.age)")
                                     
                                     HStack {
                                 
                                             Text("Your \(updateYrlyAllowance) allowance is £\(calculateYrlyAllowance,specifier: "%.2f")")
                                             Text("\(emojiFace)")
                                                 .font(.system(size: 40))
                                 
                                     }
                                             
                                             
                                             Spacer().frame(height: 450) //Push text to top of screen
                             
                                     
                                     } //End of VStack
                                     
                                     .font(.system(size: 14))
                                     .autocapitalization(.words)
                                     .padding(.horizontal, 200)
                                     
                                     
                                     
                                 
                                     ZStack {
                                         
                                         
                                         Capsule()
                                         .foregroundColor(Color.blue)
                                         .frame(width: 140, height: 20)
                                         .overlay(Capsule().stroke(Color.black,lineWidth: 2))
                                         
                                         
                                         Rectangle()
                                             .foregroundColor(Color.red)
                                             .frame(width: 100, height: 100)
                                             .overlay(Rectangle().stroke(Color.black,lineWidth: 2))
                                         
                                         
                                         
                                         Circle()
                                             .foregroundColor(Color.green)
                                             .frame(width: 80, height: 80)
                                             .overlay(Circle().stroke(Color.black,lineWidth: 2))
                                         
                                         Text("🏧")
                                             .font(.system(size: 40))
                                         
                                         
                                             
                                         
                                             
                                         
                                             
                                         
                                     }
                                     
                                     
                                     
                                 }
                               
                                    
                                    
                                 
                                 
                             
                             }.navigationBarTitle(Text("Yearly Allowance"), displayMode: .inline)
                             
                         
                         }
                     }
                          

    
    
    
    

