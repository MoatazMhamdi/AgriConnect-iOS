import SwiftUI

struct SideViewContents: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 15) {
                Image("profile_photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                            .shadow(radius: 5)
                    )
                    .padding(.bottom, 10)

                Text("iJustine")
                    .font(.title2.bold())
                Text("@iJustine")
                    .font(.callout)
            }
            .padding([.horizontal, .leading])

        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct SideViewContents_Previews: PreviewProvider {
    static var previews: some View {
        SideViewContents(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
            .previewDisplayName("iPhone 15 Pro")
    }
}


