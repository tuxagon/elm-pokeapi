module PokeApi.Internals exposing (makeListUrl, makeResourceUrl, resourceAsString, v2)

{-| Internals for the PokeAPI wrapper

@docs makeListUrl, makeResourceUrl, resourceAsString, v2

-}

import PokeApi exposing (Resource(..))


{-| -}
v2 : String
v2 =
    "https://pokeapi.co/api/v2/"


{-| -}
makeListUrl : Resource -> ( Int, Int ) -> String
makeListUrl res ( page, limit ) =
    let
        endpoint =
            resourceAsString res

        query =
            String.join "&"
                [ "limit=" ++ toString limit
                , "offset=" ++ toString offset
                ]

        offset =
            if page > 0 then
                (page - 1) * limit
            else
                0
    in
        String.concat
            [ v2
            , endpoint
            , "/?"
            , query
            ]


{-| -}
makeResourceUrl : ( Resource, String ) -> String
makeResourceUrl ( res, param ) =
    let
        endpoint =
            resourceAsString res
    in
        String.concat
            [ v2
            , endpoint
            , "/"
            , param
            , "/"
            ]


{-| -}
resourceAsString : Resource -> String
resourceAsString res =
    case res of
        Ability_ ->
            "ability"

        Berry_ ->
            "berry"

        BerryFirmness_ ->
            "berry-firmness"

        BerryFlavor_ ->
            "berry-flavor"

        Characteristic_ ->
            "characteristic"

        ContestEffect_ ->
            "contest-effect"

        ContestType_ ->
            "contest-type"

        EggGroup_ ->
            "egg-group"

        EncounterCondition_ ->
            "encounter-condition"

        EncounterConditionValue_ ->
            "encounter-condition-value"

        EncounterMethod_ ->
            "encounter-method"

        EvolutionChain_ ->
            "evolution-chain"

        EvolutionTrigger_ ->
            "evolution-trigger"

        Gender_ ->
            "gender"

        Generation_ ->
            "generation"

        GrowthRate_ ->
            "growth-rate"

        Item_ ->
            "item"

        ItemAttribute_ ->
            "item-attribute"

        ItemCategory_ ->
            "item-category"

        ItemFlingEffect_ ->
            "item-fling-effect"

        ItemPocket_ ->
            "item-pocket"

        Language_ ->
            "language"

        Location_ ->
            "location"

        LocationArea_ ->
            "location-area"

        Machine_ ->
            "machine"

        Move_ ->
            "move"

        MoveAilment_ ->
            "move-ailment"

        MoveBattleStyle_ ->
            "move-battle-style"

        MoveCategory_ ->
            "move-category"

        MoveDamageClass_ ->
            "move-damage-class"

        MoveLearnMethod_ ->
            "move-learn-method"

        MoveTarget_ ->
            "move-target"

        Nature_ ->
            "nature"

        PalParkArea_ ->
            "pal-park-area"

        PokeathlonStat_ ->
            "pokeathlon-stat"

        Pokedex_ ->
            "pokedex"

        Pokemon_ ->
            "pokemon"

        PokemonColor_ ->
            "pokemon-color"

        PokemonForm_ ->
            "pokemon-form"

        PokemonHabitat_ ->
            "pokemon-habitat"

        PokemonShape_ ->
            "pokemon-shape"

        PokemonSpecies_ ->
            "pokemon-species"

        Region_ ->
            "region"

        Stat_ ->
            "stat"

        SuperContestEffect_ ->
            "super-contest-effect"

        Type_ ->
            "type"

        Version_ ->
            "version"

        VersionGroup_ ->
            "version-group"
