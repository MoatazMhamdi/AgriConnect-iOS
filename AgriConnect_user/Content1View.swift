//

//  ContentView.swift

//  EcoTransit

//

//  Created by imba on 4/11/2023.

//



import SwiftUI

import CoreData



struct Content1View: View {

    @Environment(\.managedObjectContext) private var view1Context



    @FetchRequest(

        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],

        animation: .default)

    private var items: FetchedResults<Item>



    var body: some View {

        NavigationView {

            List {

                ForEach(items) { item in

                    NavigationLink {

                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")

                    } label: {

                        Text(item.timestamp!, formatter: itemFormatter)

                    }

                }

                .onDelete(perform: deleteItems)

            }

            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {

                    EditButton()

                }

                ToolbarItem {

                    Button(action: addItem) {

                        Label("Add Item", systemImage: "plus")

                    }

                }

            }

            Text("Select an item")

        }

    }



    private func addItem() {

        withAnimation {

            let newItem = Item(context: view1Context)

            newItem.timestamp = Date()



            do {

                try view1Context.save()

            } catch {

                // Replace this implementation with code to handle the error appropriately.

                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                let nsError = error as NSError

                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")

            }

        }

    }



    private func deleteItems(offsets: IndexSet) {

        withAnimation {

            offsets.map { items[$0] }.forEach(view1Context.delete)



            do {

                try view1Context.save()

            } catch {

                // Replace this implementation with code to handle the error appropriately.

                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                let nsError = error as NSError

                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")

            }

        }

    }

}



private let itemFormatter: DateFormatter = {

    let formatter = DateFormatter()

    formatter.dateStyle = .short

    formatter.timeStyle = .medium

    return formatter

}()



struct Content1View_Previews: PreviewProvider {

    static var previews: some View {

        Content1View().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    }

}

