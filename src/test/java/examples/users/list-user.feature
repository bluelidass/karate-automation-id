Feature: List Users

    Feature to get list users from reqres.in
    For help, see https://github.com/karatelabs/karate#index

    Background:
        * url "https://reqres.in"
        * path "/api/users"
        # 'path' adalah path dari request yang akan di-hit, ditambahkan ke 'url'
        # Berikut di bawah ini contoh penggunaan response body/schema, untuk keperluaan assert
        * def dataSchema =
            """
            {
                "id": "#number",
                "email": "#string",
                "first_name": "#string",
                "last_name": "#string",
                "avatar": "#string"
            }
            """
        # dataSchema berisikan array yang akan digunakan untuk data [] di responseSchema
        # Property dengan "#number" adalah menyatakan bahwa tipe value-nya adalah number
        # sedangkan dengan "#string" adalah menyatakan bahwa tipe value-nya adalah string
        * def responseSchema =
            """
            {
                "page": "#number",
                "per_page": "#number",
                "total": "#number",
                "total_pages": "#number",
                "data": "#[] dataSchema",
                "support": {
                    "url": "#string",
                    "text": "#string"
                }
            }
            """
        # Property data dengan value "#[] dataSchema" adalah [] dengan isi re-use dataSchema

    Scenario: Get list users
        Given param page = 2
        # 'param' digunakan untuk menambahkan query param ke request atau endpoint url
        When method get
        * print response
        Then status 200
        Then match response == responseSchema
        # line di atas untuk verify apakah response body sesuai dengan schema yang diharapkan
        Then response.page == 2
        Then assert response.per_page == (response.data).length