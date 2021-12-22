@Form
Feature: Fill Form

    As an user of CTAppium app
    John wants to register a data form
    So that he can see his data filled

    Background: Access form
        Given that John access the feature "Formulário"

    Scenario: Filling form
        When he fills the text field "Nome" with "John Joe Jones"
        And he selects on combo console the option "PS4"
        And he clicks on checkbox
        And he clicks on button "SALVAR"
        Then he sees the texts bellow
            | Nome: John Joe Jones  |
            | Console: ps4          |
            | Slider: 25            |
            | Switch: On            |
            | Checkbox: Marcado     |
            | Data: 01/01/2000      |
            | Hora: 06:00           |