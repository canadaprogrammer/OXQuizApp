//
//  ContentView.swift
//  OXQuizApp
//
//  Created by Jungjin Park on 2024-04-15.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = 4
    @State var number2: Int = 2
    @State var resultNumber: Int = 9
    
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        VStack {
            Text("다음 수식은 맞을까요?")
                .font(.title)
            Spacer()
            Text("\(number1) x \(number2) = \(resultNumber)")
                .font(.title)
            Spacer()
            HStack {
                Spacer()
                Button {
                    if number1 * number2 == resultNumber {
                        selectCorrect()
                    } else {
                        selectWrong()
                    }
                    reloadGame()
                    
                } label: {
                    HStack {
                        Image(systemName: "checkmark.diamond.fill")
                        Text("맞음")
                    }.foregroundStyle(.green)
                }
                Spacer()
                Button {
                    if number1 * number2 != resultNumber {
                        selectCorrect()
                    } else {
                        selectWrong()
                    }
                    reloadGame()
                    
                } label: {
                    HStack {
                        Image(systemName: "xmark.diamond")
                        Text("틀림")
                    }
                }.foregroundColor(.red)
                Spacer()
                
            }.font(.largeTitle)
            Spacer()
            HStack {
                Spacer()
                Text("\(countCorrect) 개 맞춤")
                Spacer()
                Text("\(countWrong) 개 틀림")
                Spacer()
            }.font(.title)
            Spacer()
            Button {
                countCorrect = 0
                countWrong = 0
                reloadGame()
            } label: {
                Text("카우트 초기화")
            }
            .font(.title)
        }
        .padding()
    }
    func reloadGame() {
        // 게임 재시작 로직
        number1 = Int.random(in:1...10)
        number2 = Int.random(in:1...10)
        
//        var randomOperator = Int.random(in:0...2)
//        switch(randomOperator) {
//        case 0:
//            resultNumber = number1 + number2
//        case 1:
//            resultNumber = number1 - number2
//        case 2:
//            resultNumber = number1 * number2
//        default:
//            resultNumber = number1 * number2
//        }
        if Bool.random() {
            resultNumber = number1 * number2
        } else {
            repeat {
                resultNumber = Int.random(in:1...100)
            } while resultNumber == number1 * number2
        }
    }
    func selectCorrect() {
        // 정답 선택시 로직
        countCorrect += 1
    }
    func selectWrong() {
        // 오답 선택시 로직
        countWrong += 1
    }
}

#Preview {
    ContentView()
}
