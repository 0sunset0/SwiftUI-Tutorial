//
//  MovieDetail.swift
//  08. FriendsFavoriteMovies
//
//  Created by 노을 on 4/13/26.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    
    var body: some View {
        Form {
            TextField("movie title", text: $movie.title)
            
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        /**
         이게 부모 뷰에서 하면 중복 코드가 생김.
         */
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    /**
     .navigationTitle은 상위에 NavigationStack이 있어야 작동한다. 
     */
    NavigationStack{
        MovieDetail(movie: SampleData.shared.movie)
    }
}
