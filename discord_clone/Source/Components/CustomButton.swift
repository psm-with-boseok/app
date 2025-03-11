//
//  CustomButton.swift
//  discord_clone
//
//  Created by 박성민 on 3/9/25.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    let width: CGFloat
    var foregroundColor: Color = .black
    var backgroundColor: Color = .white
    
    var body: some View {
        Button(action: action){
            Text(title)
                .frame(width: width,height: 50)
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .font(.system(size: 18))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .fontWeight(.bold)
                .padding(3)
        }
    }
}

#Preview {
    CustomButton(
        title:"가입하기",
        action: { print("asdf") },
        width: 300,
        foregroundColor: .white,
        backgroundColor: .black
    )
}
