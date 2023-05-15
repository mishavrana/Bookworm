//
//  ContentView.swift
//  Bookworm
//
//  Created by Misha Vrana on 12.05.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    /*
     It is the fetch request for Studen entities
     As a 'sortDescrition' parameter we give an enmpry array - means without sorting
     */
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            VStack {
                List(students) { student in
                    // Have to do neal coalescing everywhere
                    Text(student.name ?? "Unknown" )
                }
                
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter","Weaslev"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(context: moc)
                    student.id = UUID()
                    student.name = "\(chosenFirstName) \(chosenLastName)"
                    
                    try? moc.save()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
