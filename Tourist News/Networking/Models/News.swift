import Foundation

struct NewsList: Decodable {
  let data: [News]
}

struct News: Decodable {
  let id: Int
  let title: String?
  let description: String?
  let location: String
  let multiMedia: [NewsMultimedia]?
  
  static var `default`: Self {
    Self(id: 123,
         title: "LOVE SHIMLA",
         description: "shimla",
         location: "Shimla, Himachal Pradesh, India",
         multiMedia: [.default])
  }
}

struct NewsMultimedia: Decodable {
  let id: Int
  let url: String
  
  static var `default`: Self {
    Self(id: 1,
         url: "https://www.adequatetravel.com/ATMultimedia/feedsmedia/7059/cf012b8a-723e-4e5e-b30e-b346b4b06541.jpg")
  }
}
