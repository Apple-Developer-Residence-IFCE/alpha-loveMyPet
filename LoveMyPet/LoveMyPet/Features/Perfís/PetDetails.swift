import SwiftUI
// como saber que  um pet é aquele especifico
// se ja tem ligaçao pq o enviromentobject nao funciona
struct PetDetails: View {
    @EnvironmentObject var vmShowPet: PetViewModel
    var dataFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    var formattedWeight: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        return numberFormatter.string(from: NSNumber(value: vmShowPet.weight)) ?? ""
    }
    var body: some View {
        let currenDate = vmShowPet.date
        let formattedDate = dataFormatter.string(from: currenDate)
        VStack(spacing: 30) {
            Image("static_pet")
                .resizable()
                .frame(height: 194)
                .padding(.top, -140)
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Informações")
                            .bold()
                            .font(.title2)
                        Spacer()
                        if vmShowPet.gender == "Macho" {
                            Image("man_gender")
                        } else {
                            Image("woman_gender")
                        }
                    }
                    HStack {
                        Text("Nome")
                            .bold()
                        Spacer()
                        Text("\(vmShowPet.name)")
                    }
                    HStack {
                        Text("Espécie")
                            .bold()
                        Spacer()
                        Text("\(vmShowPet.species)")
                    }
                    HStack {
                        Text("Nascimento")
                            .bold()
                        Spacer()
                        Text("\(formattedDate)")
                    }
                    HStack {
                        Text("Raça")
                            .bold()
                        Spacer()
                        Text("\(vmShowPet.race)")
                    }
                    HStack {
                        Text("Peso")
                            .bold()
                        Spacer()
                        Text("\(formattedWeight) kg")
                    }
                    Divider()
                        .background(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color("borders_color"))
                        )
                    Text("Adicionais")
                        .bold()
                        .font(.title2)
                    HStack {
                        Text("Castrado?")
                            .bold()
                        Spacer()
                        Text("\(vmShowPet.castrated ? "Sim" : "Não")")
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 24))
            }
        }
        .navigationTitle("Informações do pet")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                SheetEditPetView()
            }
        }
    }
}

struct PetDetails_Previews: PreviewProvider {
    static var previews: some View {
        PetDetails()
            .environmentObject(PetViewModel(stack: .shared))
    }
}
