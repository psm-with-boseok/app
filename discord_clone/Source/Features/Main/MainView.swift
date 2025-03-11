//
//  MainView.swift
//  discord_clone
//
//  Created by 박성민 on 3/9/25.
//

import SwiftUI

struct MainView: View {
    @State private var goToSignUp: Bool = false
    @State private var goToLogin: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("MainBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("discordsvg")
                        .resizable()
                        .scaledToFit()
                        .frame(width:150)
                        .foregroundStyle(.white)
                    Text("DISCORD에 오신\n걸 환영합니다")
                        .font(AppFonts.Adrianna40)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom,5)
                    Text("어울리고, 게임하고, 가볍게 대화하세요.\n아래를 탭해 시작해요!")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                    CustomButton(
                        title: "가입하기",
                        action: { goToSignUp.toggle() },
                        width: 300,
                        foregroundColor: .black,
                        backgroundColor: .white
                    )
                    .navigationDestination(isPresented: $goToSignUp){
                        SignUpView(signUpBack: $goToSignUp)
                    }
                    
                    CustomButton(
                        title: "로그인",
                        action: { goToLogin.toggle() },
                        width: 300,
                        foregroundColor: .white,
                        backgroundColor: .customBlue
                    )
                    .navigationDestination(isPresented: $goToLogin){
                        LoginView(LoginBack: $goToLogin)
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
