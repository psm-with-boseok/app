//
//  SignUpViewModel.swift
//  discord_clone
//
//  Created by 박성민 on 3/11/25.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var EmailorPassword: String = ""
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var username: String? = nil
}
