//
//  SignUpView.swift
//  discord_clone
//
//  Created by 박성민 on 3/10/25.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @Binding var signUpBack: Bool
    @State var inputCheck: Bool = true
    @State var moveNextView: Bool = false
    
    @State private var selectChoice = 0
    var body: some View {
        ZStack{
            Color.customDarkGray
                .ignoresSafeArea()
            
            VStack{
                SignUpViewHeader(signUpBackButton: $signUpBack)
                
                Text("전화번호나 이메일 주소를\n입력하세요")
                    .multilineTextAlignment(.center)
                    .font(AppFonts.Header)
                    .foregroundStyle(.white)
                
                SignUpPickerView(selectChoice: $selectChoice)
                
                Spacer()
                    .frame(height: 30)
                
                if selectChoice == 0{
                    CustomTextField(title: "전화번호", subtitle: "전화번호", text: $viewModel.EmailorPassword)
                }else{
                    CustomTextField(title: "이메일", subtitle: "이메일", text: $viewModel.EmailorPassword)
                }
                
                SignUpViewButtonView(isDisabled: $inputCheck,buttonClick: $moveNextView)
                    .navigationDestination(isPresented: $moveNextView){
                        SignUpNameView(signUpNameBack: $moveNextView)
                            .environmentObject(viewModel)
                    }
                
                Spacer()
            }
        }
        .onChange(of: viewModel.EmailorPassword){
            inputCheck = viewModel.EmailorPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            print(inputCheck)
        }
        .navigationBarBackButtonHidden()
    }
}

private struct SignUpViewHeader: View {
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

private struct SignUpPickerView: View {
    var choice = ["휴대폰","이메일"]
    @Binding var selectChoice : Int
    
    var body: some View{
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.black)
                .frame(height: 44)
            
            GeometryReader { geometry in
                let totalSegments = CGFloat(choice.count)
                
                let segmentWidth = geometry.size.width / totalSegments
                
                let highlightWidth: CGFloat = segmentWidth - 15
                
                
                let offsetX = segmentWidth * CGFloat(selectChoice)
                + (segmentWidth - highlightWidth) / 2
                
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(.customDarkGray)
                    .frame(width: highlightWidth, height: 34)
                    .offset(x: offsetX, y: 5)
                    .animation(.easeInOut, value: selectChoice)
            }
            
            HStack(spacing: 0) {
                ForEach(0..<choice.count, id: \.self) { index in
                    Button(action: {
                        selectChoice = index
                    }) {
                        Text(choice[index])
                            .foregroundColor(selectChoice == index ? .white : .gray)
                            .frame(maxWidth: 300)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .frame(height:44)
        .padding(.horizontal,20)
    }
}

private struct SignUpViewButtonView: View {
    @Binding var isDisabled: Bool
    @Binding var buttonClick: Bool
    var body: some View {
        if isDisabled{
            CustomButton(
                title: "다음",
                action: { buttonClick.toggle() },
                width: 360,
                foregroundColor: .customSkyBlue,
                backgroundColor: .customBlue3
            )
            .disabled(true)
        } else{
            CustomButton(
                title: "다음",
                action: { buttonClick.toggle() },
                width: 360,
                foregroundColor: .white,
                backgroundColor: .customBlue2
            )
        }
    }
}

#Preview {
    @Previewable @State var back: Bool = false
    SignUpView(signUpBack: $back)
}
