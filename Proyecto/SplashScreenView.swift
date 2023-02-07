//
//  SplashScreenView.swift
//  Proyecto
//
//  Created by Derek Cortez Ibarra on 06/02/23.
//

import SwiftUI

struct SplashScreenView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let viewModel = AppViewModel()
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    
    var body: some View {
        if isActive {
            ContentView().environmentObject(viewModel)
        }else{
            HStack{
                Spacer()
                VStack{
                    Spacer()
                    Image("logo").resizable().frame(width: 200, height: 200)
                        
                    Spacer()
                }
                Spacer()
            }
            .background(.white)
            .onAppear{
                
                withAnimation(.easeIn(duration: 1.2)){
                    self.size = 0.9
                    self.opacity = 0.1
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive = true
                    }
                    
                }
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
