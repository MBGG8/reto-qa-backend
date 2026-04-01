@RegisterUser
Feature: Registrar Usuario

  Background:
    * url baseUrl
    * def createUser = call read('classpath:helpers/datafactory.js')

  @HappyPath @RegistrarUserValid
  Scenario: Registrar Usuario Válidos
    Given path 'usuarios'
    And request createUser
    When method post
    Then status 201
    And match response == read('classpath:schemas/createUserResponseSchema.json')

  @UnhappyPath @RegistrarUserEmailInvalido
  Scenario: Registo con Correo ya Registrado
    Given path 'usuarios'
    And request createUser
    When method post
    Then status 201
    * def userEmail = createUser.email
    * print userEmail
    And match response == read('classpath:schemas/createUserResponseSchema.json')

    #CORREO YA REGISTADO
    Given path 'usuarios'
    And request createUser
    When method post
    Then status 400
    * def userEmail = createUser.email
    * print userEmail
    And match response == read('classpath:schemas/messageSchema.json')

  @UnhappyPath @RegistroUserDatosInvalidos
  Scenario Outline: Validar Registo con datos Invalidos
    * def user =
      """
    {
      "nome": "<nome>",
      "email": "<email>",
      "password": "<password>",
      "administrador": "<administrador>"
    }
    """

    Given path 'usuarios'
    And request user
    When method post
    Then status 400
    And match response == read('classpath:schemas/messageSchema.json')

    Examples:
      | caso                | nome       | email             | password | administrador |
      | email invalido      | Miguel QA  | correo-mal        | 123456   | true          |
      | email vacio         | Miguel QA  |                   | 123456   | true          |
      | password vacio      | Miguel QA  | qa@mail.com       |          | true          |
      | nombre vacio        |            | qa@mail.com       | 123456   | true          |