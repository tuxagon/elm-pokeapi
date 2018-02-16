module Example exposing (..)

import Dict exposing (Dict)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import PokeApi exposing (Resource(..))
import PokeApi.Internals as Internals
import Regex exposing (Regex, caseInsensitive, contains, regex)
import Test exposing (..)


suite : Test
suite =
    describe "The Internals module"
        [ describe "PokeApi.Internals.v2"
            [ test "has correct v2 url" <|
                \_ ->
                    Expect.equal v2 Internals.v2
            ]
        , describe "PokeApi.Internals.makeListUrl"
            [ test "has valid list url" <|
                \_ ->
                    let
                        validUrl =
                            Internals.makeListUrl Pokemon_ ( 1, 10 )
                                |> contains listRegex
                    in
                        Expect.true "Expected list url to be valid"
                            validUrl
            , fuzz int "calculates offset properly" <|
                \page ->
                    let
                        limit =
                            10

                        page_ =
                            if page == 0 then
                                1
                            else
                                abs page
                    in
                        Expect.equal
                            (String.concat
                                [ v2
                                , "pokemon/?limit=10&offset="
                                , toString <| limit * (page_ - 1)
                                ]
                            )
                            (Internals.makeListUrl Pokemon_ ( page_, limit ))
            , fuzz int "has limit in url" <|
                \limit ->
                    let
                        limit_ =
                            if limit == 0 then
                                10
                            else
                                abs limit
                    in
                        Expect.equal
                            (String.concat
                                [ v2
                                , "pokemon/?limit="
                                , toString limit_
                                , "&offset=0"
                                ]
                            )
                            (Internals.makeListUrl Pokemon_ ( 1, limit_ ))
            , fuzz int "replaces invalid (< 1) pages with 1" <|
                \page ->
                    let
                        limit =
                            10

                        page_ =
                            if page < 1 then
                                1
                            else
                                page
                    in
                        Expect.equal
                            (String.concat
                                [ v2
                                , "pokemon/?limit="
                                , toString limit
                                , "&offset="
                                , toString <| limit * (page_ - 1)
                                ]
                            )
                            (Internals.makeListUrl Pokemon_ ( page, limit ))
            ]
        , describe "PokeApi.Internals.makeResourceUrl"
            [ test "has valid url for id" <|
                \_ ->
                    let
                        validUrl =
                            ( Pokemon_, "5" )
                                |> Internals.makeResourceUrl
                                |> contains resourceRegex
                    in
                        Expect.true "Expected resource url to be valid for id"
                            validUrl
            , test "has valid url for name" <|
                \_ ->
                    let
                        validUrl =
                            ( Pokemon_, "charizard" )
                                |> Internals.makeResourceUrl
                                |> contains resourceRegex
                    in
                        Expect.true "Expected resource url to be valid for name"
                            validUrl
            , fuzz string "uses both endpoint and parameter fields in url" <|
                \parameter ->
                    Expect.equal
                        (String.concat [ v2, "pokemon/", parameter, "/" ])
                        (Internals.makeResourceUrl ( Pokemon_, parameter ))
            ]
        , describe "PokeApi.Internals.resourceAsString"
            [ concat
                (List.map
                    (\resource ->
                        test ("has correct string for " ++ (toString resource)) <|
                            \_ ->
                                resource
                                    |> Internals.resourceAsString
                                    |> getResource
                                    |> Expect.equal (Just resource)
                    )
                    (Dict.values resources)
                )
            ]
        ]


v2 : String
v2 =
    "https://pokeapi.co/api/v2/"


listRegex : Regex
listRegex =
    (caseInsensitive << regex)
        "^https:\\/\\/pokeapi\\.co\\/api\\/v2\\/[a-z-]+\\/\\?[a-z0-9-]+=[0-9]*(&[a-z0-9-]+=[0-9]*)*$"


resourceRegex : Regex
resourceRegex =
    (caseInsensitive << regex)
        "^https:\\/\\/pokeapi\\.co\\/api\\/v2\\/[a-z-]+\\/([a-z0-9-]+|[0-9]+)\\/$"


getResource : String -> Maybe Resource
getResource key =
    Dict.get key resources


resources : Dict String Resource
resources =
    Dict.fromList
        [ ( "ability", Ability_ )
        , ( "berry", Berry_ )
        , ( "berry-firmness", BerryFirmness_ )
        , ( "berry-flavor", BerryFlavor_ )
        , ( "characteristic", Characteristic_ )
        , ( "contest-effect", ContestEffect_ )
        , ( "contest-type", ContestType_ )
        , ( "egg-group", EggGroup_ )
        , ( "encounter-condition", EncounterCondition_ )
        , ( "encounter-condition-value", EncounterConditionValue_ )
        , ( "encounter-method", EncounterMethod_ )
        , ( "evolution-chain", EvolutionChain_ )
        , ( "evolution-trigger", EvolutionTrigger_ )
        , ( "gender", Gender_ )
        , ( "generation", Generation_ )
        , ( "growth-rate", GrowthRate_ )
        , ( "item", Item_ )
        , ( "item-attribute", ItemAttribute_ )
        , ( "item-category", ItemCategory_ )
        , ( "item-fling-effect", ItemFlingEffect_ )
        , ( "item-pocket", ItemPocket_ )
        , ( "language", Language_ )
        , ( "location", Location_ )
        , ( "location-area", LocationArea_ )
        , ( "machine", Machine_ )
        , ( "move", Move_ )
        , ( "move-ailment", MoveAilment_ )
        , ( "move-battle-style", MoveBattleStyle_ )
        , ( "move-category", MoveCategory_ )
        , ( "move-damage-class", MoveDamageClass_ )
        , ( "move-learn-method", MoveLearnMethod_ )
        , ( "move-target", MoveTarget_ )
        , ( "nature", Nature_ )
        , ( "pal-park-area", PalParkArea_ )
        , ( "pokeathlon-stat", PokeathlonStat_ )
        , ( "pokedex", Pokedex_ )
        , ( "pokemon", Pokemon_ )
        , ( "pokemon-color", PokemonColor_ )
        , ( "pokemon-form", PokemonForm_ )
        , ( "pokemon-habitat", PokemonHabitat_ )
        , ( "pokemon-shape", PokemonShape_ )
        , ( "pokemon-species", PokemonSpecies_ )
        , ( "region", Region_ )
        , ( "stat", Stat_ )
        , ( "super-contest-effect", SuperContestEffect_ )
        , ( "type", Type_ )
        , ( "version", Version_ )
        , ( "version-group", VersionGroup_ )
        ]
