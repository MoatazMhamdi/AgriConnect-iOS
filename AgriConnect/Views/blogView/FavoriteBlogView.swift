

import SwiftUI
struct FavoriteBlogView: View{
    var body: some View{
        NavigationView{
            Text("Myrecipes")
                .padding()
                .navigationTitle("Favorites")
        }
            
        
    }
}
struct FavoritesView_Previews:PreviewProvider{
    static var previews:some View{
        FavoriteBlogView()
    }
}
