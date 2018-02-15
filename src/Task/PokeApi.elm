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

@docs getAbilities, getBerries, getBerryFirmnesses, getBerryFlavors,
getCharacteristics, getContestEffects, getContestTypes, getEggGroups,
getEncounterConditions, getEncounterConditionValues, getEncounterMethods,
getEvolutionChains, getEvolutionTriggers, getGenders, getGenerations,
getGrowthRates, getItems, getItemAttributes, getItemCategories,
getItemFlingEffects, getItemPockets, getLanguages, getLocations,
getLocationAreas, getMachines, getMoves, getMoveAilments, getMoveBattleStyles,
getMoveCategories, getMoveDamageClasses, getMoveLearnMethods, getMoveTargets,
getNatures, getPalParkAreas, getPokeathlonStats, getPokedexes, getPokemon,
getPokemonColors, getPokemonForms, getPokemonHabitats, getPokemonShapes,
getPokemonSpecies, getRegions, getStats, getSuperContestEffects, getTypes,
getVersions, getVersionGroups


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
v2 : String
v2 =
    "https://pokeapi.co/api/v2/"


{-| -}
type ParameterType
    = Name String
    | Id Int
    | Url String


{-| -}
type alias PageSize =
    Int


{-| Specify what page and how big that page should be
-}
type Page
    = OnPage Int
    | OnPageOfSize Int PageSize


{-| -}
getAbilities : Page -> Task Http.Error NamedApiResourceList
getAbilities =
    get Ability_ decodeNamedApiResourceList


{-| -}
getBerries : Page -> Task Http.Error NamedApiResourceList
getBerries =
    get Berry_ decodeNamedApiResourceList


{-| -}
getBerryFirmnesses : Page -> Task Http.Error NamedApiResourceList
getBerryFirmnesses =
    get BerryFirmness_ decodeNamedApiResourceList


{-| -}
getBerryFlavors : Page -> Task Http.Error NamedApiResourceList
getBerryFlavors =
    get BerryFlavor_ decodeNamedApiResourceList


{-| -}
getCharacteristics : Page -> Task Http.Error ApiResourceList
getCharacteristics =
    get Characteristic_ decodeApiResourceList


{-| -}
getContestEffects : Page -> Task Http.Error ApiResourceList
getContestEffects =
    get ContestEffect_ decodeApiResourceList


{-| -}
getContestTypes : Page -> Task Http.Error NamedApiResourceList
getContestTypes =
    get ContestType_ decodeNamedApiResourceList


{-| -}
getEggGroups : Page -> Task Http.Error NamedApiResourceList
getEggGroups =
    get EggGroup_ decodeNamedApiResourceList


{-| -}
getEncounterConditions : Page -> Task Http.Error NamedApiResourceList
getEncounterConditions =
    get EncounterCondition_ decodeNamedApiResourceList


{-| -}
getEncounterConditionValues : Page -> Task Http.Error NamedApiResourceList
getEncounterConditionValues =
    get EncounterConditionValue_ decodeNamedApiResourceList


{-| -}
getEncounterMethods : Page -> Task Http.Error NamedApiResourceList
getEncounterMethods =
    get EncounterMethod_ decodeNamedApiResourceList


{-| -}
getEvolutionChains : Page -> Task Http.Error ApiResourceList
getEvolutionChains =
    get EvolutionChain_ decodeApiResourceList


{-| -}
getEvolutionTriggers : Page -> Task Http.Error NamedApiResourceList
getEvolutionTriggers =
    get EvolutionTrigger_ decodeNamedApiResourceList


{-| -}
getGenders : Page -> Task Http.Error NamedApiResourceList
getGenders =
    get Gender_ decodeNamedApiResourceList


{-| -}
getGenerations : Page -> Task Http.Error NamedApiResourceList
getGenerations =
    get Generation_ decodeNamedApiResourceList


{-| -}
getGrowthRates : Page -> Task Http.Error NamedApiResourceList
getGrowthRates =
    get GrowthRate_ decodeNamedApiResourceList


{-| -}
getItems : Page -> Task Http.Error NamedApiResourceList
getItems =
    get Item_ decodeNamedApiResourceList


{-| -}
getItemAttributes : Page -> Task Http.Error NamedApiResourceList
getItemAttributes =
    get ItemAttribute_ decodeNamedApiResourceList


{-| -}
getItemCategories : Page -> Task Http.Error NamedApiResourceList
getItemCategories =
    get ItemCategory_ decodeNamedApiResourceList


{-| -}
getItemFlingEffects : Page -> Task Http.Error NamedApiResourceList
getItemFlingEffects =
    get ItemFlingEffect_ decodeNamedApiResourceList


{-| -}
getItemPockets : Page -> Task Http.Error NamedApiResourceList
getItemPockets =
    get ItemPocket_ decodeNamedApiResourceList


{-| -}
getLanguages : Page -> Task Http.Error NamedApiResourceList
getLanguages =
    get Language_ decodeNamedApiResourceList


{-| -}
getLocations : Page -> Task Http.Error NamedApiResourceList
getLocations =
    get Location_ decodeNamedApiResourceList


