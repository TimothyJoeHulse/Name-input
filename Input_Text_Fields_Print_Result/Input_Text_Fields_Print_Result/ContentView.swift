import SwiftUI

struct ContentView: View {
    
    @State private var inp_firstname = ""
    @State private var inp_lastname = ""
    @FocusState private var focus: FormFieldFocus?
    
    @State var fullname = "No Name"
    
    var body: some View {
        VStack {
            TextField("First Name", text: $inp_firstname)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    print(inp_firstname)
                    focus = .lastName
                }
                .focused($focus, equals: .firstName)
            
            TextField("Last Name", text: $inp_lastname)
                .textFieldStyle(.roundedBorder)
                .padding()
                .focused($focus, equals: .lastName)
                .onSubmit {
                    print(inp_lastname)
                    fullname = inp_firstname + " " + inp_lastname
                }
            
            Text("Your Name is:")
            
            Text("\(fullname)")
                .font(.title)
                .padding()
        }
        .onAppear {
            focus = .firstName
        }
        .padding()
        .background(
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    // Commit changes and dismiss the keyboard
                    fullname = inp_firstname + " " + inp_lastname
                    focus = nil
                }
        )
    }
    
    enum FormFieldFocus: Hashable {
        case firstName, lastName
    }
}

#Preview {
    ContentView()
}

