import SwiftUI

@main
struct MyApp: App {
    let persistence = Persistence.previewFull
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
