import Foundation
import UIKit

protocol ImageCache {
  subscript(_ url: URL) -> UIImage? { get set }
}

struct TemporaryImageCache: ImageCache {
  private let cache = NSCache<NSURL, UIImage>()
  
  subscript(_ key: URL) -> UIImage? {
    get { cache.object(forKey: key as NSURL) }
    set {
      if let value = newValue {
        cache.setObject(value, forKey: key as NSURL)
      } else {
        cache.removeObject(forKey: key as NSURL)
      }
    }
  }
}
