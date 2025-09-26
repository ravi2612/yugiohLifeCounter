//
//  HomeView.swift
//  yugiohLifeCounter
//
//  Created by Ravi navarro on 26/09/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var timeElapsedInSeconds: Int = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerIsRunning = false
    let timeLimitInSeconds = 50 * 60
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(spacing: 0) {
                ZStack {
                    Color(.purple)
                    Text("8000")
                        .font(.headline)
                        .scaleEffect(4, anchor: .center)
                        .rotationEffect(.degrees(180))
                }
                ZStack {
                    Color(.cyan)
                    Text("8000")
                        .font(.headline)
                        .scaleEffect(4, anchor: .center)
                }
            }
            Rectangle()
                .frame(width: .infinity, height: 2)
            Text(timeString(from: timeElapsedInSeconds))
                .padding(.all, 4)
                .frame(maxWidth: 100)
                .background(RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color.white)
                    .shadow(color: .black, radius: 8))
        }
        .ignoresSafeArea()
        .onReceive(timer) { _ in
            if timerIsRunning && timeElapsedInSeconds < timeLimitInSeconds {
                timeElapsedInSeconds += 1
            } else if timeElapsedInSeconds == timeLimitInSeconds {
                timerIsRunning = false
            }
        }
        .onAppear(perform: {
            timerIsRunning = true
        })
    }
    
    func timeString(from totalSeconds: Int) -> String {
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    HomeView()
}
