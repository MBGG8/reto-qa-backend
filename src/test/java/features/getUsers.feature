@ListarUsers
Feature: Listar Usuarios

  Background:
    * url baseUrl

  @HappyPath
  Scenario: Listar todos los usuarios
    Given path 'usuarios'
    When method get
    Then status 200
    And match response == read('classpath:schemas/listarUsuariosSchema.json')