{-| -}
getLocationAreas : Page -> Task Http.Error NamedApiResourceList
getLocationAreas =
    get LocationArea_ decodeNamedApiResourceList


{-| -}
getMachines : Page -> Task Http.Error ApiResourceList
getMachines =
    get Machine_ decodeApiResourceList


{-| -}
getMoves : Page -> Task Http.Error NamedApiResourceList
getMoves =
    get Move_ decodeNamedApiResourceList


{-| -}
getMoveAilments : Page -> Task Http.Error NamedApiResourceList
getMoveAilments =
    get MoveAilment_ decodeNamedApiResourceList


{-| -}
getMoveBattleStyles : Page -> Task Http.Error NamedApiResourceList
getMoveBattleStyles =
    get MoveBattleStyle_ decodeNamedApiResourceList


{-| -}
getMoveCategories : Page -> Task Http.Error NamedApiResourceList
getMoveCategories =
    get MoveCategory_ decodeNamedApiResourceList


{-| -}
getMoveDamageClasses : Page -> Task Http.Error NamedApiResourceList
getMoveDamageClasses =
    get MoveDamageClass_ decodeNamedApiResourceList


{-| -}
getMoveLearnMethods : Page -> Task Http.Error NamedApiResourceList
getMoveLearnMethods =
    get MoveLearnMethod_ decodeNamedApiResourceList


{-| -}
getMoveTargets : Page -> Task Http.Error NamedApiResourceList
getMoveTargets =
    get MoveTarget_ decodeNamedApiResourceList


{-| -}
getNatures : Page -> Task Http.Error NamedApiResourceList
getNatures =
    get Nature_ decodeNamedApiResourceList


{-| -}
getPalParkAreas : Page -> Task Http.Error NamedApiResourceList
getPalParkAreas =
    get PalParkArea_ decodeNamedApiResourceList


{-| -}
getPokeathlonStats : Page -> Task Http.Error NamedApiResourceList
getPokeathlonStats =
    get PokeathlonStat_ decodeNamedApiResourceList


{-| -}
getPokedexes : Page -> Task Http.Error NamedApiResourceList
getPokedexes =
    get Pokedex_ decodeNamedApiResourceList


{-| -}
getPokemon : Page -> Task Http.Error NamedApiResourceList
getPokemon =
    get Pokemon_ decodeNamedApiResourceList


{-| -}
getPokemonColors : Page -> Task Http.Error NamedApiResourceList
getPokemonColors =
    get PokemonColor_ decodeNamedApiResourceList


{-| -}
getPokemonForms : Page -> Task Http.Error NamedApiResourceList
getPokemonForms =
    get PokemonForm_ decodeNamedApiResourceList


{-| -}
getPokemonHabitats : Page -> Task Http.Error NamedApiResourceList
getPokemonHabitats =
    get PokemonHabitat_ decodeNamedApiResourceList


{-| -}
getPokemonShapes : Page -> Task Http.Error NamedApiResourceList
getPokemonShapes =
    get PokemonShape_ decodeNamedApiResourceList


{-| -}
getPokemonSpecies : Page -> Task Http.Error NamedApiResourceList
getPokemonSpecies =
    get PokemonSpecies_ decodeNamedApiResourceList


{-| -}
getRegions : Page -> Task Http.Error NamedApiResourceList
getRegions =
    get Region_ decodeNamedApiResourceList


{-| -}
getStats : Page -> Task Http.Error NamedApiResourceList
getStats =
    get Stat_ decodeNamedApiResourceList


{-| -}
getSuperContestEffects : Page -> Task Http.Error ApiResourceList
getSuperContestEffects =
    get SuperContestEffect_ decodeApiResourceList


{-| -}
getTypes : Page -> Task Http.Error NamedApiResourceList
getTypes =
    get Type_ decodeNamedApiResourceList


{-| -}
getVersions : Page -> Task Http.Error NamedApiResourceList
getVersions =
    get Version_ decodeNamedApiResourceList


{-| -}
getVersionGroups : Page -> Task Http.Error NamedApiResourceList
getVersionGroups =
    get VersionGroup_ decodeNamedApiResourceList


{-| Allows you to specify custom paging when retrieving a list of some resource

    get Pokemon_ (OnPage 1)

-}
get : Resource -> Decoder a -> Page -> Task Http.Error a
get res decoder page =
    let
        endpoint =
            resourceAsString res

        url =
            makeListUrl endpoint page
    in
        decoder
            |> Http.get url
            |> Http.toTask


{-| -}
makeListUrl : String -> Page -> String
makeListUrl endpoint page =
    let
        ( pageNum, limit ) =
            case page of
                OnPage num ->
                    ( num, 20 )

                OnPageOfSize num limit ->
                    ( num, limit )

        q =
            String.join "&"
                [ "limit="
                , toString limit
                , "offset="
                , (pageNum - 1)
                    |> (*) limit
                    |> toString
                ]
    in
        String.concat
            [ v2
            , endpoint
            , "/?"
            , q
            ]


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
