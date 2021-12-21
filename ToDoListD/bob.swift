//
//  bob.swift
//  ToDoListD
//
//  Created by Reenad gh on 17/05/1443 AH.
//

import Foundation

//
//  BubblesView.swift
//
//  Created by Tariq Almazyad on 11/23/21.
//

import SwiftUI
struct BubblesView: View {
     var interests: [String: Color] = [
        
        "Amusement" : Color(hex: "1F1D36"),
        "Art exhibits" : Color(hex: "3F3351"),
        "Banquet" : Color(hex: "864879"),
        "Dance" : Color(hex: "864879"),
        "Drag shows" : Color(hex: "E9A6A6"),
        "Drama" : Color(hex: "6D9886"),
        "Escape Rooms" : Color(hex: "5C527F"),
        "Fireworks" : Color(hex: "B2B1B9"),
        "Fashion shows" : Color(hex: "6C7B95"),
        "Ice shows" : Color(hex: "464159"),
        //        "Improvisational theatre" : Color(""),
        //        "Magic" : Color(""),
        "Minstrel shows" : Color(hex: "EEA5F6"),
        //        "Music hall" : Color(""),
        "Musical theatre" : Color(hex: "DF42D1"),
        //        "Nightclubs" : Color(""),
        "Operas" : Color(hex: "40394A"),
        "Parades" : Color(hex: "F4ABC4"),
        "Parties" : Color(hex: "595B83"),
        "Performance" : Color(hex: "301B3F"),
        //        "arts" : Color(""),
        "Marching arts" : Color(hex: "7952B3"),
        "Color guard" : Color(hex: "202040"),
        //        "Drum and bugle corps" : Color(""),
        //        "Indoor percussion ensemble" : Color(""),
        //        "Marching band" : Color(""),
        "Pep band" : Color(hex: "272343"),
        "Winter guard" : Color(hex: "2C394B"),
        "entertainment" : Color(hex: "4E3D53"),
        //        "Puppet shows" : Color(""),
        "Raves" : Color(hex: "0F1123"),
        //        "Revues" : Color(""),
        "Sideshows" : Color(hex: "333456"),
        "Spectator sports" : Color(hex: "BC6FF1"),
        //        "Stand-up comedy" : Color(""),
        "Street theatre" : Color(hex: "6F4A8E"),
        "Strip clubs" : Color(hex: "EEB76B"),
        "Symphonies" : Color(hex: "221F3B"),
        "Theatre" : Color(hex: "4D3E3E"),
        "Variety show" : Color(hex: "185ADB"),
        "Vaudeville" : Color(hex: "FF926B"),
        //        "Ventriloquism" : Color(""),
        "Video art" : Color(hex: "892CDC"),
        "Wild West shows" : Color(hex: "52057B"),
    ]
    @State private var phase: CGFloat = 0
    @State private var chosenInterest = [String:Color]()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(Array(interests), id:\.key) { interest in
                        Button {
                            withAnimation {
                                if chosenInterest.keys.contains(interest.key){
                                    chosenInterest.removeValue(forKey: interest.key)
                                } else {
                                    chosenInterest[interest.key] = interest.value
                                }
                            }
                        } label: {
                            if chosenInterest.contains(where: {$0 == interest}) {
                                Text(interest.key)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .minimumScaleFactor(0.3)
                                    .frame(width: 90, height: 140)
                                    .padding(.horizontal,8)
                                    .background(interest.value.clipShape(Circle()))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(interest.value ,style: StrokeStyle(lineWidth: 4, dash: [20], dashPhase: phase))
                                            .frame(width: 120, height: 120)
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false)) {
                                                    phase -= 40
                                                }
                                            }
                                    )
                            } else {
                                Text(interest.key)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .minimumScaleFactor(0.3)
                                    .frame(width: 60, height: 100)
                                    .padding(.horizontal,8)
                                    .background(interest.value.clipShape(Circle()))
                            }
                        }
                        Spacer()
                    }
                }.padding(.horizontal, 30)
            }
            .navigationTitle("Bubbles View")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}


struct BubblesView_Previews: PreviewProvider {
    static var previews: some View {
        BubblesView()
            .preferredColorScheme(.dark)
    }
}


extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        // Scanner creation
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = Double(g) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
            
        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
