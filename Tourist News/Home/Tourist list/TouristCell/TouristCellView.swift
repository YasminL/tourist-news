import SwiftUI

struct TouristCellView: View {
  let viewModel: TouristCellViewModel
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(viewModel.name)
          .font(.title)
          .foregroundColor(.accentColor)
        Text(viewModel.email)
          .font(.body)
          .foregroundColor(.gray)
        Text(viewModel.location)
          .font(.body)
      }
      Spacer()
    }
    .padding()
  }
}

struct TouristCellView_Previews: PreviewProvider {
  static var previews: some View {
    TouristCellView(viewModel: TouristCellViewModel(viewModel: .default))
  }
}
