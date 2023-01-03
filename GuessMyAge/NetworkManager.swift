//
//  NetworkManager.swift
//  GuessMyAge
//
//  Created by Kinney Kare on 1/3/23.
//

import Foundation
import Combine

class NetworkManager {
  func getAge(name: String) -> AnyPublisher<Int, Error> {
    let url = URL(string: "https://api.agify.io/")!
    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    request.httpBody = "{\"name\": \"\(name)\"}".data(using: .utf8)

    return URLSession.shared
      .dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: AgeResponse.self, decoder: JSONDecoder())
      .map { $0.age }
      .eraseToAnyPublisher()
  }
}

struct AgeResponse: Codable {
  let age: Int
}

