struct News: Decodable {
  let id: String
  let title: String?
  let description: String
  let location: String
  
  static var `default`: Self {
    Self(id: "", title: "", description: "", location: "")
  }
}
