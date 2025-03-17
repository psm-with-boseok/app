//
//  CustomSecretTextField.swift
//  discord_clone
//
//  Created by 박성민 on 3/13/25.
//

import SwiftUI

struct CustomSecretTextField: View {
    let title: String
    let subtitle: String
    @Binding var text: String
    @State private var isSecured: Bool = true
    
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
            HStack{
                Group{
                    if isSecured {
                        SecureField("",text: $text,prompt: Text(subtitle).foregroundColor(.white.opacity(0.6)).bold())
                    } else {
                        TextField("",text: $text,prompt: Text(subtitle).foregroundColor(.white.opacity(0.6)).bold())
                    }
                }
                .frame(height: 25)
                .padding()
                .background(.customDark)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: isSecured ? "eye" : "eye.slash")
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing, 20)
                    }
                )
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
            }
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    
    CustomSecretTextField (
        title: "이메일",
        subtitle: "이메일",
        text: $text
    )
}
