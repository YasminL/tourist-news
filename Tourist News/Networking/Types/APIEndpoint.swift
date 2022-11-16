import Foundation

enum APIEndpoint {
  case fetchNews
  case fetchTourists(page: String)
  
  func request() throws -> URLRequest {
    guard var url = url else { throw APIError.invalidURL }
    url.add(queryItems: queryItems)
    var request = URLRequest(url: url.appendingPathComponent(path))
    request.httpMethod = method.rawValue
    request.add(headers: headers)
    return request
  }
  
  private var url: URL? {
    switch self {
    case .fetchNews:
      return URL(string: "http://restapi.adequateshop.com")
    case .fetchTourists:
      return URL(string: "http://restapi.adequateshop.com")
    }
  }
  
  private var path: String {
    switch self {
    case .fetchNews:
      return "api/Feed/GetNewsFeed"
    case .fetchTourists:
      return "api/Tourist"
    }
  }
  
  private var method: APIMethod {
    switch self {
    case .fetchNews, .fetchTourists:
      return .GET
    }
  }
  
  private var queryItems: [URLQueryItem] {
    switch self {
    case .fetchNews:
      return []
    case .fetchTourists(let page):
      return [URLQueryItem(name: "page", value: page)]
    }
  }
  
  private var headers: Headers {
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

fileprivate extension URL {
  mutating func add(queryItems: [URLQueryItem]) {
    append(queryItems: queryItems)
  }
}


