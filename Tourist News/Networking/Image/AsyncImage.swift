import SwiftUI

struct AsyncImage<Placeholder: View>: View {
  @StateObject private var imageLoader: ImageLoader
  private let placeholder: Placeholder
  
  init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
    self.placeholder = placeholder()
    _imageLoader = StateObject(wrappedValue: ImageLoader(url: url,
                                                         cache: Environment(\.imageCache).wrappedValue))
  }
  
  var body: some View {
    content
      .onAppear(perform: imageLoader.load)
  }
  
  @ViewBuilder private var content: some View {
    if let image = imageLoader.image {
      Image(uiImage: image)
        .resizable()
        .aspectRatio(contentMode: .fit)
    } else {
      placeholder
    }
  }
}
