import Foundation

enum APIEndpoint {
  case fetchNews
  
  func request() throws -> URLRequest {
    guard let url = url else { throw APIError.invalidURL }
    var request = URLRequest(url: url.appendingPathComponent(path))
    request.httpMethod = method.rawValue
    request.add(headers: headers)
    return request
  }
  
  private var url: URL? {
    switch self {
    case .fetchNews:
      return URL(string: "http://restapi.adequateshop.com")
    }
  }
  
  private var path: String {
    switch self {
    case .fetchNews:
      return "api/Feed/GetNewsFeed"
    }
  }
  
  private var method: APIMethod {
    switch self {
    case .fetchNews:
      return .GET
    }
  }
  
  private var headers: Headers{
    [
      "Content-type" : "application/json"
    ]
  }
}

fileprivate extension URLRequest {
  mutating func add(headers: Headers) {
    headers.forEach { key, value in
      addValue(value, forHTTPHeaderField: key)
    }
  }
}


