//
//  SignUpNameView.swift
//  discord_clone
//
//  Created by 박성민 on 3/12/25.
//

import SwiftUI

struct SignUpNameView: View {
    @Binding var signUpNameBack: Bool
    @EnvironmentObject var viewModel: SignUpViewModel
    @State private var inputCheck: Bool = true
    @State private var moveNextView: Bool = false

    var body: some View {
        ZStack{
            Color.customDarkGray
                .ignoresSafeArea()
            
            VStack{
                SignUpNameViewHeader(signUpBackButton: $signUpNameBack)
                
                Spacer()
                    .frame(height: 30)
                Text("이름은 무엇인가요?")
                    .font(AppFonts.Header)
                    .foregroundStyle(.white)
                Spacer()
                    .frame(height: 30)
                CustomTextField(
                    title: "별명",
                    subtitle: "",
                    text: $viewModel.username)
                
                SignUpNameViewButtonView(
                    isDisabled: $inputCheck,
                    buttonClick: $moveNextView
                )
                .navigationDestination(isPresented: $moveNextView){
                    SignUpCreateView(signUpCreateBack: $moveNextView)
                        .environmentObject(SignUpViewModel())
                }
                Spacer()
            }
        }
        .onChange(of: viewModel.username){
            inputCheck = viewModel.username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
        .navigationBarBackButtonHidden()
    }
}

private struct SignUpNameViewHeader: View {
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
            Button{
                
            }label: {
                Text("건너뛰기")
                    .bold()
                    .font(.system(size: 18))
                    .foregroundStyle(.customViolet)
            }
            Spacer()
                .frame(width: 20)
        }
    }
}

private struct SignUpNameViewButtonView: View {
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
    SignUpNameView(signUpNameBack: $back)
        .environmentObject(SignUpViewModel())
}
