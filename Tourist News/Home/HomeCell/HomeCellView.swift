import SwiftUI

struct HomeCellView: View {
  
  let viewModel: HomeCellViewModel
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        if let title = viewModel.title {
          Text(title.capitalized)
            .font(.title)
            .foregroundColor(.accentColor)
        }
        
        if let description = viewModel.description {
          Text(description.capitalized)
            .font(.body)
            .foregroundColor(.gray)
        }
        Spacer()
        
        if let location = viewModel.location {
          Text(location.capitalized)
            .font(.body)
        }
      }
    }
  }
}

struct HomeCellView_Previews: PreviewProvider {
  static var previews: some View {
    HomeCellView(viewModel: HomeViewModel.preview)
  }
}
