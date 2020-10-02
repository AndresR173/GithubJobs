//
//  ContentView.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import SwiftUI

struct JobsView<Model>: View where Model: JobsViewModelProtocol {
    @ObservedObject var viewModel: Model
    @State private var position: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        HStack(alignment: .center) {
                            Image(systemName: "magnifyingglass")
                                .renderingMode(.template)
                                .foregroundColor(Color("SearchItemColor"))
                                .padding(.horizontal, 10)
                            TextField("Enter your position", text: $position)
                                .foregroundColor(Color("AccentColor"))

                        }
                        .frame(maxHeight: 50)
                        .background(Color("AccentColor"))
                        .cornerRadius(10.0)

                        Button(action: {
                            viewModel.searchJobsFor(position)
                        }, label: {
                            Text("Search")
                                .foregroundColor(Color("SearchItemColor"))
                        }).padding()
                        .frame(maxHeight: 50)
                        .background(Color("AccentColor"))
                        .cornerRadius(10.0)
                    }.padding()

                    getContent()
                        .padding()
                }
            }
            .navigationBarTitle("IT Jobs")
            .foregroundColor(.black)
        }
    }

    fileprivate func getContent() -> some View {
        switch viewModel.status {
        case .initial:
            return AnyView(EmptyState(message: "Please enter a search criteria"))
        case .loaded:
            return AnyView(EmptyState(message: "There are no results for the search criteria"))
        default:
            return AnyView(VStack {
                Spacer()
                LottieView(name: "searching")
                    .frame(width:300, height:300)
                Spacer()
            })
        }
    }
}

struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            JobsView(viewModel: JobsViewModel(service: JobsService()))
                .preferredColorScheme(.light)
        }
    }
}
