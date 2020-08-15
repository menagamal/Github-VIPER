
import Foundation
class Repos : NSObject,NSCoding, Codable {
    let id : Int?
    let name : String?
    let owner : Owner?
    let descriptionStr : String?
    let url : String?
    let created_at : String?
    let language : String?
    let forks_count : Int?
    let score : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case owner = "owner"
        case descriptionStr = "description"
        case url = "html_url"
        case created_at = "created_at"
        case language = "language"
        case forks_count = "forks_count"
        case score = "score"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
        descriptionStr = try values.decodeIfPresent(String.self, forKey: .descriptionStr)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        
        forks_count = try values.decodeIfPresent(Int.self, forKey: .forks_count)
        
        score = try values.decodeIfPresent(Double.self, forKey: .score)
    }
    
    //MARK: CACHE Initializers
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: "id")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.owner, forKey: "owner")
        coder.encode(self.descriptionStr, forKey: "descriptionStr")
        coder.encode(self.url, forKey: "url")
        coder.encode(self.created_at, forKey: "created_at")
        coder.encode(self.language, forKey: "language")
        coder.encode(self.forks_count, forKey: "forks_count")
        coder.encode(self.score, forKey: "score")
    }
    
    required init?(coder: NSCoder) {
        
        self.id = coder.decodeObject(forKey: "id") as? Int
        self.name = coder.decodeObject(forKey: "name") as? String
        self.owner = coder.decodeObject(forKey: "owner") as? Owner ?? Owner()
        self.descriptionStr = coder.decodeObject(forKey: "descriptionStr") as? String
        self.url = coder.decodeObject(forKey: "url") as? String
        self.created_at = coder.decodeObject(forKey: "created_at") as? String
        self.language = coder.decodeObject(forKey: "language") as? String
        self.forks_count = coder.decodeObject(forKey: "forks_count") as? Int
        self.score = coder.decodeObject(forKey: "score") as? Double
        super.init()
    }
    
    
}
