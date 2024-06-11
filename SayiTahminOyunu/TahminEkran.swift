//
//  TahminEkran.swift
//  SayiTahminOyunu
//
//  Created by Mert Baykal on 12/05/2024.
//

import SwiftUI

struct TahminEkran: View {
    
    @State private var toResultEkran = false
    @State private var kalanHak = 5
    @State private var yonlendirme = ""
    @State private var tfTahmin = ""
    @State private var random = 0
    @State private var result = false
    
    var body: some View {
        VStack(spacing: 59) {
            
            Text("Kalan Hak: \(kalanHak)").font(.system(size: 30)).bold()
            
            Text("Yardim: \(yonlendirme)").font(.system(size: 30))
            
            TextField("tahmin", text: $tfTahmin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Gues"){
                kalanHak -= 1
                if let tahmin = Int(tfTahmin){
                    if tahmin == random {
                        toResultEkran = true
                        result = true
                        return
                    }
                    if tahmin > random{
                        yonlendirme = "arttir"
                    }
                    if tahmin < random {
                        yonlendirme = "azalt"
                    }
                    if kalanHak == 0 {
                        result = false
                        toResultEkran = true
                    }
                    tfTahmin = ""
                }
            }.frame(width: 250,height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .shadow(radius: 10)
                .cornerRadius(18)
        }.navigationDestination(isPresented: $toResultEkran){
            ResultEkran(result: result)
        }.onAppear(){
            random = Int.random(in: 0...10)
            print(random)
            //arayuzu sifirlama
            kalanHak = 5
            yonlendirme = ""
            tfTahmin = ""
        }
    }
}

#Preview {
    TahminEkran()
}
