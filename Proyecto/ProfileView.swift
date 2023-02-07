//
//  ProfileView.swift
//  Proyecto-iOS
//
//  Created by Derek Cortez Ibarra on 03/02/23.
//


import SwiftUI
import FirebaseAuth
import Firebase

struct ProfileView: View {
    let viewModel = AppViewModel()
    let auth = Auth.auth().currentUser?.createProfileChangeRequest()
    @State private var name: String = ""
    @State var navigated = false
    @AppStorage("appStorageName") var appStorageName: String = ""
    
    var body: some View {
        
        
        
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 350)
                .clipShape(RoundedRectangle(cornerRadius: 80))
            
            VStack {
                HStack {
                    Spacer()

                }
                
                Text(appStorageName)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.top, 24)
                    .multilineTextAlignment(.center)
                    
                
                Text(Auth.auth().currentUser?.email ?? "userdefault@gmail.com")
                    .font(.subheadline)
                    .padding(.top, 8)
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.center)
                
                Button(action: { viewModel.signOut(); let _ = SignInView() },
                       label: { Text("Cerrar sesion") }).foregroundColor(.black)
                    .padding(.bottom, 10)
            }
            .background(Color("background"))
            .cornerRadius(20)
            .padding(.all, 14)
            .offset(y: 125)
            
            
            VStack {
                HStack {
                    Spacer()
                   
                }
                
                HStack{
                    Image("user").resizable().frame(width: 30, height: 30)
                    TextField(("Nombre"), text: $name)
                        .frame(height: 40)
                        .autocapitalization(.none)
                        .cornerRadius(80)
                        .padding(.horizontal, 10)
                    
                    
                }
                
                
                Button(action: {
                    // acción del botón
                    appStorageName = name
                    auth?.displayName = appStorageName
                    auth?.commitChanges{ (error) in
                        if let error = error{
                            print("Error: \(error)")
                        }
                        else{
                            print("Perfil actualizado")
                        }
                    }
                    
                }) {
                    Text(appStorageName.isEmpty ? "Guardar" : "Actualizar")
                        .foregroundColor(.white)
                        .padding(.horizontal, 64)
                        .frame(width:.infinity, height: 40)
                    
                }
                .background(Color("PrimaryColor"))
                .cornerRadius(5)
                .padding(.bottom, 150)
                .padding(.top, 70)
                .shadow(radius: 5)
                
                
                
                

            }
            .background(Color("background"))
            .cornerRadius(20)
            .padding(.all, 14)
            .offset(y: 450)
            
            
            
            Image("logo")
                .resizable()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .padding(.bottom, 40)
        }
        .edgesIgnoringSafeArea(.all)
        .offset(y: -300)
        
    }
}


struct ProfileView_Previews: PreviewProvider{
    static var previews: some View{
        ProfileView()
    }
}
