/*
 Atividade de acompanhamento - Nivelamento
     Crie um sistema para gerenciar contatos. Neste sistema, teremos as seguintes funcionalidades:
 Cadastro: Nome, idade, telefone e e-mail;
 Listagem: Listar todos os contatos e seus respectivos dados;
 Alteração: Liste o nome dos contatos, selecione pelo identificador e peça os dados: nome, idade, telefone e e-mail;
 Remoção: Liste o nome dos contatos, e remova pelo identificador;
 Finalizar: Sair do sistema.
 Algumas regras:
 Todos os nomes cadastrados precisam ser diferentes, exemplo:
 Ana e Ana <- Não deverá ser aceito.
 Ana Carolina e Ana Lúcia <- Aceito.
 Todas as informações do contato no ato de cadastro e alteração devem estar devidamente preenchidos.
 Ao alterar ou remover, se o usuário informar um identificador inválido, deverá haver um retorno informando que a informação não é condizente com os identificadores listados.
 Ao término do desenvolvimento:
 Enviar para o GitHub;
 Compartilhar o link via e-mail: contato@ralflima.com
 Data limite para entrega: 13/04 às 10h.

 */



/*
 IMPORTANTE: esse codigo só roda em um projeto criado do tipo comand line
 Caso for rodar crie um projeto do tipo comend line e descomente a ultima
 linha desse codigo que tem o main
 */
import Foundation

// Model

struct Contato {
    var id: Int
    var nome: String
    var idade: Int
    var telefone: String
    var email: String

    func mostrarDados() {
        print("ID: \(id)")
        print("Nome: \(nome)")
        print("Idade: \(idade) anos")
        print("Telefone: \(telefone)")
        print("E-mail: \(email)")
    }
}

// Dados

var contatos: [Contato] = []
var proximoId: Int = 1

// Utilitários

func gerarId() -> Int {
    let idAtual = proximoId
    proximoId += 1
    return idAtual
}

func nomeJaExiste(_ nome: String, ignorandoId: Int? = nil) -> Bool {
    let nomeNormalizado = nome
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .lowercased()

    return contatos.contains { contato in
        let mesmoNome = contato.nome
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased() == nomeNormalizado

        let idDiferente = ignorandoId == nil || contato.id != ignorandoId
        return mesmoNome && idDiferente
    }
}

// Menu

func menu() -> String {
    print("""
            MENU
    -------------------------
    1. Cadastrar Contato
    2. Listar Contatos
    3. Alterar Contato
    4. Remover Contato
    5. Sair
    -------------------------
    """)
    return readLine() ?? ""
}

// Funcionalidades

func cadastrarContato() {
    print("Digite o nome completo:")
    let nome = readLine() ?? ""

    print("Digite a idade:")
    let idadeTexto = readLine() ?? ""

    print("Digite o telefone:")
    let telefone = readLine() ?? ""

    print("Digite o e-mail:")
    let email = readLine() ?? ""

    if nome.isEmpty || idadeTexto.isEmpty || telefone.isEmpty || email.isEmpty {
        print("❌ Todas as informações devem ser preenchidas.\n")
        return
    }

    guard let idade = Int(idadeTexto), idade > 0 else {
        print("❌ Idade inválida.\n")
        return
    }

    if nomeJaExiste(nome) {
        print("❌ Já existe um contato com esse nome.\n")
        return
    }

    let contato = Contato(
        id: gerarId(),
        nome: nome,
        idade: idade,
        telefone: telefone,
        email: email
    )

    contatos.append(contato)
    print("✅ Contato cadastrado com sucesso! ID: \(contato.id)\n")
}

func listarContatos() {
    if contatos.isEmpty {
        print("📭 Nenhum contato cadastrado.\n")
        return
    }

    print("📋 Lista de Contatos:")
    for contato in contatos {
        contato.mostrarDados()
        print("-------------------------")
    }
}

func alterarContato() {
    if contatos.isEmpty {
        print("📭 Não há contatos para alterar.\n")
        return
    }

    listarContatos()

    print("Informe o ID do contato a ser alterado:")
    guard let id = Int(readLine() ?? "") else {
        print("❌ ID inválido.\n")
        return
    }

    guard let index = contatos.firstIndex(where: { $0.id == id }) else {
        print("❌ Identificador não condizente com os contatos listados.\n")
        return
    }

    print("Digite o novo nome:")
    let nome = readLine() ?? ""

    print("Digite a nova idade:")
    let idadeTexto = readLine() ?? ""

    print("Digite o novo telefone:")
    let telefone = readLine() ?? ""

    print("Digite o novo e-mail:")
    let email = readLine() ?? ""

    if nome.isEmpty || idadeTexto.isEmpty || telefone.isEmpty || email.isEmpty {
        print("❌ Todos os campos devem ser preenchidos.\n")
        return
    }

    guard let idade = Int(idadeTexto), idade > 0 else {
        print("❌ Idade inválida.\n")
        return
    }

    if nomeJaExiste(nome, ignorandoId: id) {
        print("❌ Já existe um contato com esse nome.\n")
        return
    }

    contatos[index].nome = nome
    contatos[index].idade = idade
    contatos[index].telefone = telefone
    contatos[index].email = email

    print("✅ Contato alterado com sucesso!\n")
}

func removerContato() {
    if contatos.isEmpty {
        print("📭 Não há contatos para remover.\n")
        return
    }

    listarContatos()

    print("Informe o ID do contato a ser removido:")
    guard let id = Int(readLine() ?? "") else {
        print("❌ ID inválido.\n")
        return
    }

    guard let index = contatos.firstIndex(where: { $0.id == id }) else {
        print("❌ Identificador não condizente com os contatos listados.\n")
        return
    }

    let remover = contatos.remove(at: index)
    print("✅ Contato '\(remover.nome)' removido com sucesso!\n")
}

// Execução

func main() {
    var continuar = true

    while continuar {
        switch menu() {
        case "1":
            cadastrarContato()
        case "2":
            listarContatos()
        case "3":
            alterarContato()
        case "4":
            removerContato()
        case "5":
            continuar = false
            print("👋 Sistema finalizado.")
        default:
            print("❌ Opção inválida.\n")
        }
    }
}

//main()
