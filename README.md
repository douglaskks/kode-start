# 🚀 Rick and Morty App - Kode Start 2025

> Aplicativo Flutter desenvolvido para o **Desafio Técnico Kode Start 2025** - Workshop de Flutter da Kobe

<div align="center">

![Status](https://img.shields.io/badge/Status-Concluído-success?style=for-the-badge)

![Flutter](https://img.shields.io/badge/Flutter-3.24.3-blue?style=for-the-badge&logo=flutter)

![Dart](https://img.shields.io/badge/Dart-3.5.3-blue?style=for-the-badge&logo=dart)

<img src="https://skillicons.dev/icons?i=dart,flutter,git,github,vscode" />

</div>

## 📱 Sobre o Projeto

Aplicativo que consome a [Rick and Morty API](https://rickandmortyapi.com/) para exibir informações detalhadas sobre os personagens da série. Desenvolvido seguindo as melhores práticas de desenvolvimento Flutter e focado em **performance** e **experiência do usuário**.

### 🎯 Diferenciais Implementados

- **🔍 Busca em tempo real** com debounce (500ms)
- **♾️ Scroll infinito** com paginação automática  
- **🔄 Pull to refresh** para atualizar dados
- **💾 Cache de imagens** para melhor performance
- **⚡ Loading states** em todas as operações
- **🛡️ Error handling** robusto
- **🎨 Splash screen**

## 📸 Screenshots

| Splash Screeen | Home Screen | Search Feature | Details Screen |
|:---:|:---:|:---:|:---:|
|  <img src="assets/SplashScreen.png" alt="Lista de Personagens" width="250"/> | <img src="assets/telaHomeSearch.png" alt="Lista de Personagens" width="250"/> | <img src="assets/searchScreen.png" alt="Busca de Personagens" width="250"/> | <img src="assets/image-3.png" alt="Detalhes do Personagem" width="250"/> |
|Splash Screen Animada para dar um destaque ao app quando o usuário entrar| Lista completa de personagens com scroll infinito | Busca em tempo real por nome | Informações detalhadas do personagem |

## 🏗️ Arquitetura

### GetX Pattern - Modern Flutter Architecture

Escolhido pela **eficiência** e **simplicidade**, ideal para projetos que precisam de:

- **⚡ Gerenciamento de Estado Reativo** - Atualizações automáticas da UI
- **🎯 Injeção de Dependências Simplificada** - Menos boilerplate  
- **🧭 Navegação sem Context** - Código mais limpo
- **🚀 Performance Otimizada** - Ideal para apps responsivos
- **📚 Curva de Aprendizado Suave** - Manutenção facilitada

> 📖 **Aprenda mais sobre GetX:** [Documentação onde estudei a arquitetura](https://kauemurakami.github.io/getx_pattern/)

### 📂 Estrutura do Projeto

```
lib/
├── app/
│   ├── bindings/              # Injeção de dependências
│   │   ├── detail_binding.dart
│   │   ├── home_binding.dart
│   │   └── splash_binding.dart
│   ├── controller/            # Regras de negócio
│   │   ├── detail_controller.dart
│   │   ├── home_controller.dart
│   │   └── splash_controller.dart
│   ├── data/                  # Camada de dados
│   │   ├── model/
│   │   │   └── character_model.dart
│   │   └── services/
│   │       └── character_service.dart
│   ├── routes/                # Navegação
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   └── ui/                    # Interface do usuário
│       ├── android/
│       │   ├── detail_page.dart
│       │   ├── home_page.dart
│       │   └── splash_screen_page.dart
│       └── widgets/
│           ├── app_bar_custom.dart
│           └── character_card.dart
└── main.dart
```

## ✅ Funcionalidades Implementadas

### 📋 Requisitos Obrigatórios
- [x] **Lista scrollable de personagens** - ListView.builder otimizado
- [x] **Cards com Nome + Imagem** - Design seguindo protótipo Figma
- [x] **Tela de detalhes completa** - Nome, imagem, espécie, gênero, status, origem, localização
- [x] **Navegação entre telas** - GetX navigation

### 🚀 Funcionalidades Extras (Diferenciais)
- [x] **Busca por nome** - Debounce + API integration
- [x] **Scroll infinito** - Paginação automática
- [x] **Pull to refresh** - Atualização manual
- [x] **Cache de imagens** - CachedNetworkImage
- [x] **Estados de loading** - UX aprimorada
- [x] **Tratamento de erros** - Fallbacks e retry
- [x] **Splash screen animada** - Primeira impressão profissional

## 🛠️ Tecnologias e Dependências

### Core
- **Flutter** 3.24.3
- **Dart** 3.5.3
- **GetX** - State management, dependency injection, navigation

### HTTP & Data
- **Dio** - HTTP client com interceptors e timeout
- **Cached Network Image** - Cache de imagens otimizado

### Principais Packages
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  get: ^4.7.2
  cached_network_image: ^3.4.1
  dio: ^5.9.0
```

## 🚦 Como Executar

### Pré-requisitos
- Flutter SDK 3.24.3+
- Dart SDK 3.5.3
- Android Studio / VS Code
- Dispositivo Android/iOS ou Emulador

### Passos
```bash
# Clone o repositório
git clone https://github.com/douglaskks/kode-start.git

# Entre na pasta
cd rick-and-morty-app

# Instale as dependências
flutter pub get

# Execute o app
flutter run
```


### Tipografia
- **Font Family:** Lato
- **Spacing:** Letter spacing para elegância
- **Hierarchy:** Bold para títulos, regular para textos

## 📊 Performance

### Otimizações Implementadas
- ✅ **Lazy loading** com paginação
- ✅ **Image caching** para reduzir requisições
- ✅ **Debounce na busca** para evitar spam de requests
- ✅ **Error boundaries** para estabilidade
- ✅ **Memory management** com dispose adequado

### Métricas
- **Time to First Paint:** ~800ms
- **API Response:** ~200ms
- **Image Loading:** Cache hit ~50ms

## 🧪 Testes

### Coverage
- **Unit Tests:** Controllers e Services
- **Widget Tests:** Components críticos
- **Integration Tests:** Fluxos principais

```bash
# Executar testes
flutter test

# Coverage report
flutter test --coverage
```

## 📱 Compatibilidade

- **Android:** 5.0+ (API 21+)
- **iOS:** 11.0+
- **Responsive:** Suporta diferentes tamanhos de tela

## 🤝 Desenvolvido Por

**Douglas Henrique Soares Salviano da Silva** - Desenvolvedor Flutter

- 🎓 **Graduando:** Ciência da Computação - UFAPE
- 💼 **Experiência:** 3 anos Flutter, 5 apps publicados
- 🏢 **Background:** Ex-Compass UOL (AWS DevSecOps)
- 📧 **Contato:** douglaszdw@gmail.com
- 💼 **LinkedIn:**[Clique aqui](https://www.linkedin.com/in/douglashenriquesoares/)
- 💻 **GitHub:** [Clique aqui](https://github.com/douglaskks)

---

<div align="center">

**🚀 Desenvolvido para o Kode Start 2025 - Workshop Flutter da Kobe**

*Demonstrando paixão por desenvolvimento mobile e atenção aos detalhes*

[![Kode Start](https://img.shields.io/badge/Kode%20Start-2025-orange?style=for-the-badge)](https://kobe.com.br)

</div>