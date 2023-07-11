//
//  CartTab.swift
//  YumYumNow
//
//  Created by mai nguyen on 7/9/23.
//

import SwiftUI

struct CartTab: View {
    var body: some View {
        
        VStack(spacing: 22) {
            
            Text("2 Items in cart")
                .font(.poppinsRegularFont(size: 24))
                .foregroundColor(.black101010)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.horizontal,35)

            
            addedFoodView()
            
            VStack(alignment: .leading){
                Text("Payment Method")
                    .font(.poppinsMediumFont(size: 17))
                    .foregroundColor(.black303030)
                
                ZStack() {
                    Rectangle()
                        .frame(height: 89)
                        .foregroundColor(.grayEFEEEE)
                        .cornerRadius(20)
                    
                    HStack{
                        Image("payment-card")
                            .frame(width: 99,height: 55)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.trailing,16)

                        
                        VStack{
                            Text("Jenius Card")
                                .font(.poppinsMediumFont(size: 18))
                                .foregroundColor(.black)
                            Text("0274 7414 ***")
                                .font(.poppinsMediumFont(size: 14))
                                .foregroundColor(.gray6F6D6D)

                        }
                        
                        Spacer()

                        Image("arrow-back")
                            .frame(width: 24,height: 24)

                    }
                    .padding(.horizontal,25)

                    
                    
                }
                .frame(maxWidth: .infinity)
                    
                
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,35)
            
            receiptInfo ()
            Button {
                
            } label: {
                Text("Order")
                    .font(.poppinsSemiBoldFont(size: 27))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,13)

                   
            }
            .background {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.purple462B9C)
            }
            .padding(.horizontal,50)
            
            
            Button {
                
            } label: {
                Text("Back to Menu")
                    .font(.poppinsRegularFont(size: 18))
                    .foregroundColor(.black303030)

                   
            }
           
        }
        .frame(width: UIScreen.main.bounds.width)
    }
    

    
    @ViewBuilder func addedFoodView() -> some View {
        VStack{
            
            ForEach(foods, id: \.self) { item in
                VStack{
                    AddedItem(item: item)
                }
            }
            
        }
    }
    
    @ViewBuilder func receiptInfo() -> some View {
        VStack(spacing:14){
            
            HStack {
                Text("Subtotal")
                    .foregroundColor(.gray6F6D6D)
                    .font(.interFontMedium(size: 16))

                
                Spacer()
                Text("$52")
                    .font(.poppinsBoldFont(size: 16))
                    .foregroundColor(.grayText868585)

                

            }
            
            HStack {
                Text("Tax 10%")
                    .foregroundColor(.gray6F6D6D)
                    .font(.interFontMedium(size: 16))
                

                Spacer()
                Text("$5")
                    .font(.poppinsBoldFont(size: 16))
                    .foregroundColor(.grayText868585)


            }
            
            HStack {
                Text("Total")
                    .font(.poppinsMediumFont(size: 22))
                    .foregroundColor(.black303030)
                
                Spacer()
                
                Text("$57")
                    .font(.poppinsBoldFont(size: 22))
                    .foregroundColor(.yellowTextC9AA05)

            }
            
        }
        .padding(.horizontal,35)
    }
}

struct CartTab_Previews: PreviewProvider {
    static var previews: some View {
        CartTab()
    }
}


struct AddedItem: View {
    
    var item: Food
    @State private var quantityLabel: Int = 1

    
    var body: some View {
        
        HStack {
            Rectangle()
                .frame(width: 100,height: 130)
                .foregroundColor(.grayEFEEEE)
                .cornerRadius(20)
                .overlay(
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80,height: 80)
                )
                .padding(.trailing,20)
            
            VStack(spacing:12) {
                Text(item.foodName)
                    .font(.poppinsMediumFont(size: 16))
                    .foregroundColor(.black303030)
                Text(item.price)
                    .font(.poppinsBoldFont(size: 17))
                    .foregroundColor(.yellowTextC9AA05)
                
                quantityOfAddedItem()
            }
            
            Spacer()
            
            
            Button {
                
            } label: {
                Image("highlight-off")
                    .frame(width: 24,height: 24)
            }

        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal,35)
       
    }
    
    func quantityOfAddedItem() -> some View {
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
    
}
