//
//  LoginView.swift
//  discord_clone
//
//  Created by 박성민 on 3/10/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var LoginBack: Bool
    var body: some View {
        ZStack{
            Color.customDarkGray
                .ignoresSafeArea()
            
            VStack(alignment: .center){
                LoginViewHeader(signUpBackButton: $LoginBack)
                Text("돌아오신 것을 환영해요!")
                    .font(AppFonts.Header)
                    .foregroundStyle(.white)
                Spacer()
                    .frame(height: 10)
                Text("다시 만나다니 너무 반가워요!")
                    .fontWeight(.bold)
                    .foregroundStyle(.white.opacity(0.6))
                Spacer()
            }
        }
    }
}

private struct LoginViewHeader: View {
    @Binding var signUpBackButton: Bool
    
    var body: some View{
        HStack{
            Spacer()
                .frame(width:20)
            Button{
                signUpBackButton.toggle()
            }label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width:25)
                    .foregroundStyle(.white)
            }
            
            Spacer()
        }
    }
}

#Preview {
    @Previewable @State var back: Bool = false
    LoginView(LoginBack: $back)
}
