import XCTest
@testable import SimpleDefaults

struct Person: Codable {
    var name: String
    var age: Int
}

final class SimpleDefaultsTests: XCTestCase {
    func testExample() throws {
        let MyPerson = Person(name: "John", age: 30)
        try UserDefaults.standard.setCustomObject(MyPerson, forKey: "MyPerson")
        let Result = try UserDefaults.standard.getCustomObject(forKey: "MyPerson", castTo: Person.self)
        print(Result)
    }
}
