/*
 Exercício - Jogo de Perguntas

 Seleção de tema: Ao iniciar o jogo, o jogador deve selecionar um tema para as perguntas. Os temas podem ser definidos pelo desenvolvedor.
 Exemplos:
 História, Física, Geografia e Matemática
 Java, Kotlin, Python e Swift
 Livros, Filmes, Séries e Documentários

 Perguntas e respostas: Após a escolha do tema, serão feitas cinco perguntas relacionadas a ele. Cada pergunta terá quatro opções de resposta, sendo apenas uma correta.

 Após o jogador responder, informe se a resposta está correta ou incorreta. Caso a resposta esteja incorreta, exiba a resposta correta.

 Pontuação e repetição: Ao final das cinco perguntas, mostre ao jogador quantas respostas estavam corretas e quantas estavam incorretas. Em seguida, exiba novamente os temas para que o jogo possa ser reiniciado.
 */

import SwiftUI

struct Pergunta {
    let texto: String
    let opcoes: [String]
    let respostaCorreta: Int
}

struct JogoDePerguntas: View {

    @State private var opcaoSelecionada: String = ""
    @State private var indicePergunta = 0
    @State private var acertos = 0
    @State private var mostrarResultado = false
    @State private var feedback: String? = nil

    let opcoes: [String] = ["Java", "Kotlin", "Python", "Swift"]

    let perguntasPorTema: [String: [Pergunta]] = [
        "Swift": [
            Pergunta(
                texto: "Quem criou a linguagem Swift?",
                opcoes: ["Google", "Apple", "Microsoft", "IBM"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Em que ano Swift foi lançada?",
                opcoes: ["2012", "2013", "2014", "2015"],
                respostaCorreta: 2
            ),
            Pergunta(
                texto: "Qual palavra define constante em Swift?",
                opcoes: ["var", "let", "const", "static"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Swift é usada principalmente para:",
                opcoes: ["Android", "iOS", "Windows", "Web"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Swift é uma linguagem:",
                opcoes: ["Procedural", "Interpretada", "Orientada a objetos", "Multi‑paradigma"],
                respostaCorreta: 3
            )
        ],
        "Java": [
            Pergunta(
                texto: "Quem é o criador da linguagem Java?",
                opcoes: ["Linus Torvalds", "James Gosling", "Guido van Rossum", "Bjarne Stroustrup"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Java foi criada originalmente para:",
                opcoes: ["Web", "Dispositivos embarcados", "Mobile", "Jogos"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Qual palavra-chave define herança em Java?",
                opcoes: ["implements", "extends", "inherits", "super"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Qual destes NÃO é um tipo primitivo em Java?",
                opcoes: ["int", "double", "String", "boolean"],
                respostaCorreta: 2
            ),
            Pergunta(
                texto: "Java é uma linguagem:",
                opcoes: ["Compilada apenas", "Interpretada apenas", "Compilada e interpretada", "Script"],
                respostaCorreta: 2
            )
        ],
        "Kotlin": [
            Pergunta(
                texto: "Quem desenvolveu a linguagem Kotlin?",
                opcoes: ["Google", "JetBrains", "Microsoft", "Oracle"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Kotlin roda principalmente sobre qual plataforma?",
                opcoes: ["CLR", "JVM", "Node.js", "LLVM"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Qual símbolo é usado para variável imutável em Kotlin?",
                opcoes: ["var", "let", "val", "const"],
                respostaCorreta: 2
            ),
            Pergunta(
                texto: "Kotlin é oficialmente recomendado para Android desde:",
                opcoes: ["2015", "2016", "2017", "2018"],
                respostaCorreta: 2
            ),
            Pergunta(
                texto: "Kotlin é totalmente interoperável com:",
                opcoes: ["Swift", "C#", "Java", "Python"],
                respostaCorreta: 2
            )
        ],
        "Python": [
            Pergunta(
                texto: "Quem criou a linguagem Python?",
                opcoes: ["Dennis Ritchie", "Guido van Rossum", "James Gosling", "Brendan Eich"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Python é uma linguagem:",
                opcoes: ["Compilada", "Interpretada", "Assembly", "Binária"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Qual símbolo é usado para comentários em Python?",
                opcoes: ["//", "#", "/* */", "--"],
                respostaCorreta: 1
            ),
            Pergunta(
                texto: "Python é muito usada na área de:",
                opcoes: ["Jogos AAA", "Sistemas embarcados", "Ciência de dados", "Drivers"],
                respostaCorreta: 2
            ),
            Pergunta(
                texto: "Qual destas estruturas define uma função em Python?",
                opcoes: ["function", "def", "fun", "lambda"],
                respostaCorreta: 1
            )
        ]
    ]

    var body: some View {
        VStack(spacing: 20) {

            Text("Jogo de Perguntas")
                .font(.title3)
                .fontWeight(.semibold)

            if opcaoSelecionada.isEmpty {
                HStack {
                    Text("Selecionar tema:")

                    Picker("Selecione uma linguagem", selection: $opcaoSelecionada) {
                        Text("Selecione").tag("")
                        ForEach(opcoes, id: \.self) { opcao in
                            Text(opcao).tag(opcao)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            else {
                telaDoJogo
            }
        }
        .padding()
        .alert("Resultado Final", isPresented: $mostrarResultado) {
            Button("Jogar novamente") {
                reiniciarJogo()
            }
        } message: {
            Text("Acertos: \(acertos)\nErros: \(5 - acertos)")
        }
    }

    var telaDoJogo: some View {
        let perguntas = perguntasPorTema[opcaoSelecionada]!

        return VStack(spacing: 16) {

            Text("Tema: \(opcaoSelecionada)")
                .font(.headline)

            Text("Pergunta \(indicePergunta + 1) de 5")
                .font(.caption)

            Text(perguntas[indicePergunta].texto)
                .font(.title3)
                .multilineTextAlignment(.center)

            ForEach(0..<4, id: \.self) { index in
                Button(perguntas[indicePergunta].opcoes[index]) {
                    validarResposta(index, perguntas)
                }
                .buttonStyle(.bordered)
            }

            if let feedback {
                Text(feedback)
                    .foregroundColor(feedback.contains("✅") ? .green : .red)
            }
        }
    }

    func validarResposta(_ resposta: Int, _ perguntas: [Pergunta]) {
        let correta = perguntas[indicePergunta].respostaCorreta

        if resposta == correta {
            acertos += 1
            feedback = "✅ Resposta correta!"
        } else {
            feedback = "❌ Incorreta. Resposta correta: \(perguntas[indicePergunta].opcoes[correta])"
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            feedback = nil

            if indicePergunta < perguntas.count - 1 {
                indicePergunta += 1
            } else {
                mostrarResultado = true
            }
        }
    }

    func reiniciarJogo() {
        opcaoSelecionada = ""
        indicePergunta = 0
        acertos = 0
    }
}

#Preview {
    JogoDePerguntas()
}
