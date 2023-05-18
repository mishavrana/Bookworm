//
//  AddBookView.swift
//  Bookworm
//
//  Created by Misha Vrana on 15.05.2023.
//

import SwiftUI

struct AddBookView: View {
    // This is the "Managed Object Context"
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var raiting = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of the book", text: $title)
                    TextField("Autor's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $review)
                    RaitingView(raiting: $raiting)
                } header: {
                    Text("Weite a review")
                }
                
                Section {
                    Button("Save") {
                        // Add the book
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.raiting = Int16(raiting)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add a book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
