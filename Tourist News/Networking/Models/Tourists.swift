struct Tourists: Decodable {
  let page: Int
  let totalPages: Int
  let data: [Tourist]
}

struct Tourist: Decodable {
  let id: Int
  let touristName: String
  let touristEmail: String
  let touristLocation: String
  
  static var `default`: Self {
    Self(id: 189283,
         touristName: "Prasad",
         touristEmail: "prasad1234@gmail.com",
         touristLocation: "Paris")
  }
}
