//
//  HomeTab.swift
//  YumYumNow
//
//  Created by mai nguyen on 7/9/23.
//

import SwiftUI


enum SelectedOption: String, CaseIterable {
    case all
    case burger
    case pizza
    case dessert
    
    var title: String{
        switch self {
            
        case .all:
            return "All"
        case .burger:
            return "Burger"
        case .pizza:
            return "Pizza"
        case .dessert:
            return "Dessert"
        }
    }
}



struct HomeTab: View {
    @State var searchInput: String = ""
    @State var selectedOption: SelectedOption = SelectedOption.all

    @Namespace var animation
    var body: some View {
        
        VStack(spacing: 0){
            HStack() {
                
                Text("Menu")
                    .font(.poppinsRegularFont(size: 42))
                    .foregroundColor(.black101010)
                Spacer()

                Image("profile-pic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56,height: 56)
                    .clipShape(Circle())
            }
            .padding(.horizontal,28)
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing:12){
                    customSearchBar()
                        .padding([.leading,.trailing],36)
                        .padding(.bottom,22)
                    
                    CustomButton(animation: animation, selectedOption: $selectedOption)
                        .padding(.bottom,14)
                   
                    promotion()
                        .padding(.horizontal,28)

                    
                    popular()
                        .padding(.horizontal,28)

                    
                }
                
            }
            .padding(.top,15)
        }
        .frame(width: UIScreen.main.bounds.width)

    }
    
    
    @ViewBuilder func customSearchBar() -> some View{
        HStack {
            Image("search-tab-icon").foregroundColor(.gray)
                .scaledToFit()
                .frame(width: 28,height: 26)
            TextField("Search", text: $searchInput)
                .font(.poppinsRegularFont(size: 22))
        }
        .padding(.horizontal,19)
        .padding(.vertical,16)
        .background(Color.grayEFEEEE)
        .cornerRadius(50)
        
    }
    
    @ViewBuilder func promotion() -> some View {
        VStack(alignment: .leading,spacing: 4){
            Text("Promotion")
                .font(.poppinsRegularFont(size: 24))
                .foregroundColor(.black101010)
            
            
            ZStack{
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.lightPurpleRadient1, .lightPurpleRadient2]),
                                       startPoint: .center,
                                       endPoint: .bottomTrailing))
                
                    .frame(height: 137)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20)
                
                
                HStack {
                    VStack(alignment: .leading){
                        Text("Today’s Offer")
                            .font(.poppinsRegularFont(size: 16))
                        Text("Free box of Fries")
                            .font(.poppinsSemiBoldFont(size: 20))
                        Text("on all orders above $150")
                            .font(.poppinsRegularFont(size: 16))

                    }
                    Spacer()
                    Image("French-fries")
                        .scaledToFit()
                        .frame(width: 107,height: 107)
                        .clipShape(RoundedRectangle(cornerRadius: 17))

                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal,23)

                
            }
                

            
        }
    }
    
    @ViewBuilder func popular() -> some View {
        VStack(alignment: .leading,spacing: 4){

            Text("Popular")
                .font(.poppinsRegularFont(size: 24))
                .foregroundColor(.black101010)
            
            ZStack{
                HStack {
                    ZStack(alignment: .bottom){
                        RoundedRectangle(cornerRadius: 20)
                             .fill(
                                 LinearGradient(gradient: Gradient(colors: [.neutralRadient1, .neutralRadient2]),
                                                startPoint: .center,
                                                endPoint: .bottomTrailing))
                             .frame(width: 161, height: 214)
                             
                        VStack {
                            Image("burger_sandwich1")
                                .scaledToFill()
                                .frame(width: 130,height: 98.77)
                            
                            VStack{
                                Text("Beef Burger")
                                    .font(.poppinsRegularFont(size: 18))
                                    .foregroundColor(.black101010)
                                
                                HStack{
                                    Text("$20")
                                        .font(.poppinsSemiBoldFont(size: 18))
                                        .foregroundColor(.yellowTextC9AA05)
                                    
                                    Spacer()
                                    Button(action: {
                                        
                                    }, label: {
                                        
                                        Image("add-circle-icon")
                                            .frame(width: 28,height:28)
                                        
                                    })
                                }
                            }
                            .padding(.horizontal,35)
                            
                        }
                        .padding(.bottom,12)

                         
                    }
                    
                    Spacer()
                    
                    ZStack(alignment: .bottom){
                        RoundedRectangle(cornerRadius: 20)
                             .fill(
                                 LinearGradient(gradient: Gradient(colors: [.neutralRadient1, .neutralRadient2]),
                                                startPoint: .center,
                                                endPoint: .bottomTrailing))
                             .frame(width: 161, height: 214)
                        
                       
                        VStack{
                            Image("pizza-fries")
                                .resizable()
                               .scaledToFill()
                               .frame(width: 130,height: 130)
                               .clipped()
                            

                            VStack{
                                Text("Pizza Fries")
                                    .font(.poppinsRegularFont(size: 18))
                                    .foregroundColor(.black101010)
                                
                                HStack{
                                    Text("$32")
                                        .font(.poppinsSemiBoldFont(size: 18))
                                        .foregroundColor(.yellowTextC9AA05)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                    }, label: {
                                        
                                        Image("add-circle-icon")
                                            .frame(width: 28,height:28)
                                        
                                    })
                                }
                            }
                            .padding(.horizontal,42)
                            .padding(.bottom,12)
                        }
                        
                    }
                    
                }
                
            }
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}


