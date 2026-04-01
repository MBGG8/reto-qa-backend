@RegisterUser
Feature: Registrar Usuario

  Background:
    * url baseUrl
    * def user = call read('classpath:helpers/datafactory.js')

  @HappyPath
  Scenario: Registrar Usuario Válidos
    Given path 'usuarios'
    And request user
    When method post
    Then status 201
    And match response == read('classpath:schemas/createUserResponseSchema.json')

