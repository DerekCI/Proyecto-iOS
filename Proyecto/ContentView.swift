//
//  ContentView.swift
//  Proyecto-iOS
//
//  Created by Derek Cortez Ibarra on 02/02/23.
//

import SwiftUI
import FirebaseAuth


public class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email,
                    password: password ){[weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            // success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password ){[weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            // success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    func signOut(){
        try? auth.signOut()
        self.signedIn = false
    }
}



struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        
        NavigationView{
            if viewModel.isSignedIn{
                MapView()
            }else{ SignInView() }
            
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }//body
    
}

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text("Chaz").font(.system(size:28))
            VStack{
                TextField("Correo electronico", text: $email)
                    .padding()
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Contraseña", text: $password)
                    .background(Color("background"))
                    .padding()
                HStack{
                    Spacer()
                    Button(action: {
                        //accion
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    }, label: {
                        
                        Text("Iniciar Sesion")
                            .frame(width: 200, height: 50)
                            .cornerRadius(80)
                            .foregroundColor(Color.white)
                            .background(Color("PrimaryColor"))
                    }).cornerRadius(80)
                    
                }//hstack
                Button(action: {
                    //accion
                }, label: {
                    
                    Text("Google")
                        .frame(width: 300, height: 50)
                        .cornerRadius(80)
                        .foregroundColor(Color.black)
                        .background(Color("background"))
                }).cornerRadius(80)
                Button(action: {
                    //accion
                }, label: {
                    
                    Text("Facebook")
                        .frame(width: 300, height: 50)
                        .cornerRadius(80)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }).cornerRadius(80)
                Spacer()
                HStack{
                    Text("No tienes cuenta?")
                    NavigationLink("Registrate", destination: SignUpView())
                        .padding()
                }
            }//vstack
            .padding()
            Spacer()
        }
        
    }//body
    
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text("Chaz").font(.system(size:28))
            VStack{
                TextField("Correo electronico", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                SecureField("Contraseña", text: $password)
                    .background(Color("background"))
                    .padding()
                HStack{
                    Spacer()
                    Button(action: {
                        //accion
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    }, label: {
                        
                        Text("Registrarse")
                            .frame(width: 200, height: 50)
                            .cornerRadius(80)
                            .foregroundColor(Color.white)
                            .background(Color("PrimaryColor"))
                    }).cornerRadius(80)
                    
                }//hstack
                Spacer()
                HStack{
                    Text("Ya tienes cuenta?")
                    NavigationLink("Inicia sesion", destination: SignInView())
                        .padding()
                }
            }//vstack
            .padding()
            Spacer()
        }
        
    }//body
    
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
