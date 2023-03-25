//
//  BodyView.swift
//  Story One
//
//  Created by 윤범태 on 2023/03/25.
//

import SwiftUI

struct BodyView: View {
    @Binding var isRemoved: Bool
    
    @State var chordTodo: ChordTodo
    @State var showRemoveAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text(chordTodo.title)
                .font(.largeTitle)
            Divider()
            Text("코드")
                .font(.largeTitle)
            HStack {
                Text(chordTodo.chord)
                    .font(.title2)
            }
            
            // 웹뷰 버그: https://developer.apple.com/forums/thread/714467?answerId=734799022#734799022
            WebView(url: URL(string: "https://www.scales-chords.com/chord/piano/\(chordTodo.chord)"))
            
            Divider()
            Text(chordTodo.comment.isEmpty ? "No Comment..." : chordTodo.comment)
            Divider()
            HStack {Button {
                    if var list = try? UserDefaults.standard.getObject(forKey: .cfgTodoList, castTo: [ChordTodo].self) {
                        list.removeAll { $0.id == self.chordTodo.id }
                        print("deleted list", self.chordTodo.id, list)
                        try? UserDefaults.standard.setObject(list, forKey: .cfgTodoList)
                        isRemoved = true
                        dismiss()
                    }
                } label: {
                    Text("삭제")
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                Button("닫기") {
                    dismiss()
                }
            }.padding(sides: [.left, .right], value: 20)
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(false) {
            BodyView(isRemoved: $0, chordTodo: ChordTodo(title: "불안하다", chord: "Cdim7", comment: "comment...."))}
    }
}
