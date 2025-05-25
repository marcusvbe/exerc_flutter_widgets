# Exercícios Flutter Widgets

Este projeto contém 5 exercícios implementados em Flutter, demonstrando o uso de diversos widgets e componentes da UI, desenvolvidos para a disciplina de Programação para Dispositivos Móveis II, ministrada pelo professor Carlos Feichas..

## Sobre o Projeto

O aplicativo implementa os seguintes exercícios:

1. **Lista de Compras** – Uso de TextField, ListView e Checkbox para gerenciar itens de uma lista.
2. **Formulário de Feedback** – Implementação de TextField e Radio buttons para coleta de feedback.
3. **Pesquisa de Cidades** – Uso de Autocomplete e TextField para pesquisar uma cidade.
4. **Agendamento de Eventos** – Uso de um widget de Calendar (table_calendar), TextField e ListView para gerenciar eventos.
5. **Catálogo de Produtos por Categoria** – Uso de TabBarView e ListView para exibir produtos por categoria.

## Tecnologias Utilizadas

- Flutter 3.6.2
- Dart
- Pacotes:
  - [intl](https://pub.dev/packages/intl) (^0.18.1)
  - [table_calendar](https://pub.dev/packages/table_calendar) (^3.0.9)

## Estrutura do Projeto

- **lib/**
  - `main.dart` – Ponto de entrada e menu principal.  - **screens/**
    - `shopping_list.dart` – Exercício Lista de Compras.
    - `feedback_form.dart` – Exercício Formulário de Feedback.
    - `city_search.dart` – Exercício Pesquisa de Cidades.
    - `event_scheduler.dart` – Exercício Agendamento de Eventos.
    - `product_catalog.dart` – Exercício Catálogo de Produtos por Categoria.
- Outros arquivos e pastas padrão do Flutter (android, ios, web, etc.)

## Como Executar

### Pré-requisitos

- Flutter SDK instalado e configurado (consulte [Instalar Flutter](https://flutter.dev/get-started/))


### Passos para Execução

1. **Clone o repositório**:
   ```sh
   git clone https://github.com/marcusvbe/exerc_flutter_widgets
   cd flutter-exercises-2024
   ```

2. **Obtenha as dependências**:
   ```sh
   flutter pub get
   ```

3. **Execute o aplicativo**:
   ```sh
   flutter run
   ```
   *Para executar no Windows especificamente, você pode usar:*
   ```sh
   flutter run -d windows
   ```