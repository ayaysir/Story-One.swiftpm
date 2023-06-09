//
//  ParksQuoteView.swift
//  
//
//  Created by 윤범태 on 2023/03/24.
//

import SwiftUI

/// http://yoonbumtae.com/?p=2160
struct ParksQuoteView: View {
    private let parksQuote3 = [
        "꿈은 없고요, 그냥 놀고 싶습니다.",
        "타고나야 돼, 백날 해봐야.",
        "그런 거 나한테 기대하지 마.",
    ]
    @State var currentQuote = " "
    @State var titleColor: Color = .red
    
    var body: some View {
        VStack {
            Text("Hell, world!")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(titleColor)
            Spacer().frame(height: 25)
            // Button("제목 색상 랜덤으로 바꾸기")
            // Button("랜덤으로 박명수 명언 표시하기")
            Button("제목 색상 랜덤으로 표시하기") {
                titleColor = randomColor()
            }
            Spacer().frame(height: 5)
            Button("랜덤으로 박명수 명언 표시하기") {
                currentQuote = parksQuote3[Int.random(in: 0...2)]
            }
            Divider()
            Image("박명수")
                .resizable()
                .frame(width: 300, height: 300)
            Divider()
            Text(currentQuote)
        }
    }
}


struct ParksQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        ParksQuoteView()
    }
}
