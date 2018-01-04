import XCTest

class SwiftArrayPerfTests: XCTestCase {
    
    let size = 100_1000
    var array = [1, 2, 3, 4, 5]
    override func setUp() {
        super.setUp()
    }

    func testForIn() {
        measure {
            var counter = size
            while counter > 0 {
                for e in array {
                    _ = e
                }
                counter -= 1
            }
        }
    }
    
    func testIterator() {
        measure {
            var counter = size
            while counter > 0 {
                var i = array.makeIterator()
                while let e = i.next() {
                    _ = e
                }
                counter -= 1
            }
        }
    }
    
    func testIndex() {
        measure {
            var counter = size
            while counter > 0 {
                for i in 0..<array.count {
                    _ = array[i]
                }
                counter -= 1
            }
        }
    }
    
    func testLiteral() {
        measure {
            var counter = size
            while counter > 0 {
                _ = 1
                _ = 2
                _ = 3
                _ = 4
                _ = 5
                counter -= 1
            }
        }
    }
}
