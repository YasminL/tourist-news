enum APIError: Error {
  case failedRequest
  case invalidStatusCode
  case invalidURL
  case invalidResponse
  case noNetwork
  case notAuthorized
  case unknown
}
