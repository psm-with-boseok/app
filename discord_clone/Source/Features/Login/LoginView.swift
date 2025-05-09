//
//  LoginView.swift
//  discord_clone
//
//  Created by 박성민 on 3/10/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var LoginBack: Bool
    @StateObject var viewModel = LoginViewModel()
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
                    .frame(height: 30)
                
                CustomTextField(
                    title: "이메일 또는 전화번호",
                    subtitle: "",
                    text: $viewModel.text
                )
                
                Spacer()
                    .frame(height: 10)
                
                CustomSecretTextField(
                    title: "비밀번호",
                    subtitle: "",
                    text: $viewModel.password
                )
                
                Spacer()
                    .frame(height: 10)
                
                
                if viewModel.inputCheck{
                    CustomButton(
                        title: "로그인",
                        action: { },
                        width: 360,
                        foregroundColor: .customSkyBlue,
                        backgroundColor: .customBlue3
                    )
                    .disabled(true)
                }else{
                    CustomButton(
                        title: "로그인",
                        action: { viewModel.login()},
                        width: 360,
                        foregroundColor: .white,
                        backgroundColor: .customBlue2
                    )
                }
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
