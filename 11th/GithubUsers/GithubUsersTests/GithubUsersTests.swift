//
//  GithubUsersTests.swift
//  GithubUsersTests
//
//  Created by Jiewen Wen on 2024/7/2.
//

import XCTest
@testable import GithubUsers
import Combine

final class GithubUsersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension XCTestCase{
    func loadFixture(named name: String) -> Data?{
        let bundle = Bundle(for: type(of: self))
        let path = bundle.url(forResource: name, withExtension: "json")!
        return try? Data(contentsOf: path)
    }
    
    typealias CompletionResult = (expectation: XCTestExpectation, Cancellable: AnyCancellable)
    func expectValue<T: Publisher>(of publisher: T, equalsTo closure: @escaping(T.Output) -> Bool) ->CompletionResult{
        let exp = expectation(description: "Correct valuesof " + String(describing: publisher))
        let cancellable = publisher
            .sink(receiveCompletion: {_ in}, receiveValue: {
                if closure($0){
                    exp.fulfill()
                }
            })
        return (exp,cancellable)
    }
}

final class MockURLProtocol:URLProtocol{
    static var requestHandler:((URLRequest) throws -> (HTTPURLResponse,Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else{
            fatalError("Handler is unavailable")
        }
        
        do{
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            if let data{
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        }catch{
            client?.urlProtocol(self, didFailWithError: error)  
        }
    }
    
    override func stopLoading() {
        
    }
}

class GithubUsersAppTests:XCTestCase{
    let apiURL = URL(string: "https://api.github.com/users")!
    func testUsersCallResult() throws{
        URLProtocol.registerClass(MockURLProtocol.self)
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil,headerFields: nil)!
            return (response, self.loadFixture(named: "githubUsers")!)
        }
        
        let github = Github()
        let exp1 = expectValue(of: github.$users,equalsTo:{$0.first?.id == 1})
        let exp2 = expectValue(of: github.$users,equalsTo:{$0.count == 30})
        
        github.load()
        wait(for: [exp1.expectation, exp2.expectation],timeout:100)
    }
}
