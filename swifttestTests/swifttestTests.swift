//
//  swifttestTests.swift
//  swifttestTests
//
//  Created by takuyasudo on 2021/10/16.
//

import XCTest
@testable import swifttest
import RxSwift
import RxCocoa
import Hydra

class swifttestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let x = 1 + 1
        XCTAssertEqual(x, 2)
    }
    
    func testViewControllerCreation() throws {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as? ViewController
        
        // storyboardに設定しているaccessibilityIdentifierからラベルを取り出す
        let label = viewController?.view.subviews
            .filter { $0.accessibilityIdentifier == "ViewControllerLabel" }
            .compactMap { $0 as? UILabel }
            .first
        
        // 初期値の確認
        XCTAssertEqual(label?.text, "Counter: 0")
    }
    
    func testHttp() throws {
        let expectation = self.expectation(description: "http")
        
        Promise<[[String: Any]]?>(in: .background) { (resolve, reject, _) in
            let url: URL = URL(string: "https://api.github.com/users/uribo/starred")!
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                do {
                    if (error == nil) {
                        print(response)
                        let json = try? JSONSerialization.jsonObject(with: (data ?? "".data(using: .utf8))!, options: .allowFragments)
                        resolve(json as? [[String: Any]])
                    } else {
                        throw error!
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
        .then(in: .main, { data in
            XCTAssertNotNil(data)
        }).always(in: .main) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        print("http test finish")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
