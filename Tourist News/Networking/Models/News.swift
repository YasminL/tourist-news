struct NewsList: Decodable {
  let data: [News]
}

struct News: Decodable {
  let id: Int
  let title: String?
  let description: String?
  let location: String
  
  static var `default`: Self {
    Self(id: 123,
         title: "LOVE SHIMLA",
         description: "shimla",
         location: "Shimla, Himachal Pradesh, India")
  }
}
