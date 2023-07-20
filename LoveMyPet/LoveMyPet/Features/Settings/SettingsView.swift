import SwiftUI

enum Appearence: Int {
    case system = 0
    case light
    case dark
}
let defautMode = Appearence(rawValue: 0)

struct SettingsView: View {
    @State var selectedButton: Int = 0
    var body: some View {
        VStack {
            Text("Configurações")
                .bold()
                .font(.system(size: 30))
                .padding(.bottom, 50)
                .padding(.horizontal, -150)
            
            Text("APARÊNCIA")
                .bold()
                .font(.system(size: 15))
                .padding(.bottom, 50)
                .padding(.horizontal, -150)
            HStack(spacing: 30) {
                
                ModeView(buttonId: 0, selectedButton: $selectedButton, image: "image_conf_system", title: "Sistema")
                ModeView(buttonId: 1, selectedButton: $selectedButton, image: "image_conf_ light", title: "Claro")
                ModeView(buttonId: 2, selectedButton: $selectedButton, image: "image_conf_dark", title: "Escuro")
                
                /*VStack {
                 Image("image_conf_system")
                 Text("Sistema")
                 .font(.system(size: 10))
                 Button {
                 } label: {
                 Circle()
                 .stroke(Color("primary_colors"), lineWidth: 2)
                 .frame(width: 20, height: 20)
                 .foregroundColor(selectedButton == 0 ? Color("primary_colors") : .clear)
                 }
                 }
                 VStack {
                 
                 Image("image_conf_ light")
                 .overlay(
                 RoundedRectangle(cornerRadius: 10)
                 .stroke(Color.black, lineWidth: 2)
                 )
                 Text("Claro")
                 .font(.system(size: 10))
                 Button {
                 } label: {
                 Circle()
                 .stroke(Color("primary_colors"), lineWidth: 2)
                 .frame(width: 20, height: 20)
                 .foregroundColor(selectedButton == 1 ? Color("primary_colors") : .clear)
                 }
                 }
                 VStack {
                 Image("image_conf_dark")
                 Text("Escuro")
                 .font(.system(size: 10))
                 Button {
                 
                 } label: {
                 Circle()
                 .stroke(Color("primary_colors"), lineWidth: 2)
                 .frame(width: 20, height: 20)
                 .foregroundColor(selectedButton == 2 ? Color("primary_colors") : .clear)
                 }
                 }
                 }*/
            }
            .padding(.bottom, 200)
        }
    }
    
    struct ModeView: View {
        var buttonId: Int
        @Binding var selectedButton: Int
        var image: String
        var title: String
        var body: some View {
            VStack{
            Image(image)
            Text(title)
            
                
                Button {
                   // Image("Icon_select").clipShape(Circle())
                   // Image("Icon_select")
                    selectedButton = buttonId
                } label: {
                    if !(selectedButton == buttonId) {
                        Circle()
                            .stroke(Color("primary_colors"), lineWidth: 2)
                            .frame(width: 20, height: 20)
                            .foregroundColor(selectedButton == 2 ? Color("primary_colors") : .clear)
                       // Image("Icon_select")
                    } else {
                        Image("Icon_select")
                    }
                    //Image("Icon_select")
                    
                }
            
//                Button {
//
//                } label: {
//                    Circle()
//                        .stroke(Color("primary_colors"), lineWidth: 2)
//                        .frame(width: 20, height: 20)
//                    //  .foregroundColor(selectedButton == 2 ? Color("primary_colors") : .clear)
//                }
            
        }
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
