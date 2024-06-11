//
//  ContentView.swift
//  SayiTahminOyunu
//
//  Created by Mert Baykal on 12/05/2024.
//

import SwiftUI

struct HomePage: View {
    @State private var toTahminEkran = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 59) {
                Text("Sayi Tahmin Oyunu").font(.system(size: 30)).bold()
                
                Image("zar").resizable().frame(width: 100,height: 100)
                
                Button("Play Game"){
                    toTahminEkran = true
                }.frame(width: 250,height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .shadow(radius: 10)
                    .cornerRadius(18)
            }.navigationDestination(isPresented: $toTahminEkran){
                TahminEkran()
            }
        }
    }
}

#Preview {
    HomePage()
}
