//
//  SplashScreen.swift
//  YumYumNow
//
//  Created by mai nguyen on 7/9/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                    LinearGradient(gradient: Gradient(colors: [.radient1, .radient2]), startPoint: .top, endPoint: .bottomLeading)
                    .ignoresSafeArea()

                VStack(spacing:0){
                    Image("splashScreen-image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                
                    Text("Enjoy " + "\n" + "Your Food")
                        .font(.poppinsSemiBoldFont(size: 42))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.top,20)
                    
                    Button(action:{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                self.isActive = true
                            }
                        }

                    }
                        
                    ) {
                        
                        Text("Get Started")
                            .font(.poppinsSemiBoldFont(size: 27))
                            .foregroundColor(.purple462B9C)
                            .padding([.leading,.trailing],36)
                            .padding([.top,.bottom],14)


                    }
                    .background(.white)
                    .cornerRadius(25)
                    .padding(.top,70)
                         
                }
               
            }
        }

    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
