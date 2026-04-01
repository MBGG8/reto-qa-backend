@BuscarUserId
Feature: Buscar Usuario por ID

  Background:
    * url baseUrl

  @HappyPath @BuscarUserIdValid
  Scenario: Buscar Usuario por ID
    * def userId = '0uxuPY0cbmQhpEz1'
    Given path 'usuarios', userId
    When method get
    Then status 200
    And match response == read('classpath:schemas/getUserSchema.json')

  @UnHappyPath @BuscarUserIdInvalid
  Scenario: Buscar Usuario por ID Invalida
    * def userId = 'NO VALID'
    Given path 'usuarios', userId
    When method get
    Then status 400
    And match response == read('classpath:schemas/messageSchema.json')
