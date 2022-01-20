//
//  MovieModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 18/01/22.
//

import Foundation

enum GroupType: String {
    case movie = "movie"
    case tv = "tv"
}

enum CategoryType: String {
    case upcoming = "upcoming"
    case popular = "popular"
    case toprate = "top_rated"
    case latest = "latest"
    case onAir = "on_the_air"
}

// MARK: - MovieResponse
struct MovieResponse: Codable {
    var page: Int?
    var results: [Movie]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        page = try? values.decode(Int.self, forKey: .page)
        results = try values.decode([Movie].self, forKey: .results)
        totalPages = try? values.decode(Int.self, forKey: .totalPages)
        totalResults = try? values.decode(Int.self, forKey: .totalResults)
    }
    
}

// MARK: - Result
struct Movie: Codable, Identifiable, Hashable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: OriginalLanguage?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        adult = try? values.decode(Bool.self, forKey: .adult)
        backdropPath = try? values.decode(String.self, forKey: .backdropPath)
        genreIDS = try? values.decode([Int].self, forKey: .genreIDS)
        id = try? values.decode(Int.self, forKey: .id)
        originalLanguage = try? values.decode(OriginalLanguage.self, forKey: .originalLanguage)
        originalTitle = try? values.decode(String.self, forKey: .originalTitle)
        overview = try? values.decode(String.self, forKey: .overview)
        popularity = try? values.decode(Double.self, forKey: .popularity)
        posterPath = try? values.decode(String.self, forKey: .posterPath)
        releaseDate = try? values.decode(String.self, forKey: .releaseDate)
        title = try? values.decode(String.self, forKey: .title)
        video = try? values.decode(Bool.self, forKey: .video)
        voteAverage = try? values.decode(Double.self, forKey: .voteAverage)
        voteCount = try? values.decode(Int.self, forKey: .voteCount)
        name = try? values.decode(String.self, forKey: .name)
    }
    
    func getImagePoster() -> String {
        return "http://image.tmdb.org/t/p/w185/\(posterPath ?? "")";
    }
    
    func getImageBackdrop() -> String {
        return "http://image.tmdb.org/t/p/w185/\(backdropPath ?? "")";
    }
    
    func genreList() -> String {
        let _genreMap: [Int: String] = [
          28: "Action",
          12: "Adventure",
          16: "Animation",
          35: "Comedy",
          80: "Crime",
          99: "Documentary",
          18: "Drama",
          10751: "Family",
          10762: "Kids",
          10759: "Action & Adventure",
          14: "Fantasy",
          36: "History",
          27: "Horror",
          10402: "Music",
          9648: "Mystery",
          10749: "Romance",
          878: "Science Fiction",
          10770: "TV Movie",
          53: "Thriller",
          10752: "War",
          37: "Western",
          10763: "",
          10764: "Reality",
          10765: "Sci-Fi & Fantasy",
          10766: "Soap",
          10767: "Talk",
          10768: "War & Politics",
        ];
        var maps: [String] = []
        if let ids = genreIDS {
            ids.forEach { i in
                maps.append(_genreMap[i] ?? "")
            }
        }
        return maps.joined(separator: ",")
    }
    
}

// OriginalLanguage.swift

import Foundation

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case ru = "ru"
}


