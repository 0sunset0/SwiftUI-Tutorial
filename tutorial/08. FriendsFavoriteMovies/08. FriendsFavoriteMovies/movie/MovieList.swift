//
//  MovieList.swift
//  08. FriendsFavoriteMovies
//
//  Created by 노을 on 4/12/26.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) var context
    @State private var newMovie: Movie?
    
    /**
     Predicate: SwiftData에서 데이터 필터링 조건을 만드는 매크로입니다. SQL의 WHERE 절과 같은 역할이에요.
     */
    init(titleFilter: String = ""){
        let predicate = #Predicate<Movie> { movie in
            titleFilter.isEmpty || movie.title.contains(titleFilter)
        }
        // 조건 + 정렬을 적용해서 @Query 초기화
        // SwiftUI에서 @Query는 내부적으로 _movies라는 이름으로 저장되어 있어서, init 안에서 초기화할 때는 _movies로 접근해야 함
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    
    var body: some View {
        Group {
            if !movies.isEmpty {
                List {
                    ForEach(movies) { movie in
                        NavigationLink(movie.title){
                            MovieDetail(movie: movie)
                        }
                    }
                    //SwiftUI가 자동으로 indexes를 넣어줌
                    .onDelete(perform: deleteMovies(indexes:))
                }
            } else {
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem {
                Button("Add movie", systemImage: "plus", action: addMovie)
            }
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
        //왜 이게 + 버튼 누르면 뜨는거지..
        .sheet(item: $newMovie) {movie in
            NavigationStack {
                MovieDetail(movie: movie, isNew: true)
            }
            .interactiveDismissDisabled()
            
        }
    }
    
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovies(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(for: Movie.self, inMemory: true)
    }
}
