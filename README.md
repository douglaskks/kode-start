<center> <h1>Aplicativo Rick and Morty </h1> </center>

<h4>Tecnologias</h4>
<li>Flutter
<li>Dart 
<center><img src="https://skillicons.dev/icons?i=dart" /> <img src="https://skillicons.dev/icons?i=flutter" /></center>


<h4> Projeto </h4>

O Aplicativo Rick and Morty tem o intuito de mostrar todos os personagens da série <b>Rick and Morty</b> onde ao clicar nos personagens, irá obter detalhes do personagem em outra tela, o aplicativo tem funcionalidade de buscar por nome, e demais melhorias de UX.

<h4>Arquitetura</h4>
A arquitetura selecionada foi a <b>Arquitetura GetX Pattern</b> ou de forma mais técnica <b>GetX Architecture</b>
<br>
<br>

- `lib/`
  - `app/`
    - `bindings/` — **Injeção de dependências**
    - `controllers/` — **Regras de negócios**
    - `routes/` — **Rotas de navegação**
    - `ui/` — **Telas do Flutter**
    - `models/` — **Modelos de Dados**
  - `main.dart`

  <br>

Foi escolhido essa forma por além de ser uma arquitetura moderna e amplamente adotada no mercado, oferece diversas vantagens como gerenciamento de estado reativo, injeção de dependência simplificada, navegação sem context e menor quantidade de código boilerplate comparado a outras soluções, um exemplo seria o <b>Bloc</b>, como o projeto é pequeno, não há necessidade de utilizar o Bloc como arquitetura, apesar de não haver empecilhos.