//
//  UserProfileView.swift
//  ss-ios-new
//
//  Created by Neo Lee on 10/2/24.
//

import SwiftUI
import UIKit

struct UserProfileView: View {
    let currentUser: User
    let profileUser: User
    private let blurrView = UIView()
    
    init(profileUser: User, currentUser: User? = nil) {
        self.profileUser = profileUser
        if let current = currentUser {
            self.currentUser = current
        } else {
            self.currentUser = profileUser
        }
    }
    
    var body: some View {
        ScrollView {
            ZStack{
                GeometryReader { proxy in
                    let frame = proxy.size
                    Image("User1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: frame.width, height: UIScreen.main.bounds.height)
                        .ignoresSafeArea(edges: .all)
                        .clipped()
                }
                .frame(height: UIScreen.main.bounds.height)
                
                GeometryReader { proxy in
                    BlurView(style: .light)
                        .ignoresSafeArea(edges: .all)

                }
                .frame(height: UIScreen.main.bounds.height)
                
                Color.black
                    .opacity(0.8)
                    .offset(y: 170)
                    .ignoresSafeArea(edges: .all)
                
                VStack {
                    Image("User1")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 7)
                        .padding(.top, 60)
                    
                    
                    Text("SkylowUser1234")
                        .font(.system(size: 20, weight: .medium))
                        .padding(.top, 25)
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("I like taking photos. I like taking photos. I like taking photos. I like taking")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top, 4)
                    
                    Spacer().frame(height: 20)
                    
                    HStack (spacing: 20){
                        Text("\(profileUser.followerCount)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Followers")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Divider()
                            .frame(height: 20)
                            .background(Color.white)
                        
                        Text("\(profileUser.followingIds.count)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Following")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    
                    Spacer().frame(height: 30)
                    
                    
                    HStack (spacing: 50){
                        
                        Button(action: {
                            // Action for Edit Profile
                        }) {
                            Text("Edit profile")
                                .padding()
                                .frame(width: 125, height: 30)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)  // White border
                                )
                                .foregroundColor(.white)
                        }
                        
                        
                        Button(action: {
                            // Action for Share
                        }) {
                            Text("Share my AI")
                                .padding()
                                .frame(width: 125, height: 30)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 0.3, blue: 0.5), Color(red: 1, green: 0.6, blue: 0.4)]),
                                                startPoint: .leading, endPoint: .trailing)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    Spacer().frame(height: 20)
                        
                    Divider()
                        .frame(height: 2)
                        .background(Color.gray.opacity(0.8))
                        .padding(.horizontal)
                    
                    
                    
                    Spacer().frame(height: 20)
                    
                    //THE LAZYVSTACK WILL BE HERE
                    
                    List(posts) { post in
                        
                        HStack {
                            Image(post.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 250)
                                .clipped()
                                .cornerRadius(10)
                                        
                            Spacer().frame(width: 20)
                                        
                            Image(post.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 250)
                                .clipped()
                                .cornerRadius(10)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    .padding(.horizontal)
                    
                    
                    
                    Spacer()
                }
 
            }
            .ignoresSafeArea(edges: .all)
        }
        .toolbarRole(.editor)
        .toolbar(.visible, for: .tabBar)
    }
}

#Preview {
    UserProfileView(profileUser: mockUser1)
}

struct BlurView : UIViewRepresentable{
    let style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        //Do Nothing
    }
}

struct userPost: Identifiable {
    let id = UUID()
    let imageName: String
}

let posts: [userPost] = [
    userPost(imageName: "User1"), // Replace with actual image names
    userPost(imageName: "User1"),
]
