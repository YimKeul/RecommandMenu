//
//  RotationTest.swift
//  RecommandMenu
//
//  Created by yimkeul on 2023/02/24.
//

import SwiftUI
import SimpleRoulette


struct Roulette: View {
    
    @State var doRoulette : Bool = false
    // 룰렛이 돌아가고 있는 지 판별 (true : 동작중 , false : 멈춤)
    @State var isShownRoulette: Bool  = true
    // 룰렛이 보여지고 있는지 판별 (true : show, false : hidden)
    @State var degreeRoulettee : Double = 0
    // 룰렛이 원형으로 돌기 위한 각도 값
    @State var durationTime : Double = 0
    // 롤렛이 돌는 시간 값
    

    var body: some View {
        VStack{
            if isShownRoulette{
                VStack{
                    Text("⬇️")
          
                    
                    ZStack{
                        RouletteFillColor(slices: [
                            (1, .red),
                            (1, .orange),
                            (1, .yellow),
                            (1, .green),
                            (1, .blue),
                            (1, .indigo),
                            (1, .purple),
                            (1, .red),
                            (1, .orange),
                            (1, .yellow),
                            (1, .green),
                            (1, .blue),
                            (1, .indigo),
                            (1, .purple),
                            (1, .black),
                            
                        ])
                        ForEach(0..<15) { number in
                            Text("\(number)")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .offset(x: 0, y: -130)
                                .rotationEffect(.degrees(Double(number)*24 + 12))
                                .foregroundColor(.white)
                    
                        }
           
                    }
                    .frame(width: 300, height: 310)
                    .rotationEffect(.degrees(degreeRoulettee))
                    .animation(.easeIn(duration: durationTime), value: doRoulette )
                    
                    
                    if doRoulette == false{
                        Button {
                            doRoulette = true
                            degreeRoulettee = 100000
                            durationTime = 5
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.8) {
                                isShownRoulette = false
                            }
                        } label: {
                            Text("🕹️ 룰렛 돌리기")
                                .font(.largeTitle)
                        }
                    } else {
                        Text("두구두구두구")
                    }
                }
                
                
            }else{
                Text("다 돌았다아")
                Button {
                    isShownRoulette = true
                    doRoulette = false
                    degreeRoulettee = 0
                    durationTime = 0
                } label: {
                    Text("⬅️ 다시 돌리기")
                        .font(.largeTitle)
                }
            }
            
            
        }
    }
}

struct Roulette_Previews: PreviewProvider {
    static var previews: some View {
        Roulette()
    }
}
