//
//  SignupViewModel.swift
//  FormValidation
//
//  Created by Jiewen Wen on 2024/6/30.
//

import Foundation
import Combine

enum PasswordCheck{
    case valid
    case invalidLength
    case noMatch
    case weakPassword
}

class SignupViewModel: ObservableObject{
    // input
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    // input validation
    @Published var isValid = false
    @Published var usernameMessage = " "
    @Published var passwordMessage = " "
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(){
        usernameValidPublisher
            .receive(on: RunLoop.main)
            .map{
                $0 ? " ":"Username must be at least 6 characters long"
            }
            .assign(to: \.usernameMessage, on: self)
            .store(in: &cancellableSet)
        
        passwordValidPublisher
            .receive(on: RunLoop.main)
            .map{ passwordCheck in
                switch passwordCheck{
                case .invalidLength:
                    return "Password must be at least 8 characters long"
                case .noMatch:
                    return "password don't match"
                case .weakPassword:
                    return "password is too weak"
                default:
                    return " "
                }
            }
            .assign(to: \.passwordMessage, on: self)
            .store(in: &cancellableSet)
        
        formValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
}

private extension SignupViewModel{
    var usernameValidPublisher: AnyPublisher<Bool, Never>{
        $username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map{
                $0.count >= 5
            }
            .eraseToAnyPublisher()
    }
    
    var validPasswordLengthPublisher: AnyPublisher<Bool, Never>{
        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map{ $0.count >= 8}
            .eraseToAnyPublisher()
    }
    
    var strongPasswordPublisher: AnyPublisher<Bool, Never>{
        $password
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map(\.isStrongPassword)
            .eraseToAnyPublisher()
    }
    
    var matchingPasswordPublisher: AnyPublisher<Bool, Never>{
        Publishers
            .CombineLatest($password, $confirmPassword)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map{ password, confirmPassword in
               password == confirmPassword
            }
            .eraseToAnyPublisher()
    }
    
    var passwordValidPublisher: AnyPublisher<PasswordCheck,Never>{
        Publishers
            .CombineLatest3(validPasswordLengthPublisher, strongPasswordPublisher, matchingPasswordPublisher)
            .map{ validLength, strong, matching in
                if(!validLength){
                    return .invalidLength
                }
                if(!strong){
                    return .weakPassword
                }
                if(!matching){
                    return .noMatch
                }
                return .valid
            }
            .eraseToAnyPublisher()
    }
    
    var formValidPublisher: AnyPublisher<Bool, Never>{
        Publishers
            .CombineLatest(usernameValidPublisher,passwordValidPublisher)
            .map{
                usernameIsValid, passwordIsValid in
                usernameIsValid && (passwordIsValid == .valid)
            }
            .eraseToAnyPublisher()
    }
}

extension String{
    var isStrongPassword:Bool{
        containsACharacter(from: .lowercaseLetters) &&
        containsACharacter(from: .uppercaseLetters) &&
        containsACharacter(from: .decimalDigits) &&
        containsACharacter(from: .alphanumerics.inverted)
    }
    
    private func containsACharacter(from set: CharacterSet) -> Bool{
        rangeOfCharacter(from: set) != nil
    }
}

