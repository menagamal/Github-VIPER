import Foundation

struct BaseResponse<T: Decodable> {
    var code: Int?
    var status: String?
    var error: String?
    var message: [String]?
    var data: T?
}
extension BaseResponse: Decodable {
    enum BaseResponseCodingKeys: String, CodingKey {
        case code
        case status
        case message = "errors"
        case data
        case error
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BaseResponseCodingKeys.self)
        code = try container.decodeWrapper(key: .code, defaultValue: 200)
        status = try container.decodeWrapper(key: .status, defaultValue: "")
        error = try container.decodeWrapper(key: .error, defaultValue: "")
        message = try container.decodeWrapper(key: .message, defaultValue: ["Generic error"])
        data = try container.decodeWrapper(key: .data, defaultValue: nil)
        
    }
}
extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
        where T : Decodable {
            return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}
