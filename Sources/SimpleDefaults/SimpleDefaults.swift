import Foundation

protocol CustomDefaultsObject {
    public init() { }
    func setCustomObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getCustomObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}

enum CustomDefaultsObjectError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}

extension UserDefaults: CustomDefaultsObject {
    func setCustomObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw CustomDefaultsObjectError.unableToEncode
        }
    }
    
    func getCustomObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data = data(forKey: forKey) else { throw CustomDefaultsObjectError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw CustomDefaultsObjectError.unableToDecode
        }
    }
}
