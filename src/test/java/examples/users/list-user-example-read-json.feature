Feature: List Users

    Feature to get list users from reqres.in
    For help, see https://github.com/karatelabs/karate#index

    Background:
        # Background adalah optional dan akan re-set untuk setiap scenario
        # For help, baca di https://github.com/karatelabs/karate#script-structure
        * url "https://reqres.in"
        * path "/api/users"
        # Berikut adalah cara reading file berupa json 
        # Lebih lengkap dapat dibaca di https://github.com/karatelabs/karate#reading-files
        * def dataSchema = read("classpath:examples/users/data/data-schema.json")
        * def responseSchema = read('classpath:examples/users/data/response-schema.json')

    Scenario: Get list users
        Given param page = 3
        When method get
        Then match response == responseSchema