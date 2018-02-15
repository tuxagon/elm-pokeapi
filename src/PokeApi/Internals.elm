module PokeApi.Internals exposing (makeListUrl, v2)

{-| Internals for the PokeAPI wrapper
-}


{-| -}
v2 : String
v2 =
    "https://pokeapi.co/api/v2/"


{-| -}
makeListUrl : String -> ( Int, Int ) -> String
makeListUrl endpoint ( page, limit ) =
    let
        query =
            String.join "&"
                [ "limit="
                , toString limit
                , "offset="
                , (page - 1)
                    |> (*) limit
                    |> toString
                ]
    in
        String.concat
            [ v2
            , endpoint
            , "/?"
            , query
            ]
