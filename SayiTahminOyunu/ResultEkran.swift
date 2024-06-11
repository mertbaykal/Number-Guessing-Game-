//
//  ResultEkran.swift
//  SayiTahminOyunu
//
//  Created by Mert Baykal on 12/05/2024.
//

import SwiftUI

struct ResultEkran: View {
    
    var result = false
    
    var body: some View {
        
        VStack(spacing: 100) {
            
            if result == true {
                Image("mutlu").resizable().frame(width: 100, height: 100).shadow(color: .green, radius: 10)
                Text("kazandin").font(.system(size: 38)).bold()
                    .shadow(color: .green, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }else{
                Image("uzgun").resizable().frame(width: 100, height: 100).shadow(color: .red, radius: 10)
                Text("Kaybettin").font(.system(size: 38)).bold()
                    .shadow(color: .red, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    ResultEkran()
}
