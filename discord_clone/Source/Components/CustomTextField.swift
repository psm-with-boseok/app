//
//  CustomTextField.swift
//  discord_clone
//
//  Created by 박성민 on 3/10/25.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    let subtitle: String
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                    .frame(width: 20)
                Text(title)
                    .foregroundStyle(.white.opacity(0.7))
                    .fontWeight(.bold)
                Spacer()
            }
            TextField("",text: $text,prompt: Text(subtitle).foregroundColor(.white.opacity(0.6)).bold())
                .padding()
                .background(.customDark)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    
    CustomTextField(
        title: "이메일",
        subtitle: "이메일",
        text: $text
    )
    
}
