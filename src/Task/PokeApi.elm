module PokeApi exposing (..)

{-| This library is a wrapper for PokeApi (<https://pokeapi.co/>) that provides
you with concrete types to all the applicable models


# List-based HTTP tasks

Retrieves a list of the specific resource for that function

Example

    -- gets a list of pokemon
    getPokemon (OnPage 1)

    -- gets a list of berries
    getBerries (OnPage 1)

@docs getResourceList


# Single resource-based HTTP tasks

Retrieves a single resource of the specific resource for that function

    -- gets the pokemon with name "pikachu"
    getPokemonBy "pikachu"

    -- gets the berry with id 5
    getBerryBy "5"

@docs getAbilityBy, getBerryBy, getBerryFirmnessBy,
getBerryFlavorBy, getCharacteristicBy, getContestEffectBy, getContestTypeBy,
getEggGroupBy, getEncounterConditionBy, getEncounterConditionValueBy,
getEncounterMethodBy, getEvolutionChainBy, getEvolutionTriggerBy, getGenderBy,
getGenerationBy, getGrowthRateBy, getItemBy, getItemAttributeBy,
getItemCategoryBy, getItemFlingEffectBy, getItemPocketBy, getLanguageBy,
getLocationBy, getLocationAreaBy, getMachineBy, getMoveBy, getMoveAilmentBy,
getMoveBattleStyleBy, getMoveCategoryBy, getMoveDamageClassBy,
getMoveLearnMethodBy, getMoveTargetBy, getNatureBy, getPalParkAreaBy,
getPokeathlonStatBy, getPokedexBy, getPokemonBy, getPokemonColorBy,
getPokemonFormBy, getPokemonHabitatBy, getPokemonShapeBy, getPokemonSpeciesBy,
getRegionBy, getStatBy, getSuperContestEffectBy, getTypeBy, getVersionBy,
getVersionGroupBy

-}

import Json.Decode.PokeApi exposing (..)
import PokeApi exposing (..)


{-| -}
type ApiUrl
    = ApiUrl String


{-| Represents the type of parameter used to search with
-}
type ParameterType
    = Name String
    | Id Int
    | Url ApiUrl


{-| -}
type alias PageSize =
    Int


{-| Specify what page and how big that page should be
-}
type Page
    = OnPage Int
    | OnPageOfSize Int PageSize


{-| Gets a list of the specified resource

Example

    -- get a list of pokemon
    getResourceList Pokemon_ (OnPage 1)

-}
getResourceList :
    Resource
    -> Page
    -> Task Http.Error ApiResourceList
getResourceList res page =
    let
        endpoint =
            resourceAsString res

        url =
            makeListUrl endpoint pageLimit

        pageLimit =
            case page of
                OnPage num ->
                    ( num, 20 )

                OnPageOfSize num limit ->
                    ( num, limit )
    in
        decodeApiResourceList
            |> Http.get url
            |> Http.toTask


{-| -}
getAbilityBy : ParameterType -> Task Http.Error Ability
getAbilityBy =
    getBy Ability_ decodeAbility


{-| -}
getBerryBy : ParameterType -> Task Http.Error Berry
getBerryBy =
    getBy Berry_ decodeBerry


{-| -}
getBerryFirmnessBy : ParameterType -> Task Http.Error BerryFirmness
getBerryFirmnessBy =
    getBy BerryFirmness_ decodeBerryFirmness


{-| -}
getBerryFlavorBy : ParameterType -> Task Http.Error BerryFlavor
getBerryFlavorBy =
    getBy BerryFlavor_ decodeBerryFlavor


{-| -}
getCharacteristicBy : ParameterType -> Task Http.Error Characteristic
getCharacteristicBy =
    getBy Characteristic_ decodeCharacteristic


{-| -}
getContestEffectBy : ParameterType -> Task Http.Error ContestEffect
getContestEffectBy =
    getBy ContestEffect_ decodeContestEffect


{-| -}
getContestTypeBy : ParameterType -> Task Http.Error ContestType
getContestTypeBy =
    getBy ContestType_ decodeContestType


{-| -}
getEggGroupBy : ParameterType -> Task Http.Error EggGroup
getEggGroupBy =
    getBy EggGroup_ decodeEggGroup


{-| -}
getEncounterConditionBy : ParameterType -> Task Http.Error EncounterCondition
getEncounterConditionBy =
    getBy EncounterCondition_ decodeEncounterCondition


{-| -}
getEncounterConditionValueBy : ParameterType -> Task Http.Error EncounterConditionValue
getEncounterConditionValueBy =
    getBy EncounterConditionValue_ decodeEncounterConditionValue


{-| -}
getEncounterMethodBy : ParameterType -> Task Http.Error EncounterMethod
getEncounterMethodBy =
    getBy EncounterMethod_ decodeEncounterMethod


{-| -}
getEvolutionChainBy : ParameterType -> Task Http.Error EvolutionChain
getEvolutionChainBy =
    getBy EvolutionChain_ decodeEvolutionChain


{-| -}
getEvolutionTriggerBy : ParameterType -> Task Http.Error EvolutionTrigger
getEvolutionTriggerBy =
    getBy EvolutionTrigger_ decodeEvolutionTrigger


{-| -}
getGenderBy : ParameterType -> Task Http.Error Gender
getGenderBy =
    getBy Gender_ decodeGender


{-| -}
getGenerationBy : ParameterType -> Task Http.Error Generation
getGenerationBy =
    getBy Generation_ decodeGeneration


{-| -}
getGrowthRateBy : ParameterType -> Task Http.Error GrowthRate
getGrowthRateBy =
    getBy GrowthRate_ decodeGrowthRate


{-| -}
getItemBy : ParameterType -> Task Http.Error Item
getItemBy =
    getBy Item_ decodeItem


{-| -}
getItemAttributeBy : ParameterType -> Task Http.Error ItemAttribute
getItemAttributeBy =
    getBy ItemAttribute_ decodeItemAttribute


{-| -}
getItemCategoryBy : ParameterType -> Task Http.Error ItemCategory
getItemCategoryBy =
    getBy ItemCategory_ decodeItemCategory


{-| -}
getItemFlingEffectBy : ParameterType -> Task Http.Error ItemFlingEffect
getItemFlingEffectBy =
    getBy ItemFlingEffect_ decodeItemFlingEffect


{-| -}
getItemPocketBy : ParameterType -> Task Http.Error ItemPocket
getItemPocketBy =
    getBy ItemPocket_ decodeItemPocket


{-| -}
getLanguageBy : ParameterType -> Task Http.Error Language
getLanguageBy =
    getBy Language_ decodeLanguage


{-| -}
getLocationBy : ParameterType -> Task Http.Error Location
getLocationBy =
    getBy Location_ decodeLocation


{-| -}
getLocationAreaBy : ParameterType -> Task Http.Error LocationArea
getLocationAreaBy =
    getBy LocationArea_ decodeLocationArea


{-| -}
getMachineBy : ParameterType -> Task Http.Error Machine
getMachineBy =
    getBy Machine_ decodeMachine


{-| -}
getMoveBy : ParameterType -> Task Http.Error Move
getMoveBy =
    getBy Move_ decodeMove


{-| -}
getMoveAilmentBy : ParameterType -> Task Http.Error MoveAilment
getMoveAilmentBy =
    getBy MoveAilment_ decodeMoveAilment


{-| -}
getMoveBattleStyleBy : ParameterType -> Task Http.Error MoveBattleStyle
getMoveBattleStyleBy =
    getBy MoveBattleStyle_ decodeMoveBattleStyle


{-| -}
getMoveCategoryBy : ParameterType -> Task Http.Error MoveCategory
getMoveCategoryBy =
    getBy MoveCategory_ decodeMoveCategory


{-| -}
getMoveDamageClassBy : ParameterType -> Task Http.Error MoveDamageClass
getMoveDamageClassBy =
    getBy MoveDamageClass_ decodeMoveDamageClass


{-| -}
getMoveLearnMethodBy : ParameterType -> Task Http.Error MoveLearnMethod
getMoveLearnMethodBy =
    getBy MoveLearnMethod_ decodeMoveLearnMethod


{-| -}
getMoveTargetBy : ParameterType -> Task Http.Error MoveTarget
getMoveTargetBy =
    getBy MoveTarget_ decodeMoveTarget


{-| -}
getNatureBy : ParameterType -> Task Http.Error Nature
getNatureBy =
    getBy Nature_ decodeNature


{-| -}
getPalParkAreaBy : ParameterType -> Task Http.Error PalParkArea
getPalParkAreaBy =
    getBy PalParkArea_ decodePalParkArea


{-| -}
getPokeathlonStatBy : ParameterType -> Task Http.Error PokeathlonStat
getPokeathlonStatBy =
    getBy PokeathlonStat_ decodePokeathlonStat


{-| -}
getPokedexBy : ParameterType -> Task Http.Error Pokedex
getPokedexBy =
    getBy Pokedex_ decodePokedex


{-| -}
getPokemonBy : ParameterType -> Task Http.Error Pokemon
getPokemonBy =
    getBy Pokemon_ decodePokemon


{-| -}
getPokemonColorBy : ParameterType -> Task Http.Error PokemonColor
getPokemonColorBy =
    getBy PokemonColor_ decodePokemonColor


{-| -}
getPokemonFormBy : ParameterType -> Task Http.Error PokemonForm
getPokemonFormBy =
    getBy PokemonForm_ decodePokemonForm


{-| -}
getPokemonHabitatBy : ParameterType -> Task Http.Error PokemonHabitat
getPokemonHabitatBy =
    getBy PokemonHabitat_ decodePokemonHabitat


{-| -}
getPokemonShapeBy : ParameterType -> Task Http.Error PokemonShape
getPokemonShapeBy =
    getBy PokemonShape_ decodePokemonShape


{-| -}
getPokemonSpeciesBy : ParameterType -> Task Http.Error PokemonSpecies
getPokemonSpeciesBy =
    getBy PokemonSpecies_ decodePokemonSpecies


{-| -}
getRegionBy : ParameterType -> Task Http.Error Region
getRegionBy =
    getBy Region_ decodeRegion


{-| -}
getStatBy : ParameterType -> Task Http.Error Stat
getStatBy =
    getBy Stat_ decodeStat


{-| -}
getSuperContestEffectBy : ParameterType -> Task Http.Error SuperContestEffect
getSuperContestEffectBy =
    getBy SuperContestEffect_ decodeSuperContestEffect


{-| -}
getTypeBy : ParameterType -> Task Http.Error Type
getTypeBy =
    getBy Type_ decodeType


{-| -}
getVersionBy : ParameterType -> Task Http.Error Version
getVersionBy =
    getBy Version_ decodeVersion


{-| -}
getVersionGroupBy : ParameterType -> Task Http.Error VersionGroup
getVersionGroupBy =
    getBy VersionGroup_ decodeVersionGroup


{-| -}
getBy : Resource -> Decoder a -> ParameterType -> Task Http.Error a
getBy res decoder param =
    let
        endpoint =
            resourceAsString res

        url =
            makeResourceUrl ( endpoint, param )
    in
        decoder
            |> Http.get url
            |> Http.toTask


{-| -}
makeResourceUrl : ( String, ParameterType ) -> String
makeResourceUrl ( endpoint, paramType ) =
    let
        url param =
            String.concat
                [ v2
                , endpoint
                , "/"
                , param
                , "/"
                ]
    in
        case paramType of
            Name name ->
                url name

            Id id ->
                url (toString id)

            Url url_ ->
                url_


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
