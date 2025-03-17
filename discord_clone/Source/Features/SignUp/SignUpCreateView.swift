//
//  SignUpCreateView.swift
//  discord_clone
//
//  Created by 박성민 on 3/12/25.
//

import SwiftUI

struct SignUpCreateView: View {
    @Binding var signUpCreateBack: Bool
    @EnvironmentObject var viewModel: SignUpViewModel
    @State private var inputCheck: Bool = true
    @State private var buttonClick: Bool = false
    var body: some View {
        ZStack{
            Color.customDarkGray
                .ignoresSafeArea()
            
            VStack{
                SignUpCreateViewHeader(signUpBackButton: $signUpCreateBack)
                Spacer()
                    .frame(height: 20)
                Text("이제 계정을 만들어보세요")
                    .font(AppFonts.Header)
                    .foregroundStyle(.white)
                
                Spacer()
                    .frame(height: 30)
                
                CustomTextField(
                    title: "사용자명",
                    subtitle: "별명에서 따오기",
                    text: $viewModel.username
                )
                
                Spacer()
                    .frame(height: 20)
                
                CustomSecretTextField(
                    title: "비밀번호",
                    subtitle: "",
                    text: $viewModel.password
                )
                
                Spacer()
                    .frame(height: 20)
                
                SignUpCreateViewButtonView(
                    isDisabled: $inputCheck,
                    buttonClick: $buttonClick
                )
                Spacer()
            }
        }
        .onChange(of: viewModel.username) {
            updateInputCheck()
        }
        .onChange(of: viewModel.password) {
            updateInputCheck()
        }
    }
    
    private func updateInputCheck() {
        inputCheck = viewModel.username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || viewModel.password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

private struct SignUpCreateViewHeader: View {
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

private struct SignUpCreateViewButtonView: View {
    @Binding var isDisabled: Bool
    @Binding var buttonClick: Bool
    var body: some View {
        if isDisabled{
            CustomButton(
                title: "다음",
                action: {
                    
                },
                width: 360,
                foregroundColor: .customSkyBlue,
                backgroundColor: .customBlue3
            )
            .disabled(true)
        } else{
            CustomButton(
                title: "다음",
                action: {
                    buttonClick.toggle()
                    print("클릭")
                },
                width: 360,
                foregroundColor: .white,
                backgroundColor: .customBlue2
            )
        }
    }
}

#Preview {
    @Previewable @State var back: Bool = false
    SignUpCreateView(signUpCreateBack: $back)
        .environmentObject(SignUpViewModel())
}
