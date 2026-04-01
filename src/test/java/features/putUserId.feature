@EditUser
Feature: Editar Usuario

  Background:
    * url baseUrl
    * def createUser = call read('classpath:helpers/dataFactory.js')
    * def userUpdate = call read('classpath:helpers/dataFactory.js') 'edit'

  @HappyPath
  Scenario: Modificacion de Datos de Usuario
    Given path 'usuarios'
    And request createUser
    When method post
    Then status 201
    * def userId = response._id

    * print userId
    Given path 'usuarios', userId
    And request userUpdate
    When method put
    Then status 200
    And match response == read('classpath:schemas/messageSchema.json')

    Given path 'usuarios', userId
    When method get
    Then status 200
    And match response == read('classpath:schemas/getUserSchema.json')
    And match response.nome == userUpdate.nome
    And match response.email == userUpdate.email

