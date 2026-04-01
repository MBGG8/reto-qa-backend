@EliminarUsuario
Feature: Eliminar Usuario

  Background:
    * url baseUrl
    * def user = call read('classpath:helpers/dataFactory.js')

  @HappyPath @EliminarUserID
  Scenario: Eliminar Usuario por ID
    Given path 'usuarios'
    And request user
    When method post
    Then status 201
    * def userId = response._id
    * print userId

    Given path 'usuarios', userId
    When method delete
    Then status 200
    And match response == read('classpath:schemas/messageSchema.json')

  @UnhappyPath @EliminarUserInexistente
  Scenario: Eliminar por ID de Usuario YA ELIMINADO/NO EXISTE
    Given path 'usuarios'
    And request user
    When method post
    Then status 201
    * def userId = response._id
    * print userId

    Given path 'usuarios', userId
    When method delete
    Then status 200
    And match response == read('classpath:schemas/messageSchema.json')

    #ELIMINACION DE CON ID DE USUARIO YA ELIMINADO/NO EXISTE
    Given path 'usuarios', userId
    When method get
    Then status 400
    And match response == read('classpath:schemas/messageSchema.json')
