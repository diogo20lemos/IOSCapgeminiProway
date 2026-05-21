//
//  ContactViewModel.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 21/05/26.
//

import Foundation
internal import Combine
import SwiftUI

class ContactViewModel: ObservableObject {
    
    @Published var contatos: [ContactCompleto] = []
    
    let service = ViaCEPService()
    
    // ADD
    func adicionar(contato: ContactCompleto) {
        contatos.append(contato)
    }
    
    // DELETE
    func remover(at offsets: IndexSet) {
        contatos.remove(atOffsets: offsets)
    }
    
    // UPDATE
    func atualizar(index: Int, contato: ContactCompleto) {
        contatos[index] = contato
    }
    
    // API CEP
    
    func buscarCEP(cep: String) async -> ViaCEPResponse? {
            return await service.buscarCEP(cep: cep)
        }

}