struct CustomButton: View {
    
//    var image: String
    // Since we're having asset Image...
//    var isSystemImage: Bool
    var animation: Namespace.ID
    @Binding var selectedOption: SelectedOption
    
    var body: some View{
//
//        Button(action: {
//            withAnimation(.easeInOut){
//                selectedOption = selectedOption
//            }
//        }, label: {
//            VStack{
//                Rectangle()
//                    .frame(width: 80,height: 80)
//                    .foregroundColor(.grayEFEEEE)
//                    .cornerRadius(20)
//                    .overlay(
//                        Image(image)
//                            .scaledToFit()
//                            .frame(width: 70,height: 70)
//                    )
//
//                Text(selectedOption)
//                    .font(.poppinsRegularFont(size: 17))
//
//            }
//
//        })
        
        
        HStack(spacing:18){
           
            VStack{
                Rectangle()
                    .frame(width: 80,height: 80)
                    .foregroundColor(selectedOption == .all ? .purple462B9C : .grayEFEEEE)
                    .cornerRadius(20)
                    .overlay(
                        Image("salad-pic")
                            .scaledToFit()
                            .frame(width: 70,height: 70)
                    )
                
                Text("All")
                    .font(.poppinsRegularFont(size: 17))
                    .foregroundColor(selectedOption == .all ? .purple462B9C : .grayText868585)


                
            }
            .onTapGesture {
                selectedOption = .all
            }
            .tag(SelectedOption.all)
            
            VStack{
                Rectangle()
                    .frame(width: 80,height: 80)
                    .foregroundColor(selectedOption == .burger ? .purple462B9C : .grayEFEEEE)
                    .cornerRadius(20)
                    .overlay(
                        Image("burger_sandwich1")
                            .scaledToFit()
                            .frame(width: 70,height: 70)
                    )
                
                Text("Burger")
                    .font(.poppinsRegularFont(size: 17))
                    .foregroundColor(selectedOption == .burger ? .purple462B9C : .grayText868585)


                
            }
            .onTapGesture {
                selectedOption = .burger
            }
            
            .tag(SelectedOption.burger)


            VStack{
                Rectangle()
                    .frame(width: 80,height: 80)
                    .foregroundColor(selectedOption == .pizza ? .purple462B9C : .grayEFEEEE)
                    .cornerRadius(20)
                    .cornerRadius(20)
                    .overlay(
                        Image("3626 1")
                            .scaledToFit()
                            .frame(width: 70,height: 70)
                    )
                
                Text("Pizza")
                    .font(.poppinsRegularFont(size: 17))
                    .foregroundColor(selectedOption == .pizza ? .purple462B9C : .grayText868585)


            } .onTapGesture {
                selectedOption = .pizza
            }
            .tag(SelectedOption.pizza)

           
            VStack{
                Rectangle()
                    .frame(width: 80,height: 80)
                    .foregroundColor(selectedOption == .dessert ? .purple462B9C : .grayEFEEEE)
                    .cornerRadius(20)
                    .overlay(
                        Image("cheesecake")
                            .scaledToFit()
                            .frame(width: 70,height: 70)
                    )
                
                Text("Dessert")
                    .font(.poppinsRegularFont(size: 17))
                    .foregroundColor(selectedOption == .dessert ? .purple462B9C : .grayText868585)

            }
            .onTapGesture {
                selectedOption = .dessert
            }
            .tag(SelectedOption.dessert)


        }
        
    }
}
