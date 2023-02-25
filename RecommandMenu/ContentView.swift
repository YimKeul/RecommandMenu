//
//  ContentView.swift
//  RecommandMenu
//
//  Created by yimkeul on 2023/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("오늘은").font(.largeTitle)
            HStack{
                Roulette()
            }.frame(maxWidth: .infinity , maxHeight: 400)
                .background(Color("babypink"))
            Spacer()


        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
