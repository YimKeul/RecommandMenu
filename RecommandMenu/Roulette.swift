//
//  RotationTest.swift
//  RecommandMenu
//
//  Created by yimkeul on 2023/02/24.
//

import SwiftUI



struct Roulette: View {
    

    @State var doRoulette : Bool = false
    @State var isShownRoulette: Bool  = true
    @State var degreeRoulettee : Double = 0
    @State var durationTime : Double = 0
    
    var body: some View {
        VStack{
            if isShownRoulette{
                VStack{
                    Text("V")
                    ZStack {
                        ForEach(0..<37) { number in
                            Text("\(number)")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .offset(x: 0, y: -150)
                                .rotationEffect(.degrees(Double(number) * 10))
                        }
                    }
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(degreeRoulettee))
                    .animation(.easeOut(duration: durationTime), value: doRoulette)
                    
                }

                
                Button {
                    doRoulette = true
                    degreeRoulettee = 10000
                    durationTime = 4
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.8) {
                        isShownRoulette = false
                    }
                } label: {
                    Text("룰렛돌리는 버튼")
                }
            }else{
                Text("다 돌았다아")
                Button {
                    isShownRoulette = true
                    doRoulette = false
                    degreeRoulettee = 0
                    durationTime = 0
                    
                    
                } label: {
                    Text("다시 돌리기")
                }
                
            }
            
            Text("doRoulettee \(doRoulette.description) , isShownRoulettee \(isShownRoulette.description)  ")
        }
    }
}

struct Roulette_Previews: PreviewProvider {
    static var previews: some View {
        Roulette()
    }
}
