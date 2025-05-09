//
//  LoginViewModel.swift
//  discord_clone
//
//  Created by 박성민 on 5/9/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject{
    @Published var text: String = ""
    @Published var password: String = ""
    @Published var inputCheck: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        checkInput()
    }
    
    private func checkInput() {
        $text
            .combineLatest($password)
            .map{ text, password in
                text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            }
            .assign(to: \.inputCheck, on: self)
            .store(in: &cancellables)
    }
    
    func login() {
        print("로그인")
    }
}
