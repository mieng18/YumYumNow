//
//  DetailView.swift
//  YumYumNow
//
//  Created by mai nguyen on 7/10/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var showView: Bool
    var animation: Namespace.ID
    var food: Food
    // For More About Hero Animation, See Animation hack Video
    // MARK: Animation Properties
    @State var showContent: Bool = false
    @State private var quantityLabel: Int = 1

    
    var body: some View {
        GeometryReader{
            let size = $0.size
            
            VStack(spacing: 0){
                Image(food.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: food.id, in: animation)
                    .frame(width:345, height: 345,alignment: .center)
                    .zIndex(1)
                
                VStack(spacing: 20){
                    VStack{
                        HStack{

                            
                            HStack(spacing: 4) {
                                Image("star-filled")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24,height: 24)
                                
                                Text(food.rating)
                                    .font(.poppinsSemiBoldFont(size: 25))
                                    .foregroundColor(.white)
                                    
                                
                            }
                            .padding(.horizontal,14)
                            .padding(.vertical,7)
                            .background(
                                Capsule()
                                    .foregroundColor(.purple462B9C)
                            )
                            
                            

                            
                            Spacer()
                            Text(food.price)
                                .font(.poppinsBoldFont(size: 24))
                                .foregroundColor(.yellowTextC9AA05)
                                
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack{
                            Text(food.foodName)
                                .font(.title)
                                .fontWeight(.bold)
                                .lineLimit(2)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            
                            Spacer()
                            
                            
                            HStack{
                                Button {
                                    if quantityLabel > 1 {
                                        quantityLabel -= 1
                                    } else {
                                        quantityLabel = 0
                                    }
                                    
                                } label: {
                                    Image("minus-sign")
                                        .resizable()
                                        .frame(width: 24, height: 24)

                                    
                                }
                                
                                Text("\(quantityLabel)")
                                    .font(.poppinsRegularFont(size: 18))
                                    .foregroundColor(.black)
                                
                                
                                Button {
                                    quantityLabel += 1

                                    
                                } label: {
                                    Image("plus-sign")
                                    
                                        .resizable()
                                        .frame(width: 24, height: 24)


                                    
                                }

                            }
                        }
                        
                        VStack(alignment: .leading){
                            Text(food.description)
                                .font(.poppinsLightFont(size: 18))
                                .foregroundColor(.grayText595959)
                                .multilineTextAlignment(.leading)


                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom,16)

                        
                        
                        VStack(alignment: .leading,spacing: 8){
                            Text("Add Ons")
                                .font(.poppinsMediumFont(size: 18))
                                .foregroundColor(.black373737)
                            
                            addOnsView()
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                            
                            
                    }
                    .padding(.leading,36)
                    .padding(.trailing,26)
                        
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Add to cart")
                            .font(.poppinsSemiBoldFont(size: 27))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,13)
                            .padding(.horizontal,60)

                           
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.purple462B9C)
                    }
                    .padding(.horizontal,32)
                }
                .padding(.top,30)
                .padding(.bottom,15)
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                .background(content: {
                    CustomCorner(corners: [.topLeft], radius: 70)
                        .fill(.white)
                        .ignoresSafeArea()
                })
                .offset(y: showContent ? 0 : (size.height / 1.5))
                .zIndex(0)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        }
        .padding(.top,30)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .overlay(alignment: .top, content: {
            HeaderView()
                .opacity(showContent ? 1 : 0)
        })
        .background {
            Rectangle()
                .fill(
                    LinearGradient(gradient:
                                        Gradient(colors: [.radient1, .radient2]),
                                       startPoint: .center,
                                       endPoint: .bottomTrailing))
                .ignoresSafeArea()
                .opacity(showContent ? 1 : 0)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.35).delay(0.05)){
                showContent = true
            }
        }
    }
    
    @ViewBuilder
    func HeaderView()->some View{
        Button {
            // MARK: Closing View And Showing Tab Bar
            withAnimation(.easeInOut(duration: 0.3)){
                showContent = false
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                showTabBar()
                withAnimation(.easeInOut(duration: 0.35)){
 
                    showView = false
                }
            }
        } label: {
            Image(systemName: "chevron.left")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding(15)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    @ViewBuilder func addOnsView() -> some View {
        HStack{
            ZStack(alignment: .bottomTrailing) {
                Rectangle()
                    .frame(width: 80,height: 80)
                    .foregroundColor(.grayEFEEEE)
                    .cornerRadius(20)
                    .overlay(
                        Image("cheese")
                            .scaledToFit()
                            .frame(width: 70,height: 70)
                    )
                
                    Image("add-circle-icon")
                
                        .padding(.bottom,-9)
                        .padding(.trailing,-7)

            }
            
            Spacer()
            
            ZStack(alignment: .bottomTrailing) {
                Rectangle()
                    .frame(width: 80,height: 80)
                    .foregroundColor(.grayEFEEEE)
                    .cornerRadius(20)
                    .overlay(
                       
                        Image("hot-sauce")
                            .scaledToFit()
                            .frame(width: 70,height: 70)
                    )

                
                    
                    Image("add-circle-icon")
                        .padding(.bottom,-9)
                        .padding(.trailing,-7)

                
                
                
            }
            Spacer()
            
            ZStack(alignment: .bottomTrailing) {
                
                Rectangle()
                    .frame(width: 80,height: 80)
                    .foregroundColor(.grayEFEEEE)
                    .cornerRadius(20)
                    .overlay(
                        Image("tomato-sauce")
                            .scaledToFit()
                            .frame(width: 70,height: 70)
                    )
                
                    Image("add-circle-icon")
                        .padding(.bottom,-9)
                        .padding(.trailing,-7)

            }

        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
