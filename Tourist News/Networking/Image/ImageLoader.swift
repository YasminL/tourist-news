import Combine
import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
  @Published var image: UIImage?
  private let url: URL
  private var subscription: AnyCancellable?
  private var cache: ImageCache?
  
  private(set) var isLoading = false
  private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
  
  init(url: URL, cache: ImageCache?) {
    self.url = url
    self.cache = cache
  }
  
  deinit {
    cancel()
  }
  
  func load() {
    guard !isLoading else { return }
    
    if let image = cache?[url] {
      self.image = image
      return
    }
    
    subscription = URLSession.shared.dataTaskPublisher(for: url)
      .map { UIImage(data: $0.data) }
      .replaceError(with: nil)
      .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
                    receiveOutput: { [weak self] in self?.cache($0) },
                    receiveCompletion: { [weak self] _ in self?.onFinish() },
                    receiveCancel: { [weak self] in self?.onFinish() })
      .subscribe(on: Self.imageProcessingQueue)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] in self?.image = $0 }
  }
  
  private func cache(_ image: UIImage?) {
    image.map { cache?[url] = $0 }
  }
  
  private func onStart() {
    isLoading = true
  }
  
  private func onFinish() {
    isLoading = false
  }
  
  private func cancel() {
    subscription?.cancel()
  }
}

