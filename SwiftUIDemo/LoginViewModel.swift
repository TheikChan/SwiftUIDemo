//
//  LoginViewModel.swift
//  SwiftUIDemo
//
//  Created by Theik Chan on 28/11/2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    /// Input
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    /// Output
    @Published var nameMessage: String = ""
    @Published var passwordMessage: String = ""
    @Published var isValid: Bool = false
    
    private lazy var isUsernameLengthValidPublisher: AnyPublisher<Bool, Never> = {
        return $name.map{ $0.count >= 3}.eraseToAnyPublisher()
    }()
    
    init() {
        
        isUsernameLengthValidPublisher.assign(to: &$isValid)
        
        isUsernameLengthValidPublisher
            .map { $0 ? "" : "Username must be at least three characters!"}
            .assign(to: &$nameMessage)
    }
}
