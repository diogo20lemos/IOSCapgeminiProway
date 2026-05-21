//
//  ViaCEPService.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 21/05/26.
//

import Foundation

class ViaCEPService {
    
    func buscarCEP(cep: String) async -> ViaCEPResponse? {
        let urlString = "https://viacep.com.br/ws/\(cep)/json/"
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ViaCEPResponse.self, from: data)
            return decoded
        } catch {
            print(error)
            return nil
        }
    }
}
