import PhotosUI
import SwiftUI

struct ImagePicker: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State var text: String
    var body: some View {
        PhotosPicker(selection: $avatarItem, matching: .images) {
            ZStack {
                VStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 64, height: 64)
                    Text(text)
                        .foregroundColor(Color("background_text"))
                }
                avatarImage?
                    .resizable()
                    .frame(width: 64, height: 64)
                    .scaledToFit()
                    .cornerRadius(100)
                    .padding(.bottom, 30)
            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                }
                print("Failed")
            }
        }
    }
}
struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(text: "Escolher Foto")
    }
}
