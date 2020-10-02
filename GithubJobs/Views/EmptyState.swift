//
//  EmptyState.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import SwiftUI

struct EmptyState: View {
    let message: String
    var body: some View {
        VStack {
            Spacer()
            LottieView(name: "empty_state")
                .frame(width:300, height:300)
            Text(message)
                .fontWeight(.light)
                .font(.callout)
                .foregroundColor(Color("EmptyStateColor"))
            Spacer()
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(message: "Please enter a search criteria")
    }
}
