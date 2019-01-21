

import Foundation

struct Main: Decodable {
    let status: Int
    let response: Response?
}

struct Response: Decodable {
    let events: [Events]?
}

struct Events: Decodable {
    let id: Int
    let status: Int
    let photo: String?
    let name: String?
    let description_raw: String?
    let description_html: String?
    let schedule_start_date: String?
    let schedule_start_time: String?
    let schedule_end_date: String?
    let schedule_end_time: String?
    let going_count: Int
    let went_count: Int
    let venue: Venue?
}

struct Venue: Decodable {
    let id: Int
    let name: String?
    let type: Int
    let description: String?
}
