<center> <h1>Aplicativo Rick and Morty </h1> </center>

<h4>Tecnologias</h4>
<li>Flutter
<li>Dart 
<br>


<center>
<div style="background-color: #f0f0f0; padding: 15px; display: inline-block; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1);">
  <img src="https://skillicons.dev/icons?i=dart" /> 
  <img src="https://skillicons.dev/icons?i=flutter" />
</div>
</center>

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

<h5>Sobre a arquitetura</h5>
Foi escolhido essa forma por além de ser uma arquitetura moderna e amplamente adotada no mercado, oferece diversas vantagens como gerenciamento de estado reativo, injeção de dependência simplificada, navegação sem context e menor quantidade de código boilerplate comparado a outras soluções, um exemplo seria o <b>Bloc</b>, como o projeto é pequeno, não há necessidade de utilizar o Bloc como arquitetura, apesar de não haver empecilhos.

<h2>Estrutura completa</h2>

- `lib/`
  - `app/`
    - `bindings/` 
      - `splash_binding.dart/`
    - `controllers/` 
      - `splash_controller.dart/`
    - `routes/` 
      - `app_pages.dart/`
      - `app_routes.dart/`
    - `ui/` 
      - `android/`
        - `detail_page.dart/`
        - `home_page.dart/`
        - `splash_screen_page.dart/`
    - `models/` 
  - `main.dart`