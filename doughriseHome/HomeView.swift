//
//  HomeView.swift
//  doughriseHome
//
//  Created by Brady Rhodes on 11/14/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: ViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                Text("Budget Breakdown")
                    .font(.title2)
                    .bold()
                    .padding()
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 15){
                        ForEach(vm.categories) { category in
                            VStack(alignment: .center) {
                                Text(category.name)
                                ZStack(alignment: .leading){
                                    RoundedRectangle(cornerRadius: 5,style: .continuous)
                                        .frame(width: 160, height: 20)
                                        .foregroundColor(Color(red: 0.973, green: 0.553, blue: 0.153))
                                        .opacity(0.4)
                                    RoundedRectangle(cornerRadius: 5,style: .continuous)
                                        .frame(width: category.spent/category.budget * 160,height: 20)
                                        .foregroundColor(Color(red: 0.829, green: 0.521, blue: 0.059))
                                }
                                .frame(height: 15)
                                Text("\(category.spent/category.budget*100, specifier: "%.0f")% of Budget Spent")
                                    .font(.caption2)
                                HStack{
                                    VStack(alignment: .leading){
                                        Group{
                                            Text("Budget")
                                                .padding(.bottom, 2)
                                            Text("Spent")
                                                .padding(.bottom, 1)
                                            Text("Left")
                                                .padding(.bottom, 2)
                                        }
                                        .font(.caption)
                                        .padding(.trailing)
                                        
                                    }
                                    VStack(alignment: .center){
                                        Group{
                                            Text("$\(category.budget, specifier: "%.0f")")
                                            Text("$\(category.spent, specifier: "%.0f")")
                                                .foregroundColor(.red)
                                            Text("$\(category.budget - category.spent, specifier: "%.0f")")
                                                .foregroundColor(.green)
                                        }
                                        .frame(width:37,height:10)
                                        .padding(.bottom, 2)
                                        .font(.footnote)
                                    }
                                    VStack(alignment: .trailing){
                                        Image(systemName: "dollarsign.circle")
                                            .foregroundColor(.blue)
                                            .font(.title)
                                            .bold()
                                            .padding(.leading)
                                    }
                                }
                            }
                            .frame(width: 180, height: 135)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 4, x: 0, y: 4))
                                
                            }
                            NavigationLink(destination: {
                                AddCategoryView(formVM: CategoryFormViewModel())
                            },
                                           label: {
                                VStack{
                                    Text("Add a Category").padding(.bottom)
                                        .foregroundColor(.black)
                                    Image(systemName: "plus")
                                        .font(.custom("bigtitle", fixedSize: 90))
                                        .foregroundColor(.black)
                                }
                                .frame(width: 180, height: 135)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 4, x: 0, y: 4))
                            })
                        }
                    }
                    .toolbar{
                        ToolbarItem(placement: .principal){
                            Text("November 2022")
                                .bold()
                        }
                        ToolbarItem(placement: .primaryAction){
                            Image(systemName: "plus")
                                .bold()
                        }
                        ToolbarItem {
                            Image(systemName: "chevron.right")
                                .bold()
                                .padding(.trailing,60)
                        }
                    }
                }
            }
        }
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
                .environmentObject(ViewModel())
            
        }
    }
    
}
