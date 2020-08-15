
import Foundation
struct Repos : Codable {
	let id : Int?
	let name : String?
	let full_name : String?
	let owner : Owner?
	let html_url : String?
	let description : String?
	let fork : Bool?
	let url : String?
	let created_at : String?
	let homepage : String?
    let language : String?
	let forks_count : Int?
	let forks : Int?
	let default_branch : String?
	let score : Double?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case full_name = "full_name"
		case owner = "owner"
		case html_url = "html_url"
		case description = "description"
		case fork = "fork"
		case url = "url"
		case created_at = "created_at"
		case homepage = "homepage"
		case language = "language"
		case forks_count = "forks_count"
		case forks = "forks"
		case default_branch = "default_branch"
		case score = "score"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
		owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
		html_url = try values.decodeIfPresent(String.self, forKey: .html_url)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
		url = try values.decodeIfPresent(String.self, forKey: .url)
    
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
		
		language = try values.decodeIfPresent(String.self, forKey: .language)
		
        forks_count = try values.decodeIfPresent(Int.self, forKey: .forks_count)
		forks = try values.decodeIfPresent(Int.self, forKey: .forks)
	
		default_branch = try values.decodeIfPresent(String.self, forKey: .default_branch)
		score = try values.decodeIfPresent(Double.self, forKey: .score)
	}

}
