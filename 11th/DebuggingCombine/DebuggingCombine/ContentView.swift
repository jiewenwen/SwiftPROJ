//
//  ContentView.swift
//  DebuggingCombine
//
//  Created by Jiewen Wen on 2024/7/2.
//

import SwiftUI
import Combine

class ReactiveObject{
    private var cancellableSet: Set<AnyCancellable> = []
    
    func handleEvents(){
        let subject = PassthroughSubject<String, Never>()
        subject
            .handleEvents(
                receiveSubscription: {
                    print("Receive subscription:\($0)")
                },
                receiveOutput: {
                    print("Receive output:\($0)")
                },
                receiveCompletion: {
                    print("Receive Completion:\($0)")
                },
                receiveCancel: {
                    print("Receive Cancel")
                },
                receiveRequest: {
                    print("Receive Request: \($0)")
                })
            .sink{
                _ in
            }
            .store(in: &cancellableSet)
        subject.send("New Message")
    }
    
    func printDebug(){
        let subject = PassthroughSubject<String, Never>()
        subject
            .print("Print")
            .sink{
                _ in
            }
            .store(in: &cancellableSet)
        subject.send("New Message!")
    }
    
    func breakPoint(){
        (1..<10).publisher
            .breakpoint(receiveOutput: {$0 == 7}){
                $0 == .finished
            }
            .sink{
                _ in
            }
            .store(in: &cancellableSet)
    }
}

struct ContentView: View {
    var reactiveObject = ReactiveObject()
    
    var body: some View {
        VStack(spacing: 24){
            Button{
                reactiveObject.handleEvents()
            }label: {
                Text("HandleEvents")
                    .foregroundStyle(.white)
                    .frame(width: 200,height: 50)
                    .background(Color.green)
            }
            
            Button{
                reactiveObject.printDebug()
            }label: {
                Text("print")
                    .foregroundStyle(.white)
                    .frame(width: 200,height: 50)
                    .background(Color.orange)
            }
            
            Button{
                reactiveObject.breakPoint()
            }label: {
                Text("Breakpoint")
                    .foregroundStyle(.white)
                    .frame(width: 200,height: 50)
                    .background(Color.red)
            }

        }
    }
}

#Preview {
    ContentView()
}
