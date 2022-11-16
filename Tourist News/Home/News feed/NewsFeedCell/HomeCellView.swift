import SwiftUI

struct HomeCellView: View {
  let viewModel: NewsFeedCellViewModel
  
  var body: some View {
    VStack {
      image
      HStack {
        VStack(alignment: .leading) {
          Text(viewModel.title.capitalized)
            .font(.title)
            .foregroundColor(.accentColor)
          
          Text(viewModel.description.capitalized)
            .font(.body)
            .foregroundColor(.gray)
          Spacer()
          
          Text(viewModel.location.capitalized)
            .font(.body)
        }
        .padding()
        Spacer()
      }
    }
  }
  
  @ViewBuilder private var image: some View {
    let placeholderImage = Image(viewModel.imagePlaceholderName)
      .resizable()
      .aspectRatio(contentMode: .fit)
    
    if let url = viewModel.imageURL {
      AsyncImage(url: url) {
        placeholderImage
      }
    } else {
      placeholderImage
    }
  }
  
}

struct HomeCellView_Previews: PreviewProvider {
  static var previews: some View {
    HomeCellView(viewModel: NewsFeedViewModel.preview)
  }
}
