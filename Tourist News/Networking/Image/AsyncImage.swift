import SwiftUI

struct AsyncImage<Placeholder: View>: View {
  @StateObject var imageLoader: ImageLoader
  let placeHolder: Placeholder
  
  init(url: URL, @ViewBuilder placeHolder: () -> Placeholder) {
    self.placeHolder = placeHolder()
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
      placeHolder
    }
  }
}
