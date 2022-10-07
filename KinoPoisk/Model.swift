
import Foundation

// MARK: - Welcome9
struct Film: Codable {
    let docs: [Doc]
    let total: Int
    let limit: Int
    let page: Int
    let pages: Int
}

// MARK: - Doc
struct Doc: Codable{
    let externalID: ExternalID?
    let logo: Logo
    let poster: Poster?
    let rating: Rating
    let votes: Rating
    let id: Int?
    let name: String?
    let docDescription: String?
    let year: Int
    let alternativeName: String?
    let enName: String?
    let names: [Name]
    let movieLength: Int?
    let shortDescription: String?
    let color: String?
}

// MARK: - ExternalID
struct ExternalID: Codable {
    let id: String
    let imdb: String?
}

// MARK: - Logo
struct Logo: Codable {
    let id: String?
    let url: String?
}

// MARK: - Name
struct Name: Codable {
    let id: String?
    let name: String?
}

// MARK: - Poster
struct Poster: Codable {
    let id: String?
    let url: String
    let previewURL: String?
}

// MARK: - Rating
struct Rating: Codable {
    let id: String?
    let kp, imdb: Double
    let filmCritics: Double?
    let await: Double
}


