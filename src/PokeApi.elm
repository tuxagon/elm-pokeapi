module PokeApi
    exposing
        ( Resource(..)
        , Page(..)
        , PageSize
        , ListMsg(..)
        , ResourceMsg(..)
        , Ability
        , AbilityEffectChange
        , AbilityFlavorText
        , AbilityPokemon
        , ApiResource
        , ApiResourceList
        , AwesomeName
        , Berry
        , BerryFirmness
        , BerryFlavor
        , BerryFlavorMap
        , ChainLink
        , Evolutions
        , Characteristic
        , ContestComboSets
        , ContestComboDetail
        , ContestEffect
        , ContestName
        , ContestType
        , Description
        , Effect
        , EggGroup
        , Encounter
        , EncounterCondition
        , EncounterConditionValue
        , EncounterMethod
        , EncounterMethodRate
        , EncounterVersionDetails
        , EvolutionChain
        , EvolutionDetail
        , EvolutionTrigger
        , FlavorBerryMap
        , FlavorText
        , Generation
        , Gender
        , GenerationGameIndex
        , Genus
        , GrowthRate
        , GrowthRateExperienceLevel
        , Item
        , ItemAttribute
        , ItemCategory
        , ItemFlingEffect
        , ItemHolderPokemon
        , ItemHolderPokemonVersionDetail
        , ItemPocket
        , ItemSprites
        , Language
        , Location
        , LocationArea
        , LocationAreaEncounter
        , Machine
        , MachineVersionDetail
        , Move
        , MoveAilment
        , MoveBattleStyle
        , MoveBattleStylePreference
        , MoveCategory
        , MoveDamageClass
        , MoveFlavorText
        , MoveLearnMethod
        , MoveMetaData
        , MoveStatAffect
        , MoveStatAffectSets
        , MoveStatChange
        , MoveTarget
        , Name
        , NamedApiResource
        , NamedApiResourceList
        , Nature
        , NaturePokeathlonStatAffect
        , NaturePokeathlonStatAffectSets
        , NatureStatAffectSets
        , NatureStatChange
        , PalParkArea
        , PalParkEncounterArea
        , PalParkEncounterSpecies
        , PastMoveStatValues
        , PokeathlonStat
        , Pokedex
        , Pokemon
        , PokemonAbility
        , PokemonColor
        , PokemonEncounter
        , PokemonEntry
        , PokemonForm
        , PokemonFormSprites
        , PokemonHabitat
        , PokemonHeldItem
        , PokemonHeldItemVersion
        , PokemonMove
        , PokemonMoveVersion
        , PokemonShape
        , PokemonSpecies
        , PokemonSpeciesDexEntry
        , PokemonSpeciesGender
        , PokemonSpeciesVariety
        , PokemonSprites
        , PokemonStat
        , PokemonType
        , Region
        , Stat
        , SuperContestEffect
        , Type
        , TypePokemon
        , TypeRelations
        , VerboseEffect
        , Version
        , VersionEncounterDetail
        , VersionGameIndex
        , VersionGroup
        , VersionGroupFlavorText
        , getAbilities
        , getBerries
        , getBerryFirmnesses
        , getBerryFlavors
        , getCharacteristics
        , getContestEffects
        , getContestTypes
        , getEggGroups
        , getEncounterConditions
        , getEncounterConditionValues
        , getEncounterMethods
        , getEvolutionChains
        , getEvolutionTriggers
        , getGenders
        , getGenerations
        , getGrowthRates
        , getItems
        , getItemAttributes
        , getItemCategories
        , getItemFlingEffects
        , getItemPockets
        , getLanguages
        , getLocations
        , getLocationAreas
        , getMachines
        , getMoves
        , getMoveAilments
        , getMoveBattleStyles
        , getMoveCategories
        , getMoveDamageClasses
        , getMoveLearnMethods
        , getMoveTargets
        , getNatures
        , getPalParkAreas
        , getPokeathlonStats
        , getPokedexes
        , getPokemon
        , getPokemonColors
        , getPokemonForms
        , getPokemonHabitats
        , getPokemonShapes
        , getPokemonSpecies
        , getRegions
        , getStats
        , getSuperContestEffects
        , getTypes
        , getVersions
        , getVersionGroups
        , getAbilityBy
        , getBerryBy
        , getBerryFirmnessBy
        , getBerryFlavorBy
        , getCharacteristicBy
        , getContestEffectBy
        , getContestTypeBy
        , getEggGroupBy
        , getEncounterConditionBy
        , getEncounterConditionValueBy
        , getEncounterMethodBy
        , getEvolutionChainBy
        , getEvolutionTriggerBy
        , getGenderBy
        , getGenerationBy
        , getGrowthRateBy
        , getItemBy
        , getItemAttributeBy
        , getItemCategoryBy
        , getItemFlingEffectBy
        , getItemPocketBy
        , getLanguageBy
        , getLocationBy
        , getLocationAreaBy
        , getMachineBy
        , getMoveBy
        , getMoveAilmentBy
        , getMoveBattleStyleBy
        , getMoveCategoryBy
        , getMoveDamageClassBy
        , getMoveLearnMethodBy
        , getMoveTargetBy
        , getNatureBy
        , getPalParkAreaBy
        , getPokeathlonStatBy
        , getPokedexBy
        , getPokemonBy
        , getPokemonColorBy
        , getPokemonFormBy
        , getPokemonHabitatBy
        , getPokemonShapeBy
        , getPokemonSpeciesBy
        , getRegionBy
        , getStatBy
        , getSuperContestEffectBy
        , getTypeBy
        , getVersionBy
        , getVersionGroupBy
        )

{-| This library is a wrapper for PokeApi (<https://pokeapi.co/>) that provides
you with concrete types to all the applicable models


# General

@docs Resource


# Lists

Retrieves a list of the specific resource for that function

Example

    -- gets a list of pokemon
    getPokemon (OnPage 1)

    -- gets a list of berries
    getBerries (OnPage 1)

@docs ListMsg, getAbilities, getBerries, getBerryFirmnesses, getBerryFlavors,
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


# Single Items

Retrieves a single resource of the specific resource for that function

    -- gets the pokemon with name "pikachu"
    getPokemonBy "pikachu"

    -- gets the berry with id 5
    getBerryBy "5"

@docs ResourceMsg, getAbilityBy, getBerryBy, getBerryFirmnessBy,
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


# Models

@docs Ability, AbilityEffectChange, AbilityFlavorText, AbilityPokemon, ApiResource,
ApiResourceList, AwesomeName, Berry, BerryFirmness, BerryFlavor, BerryFlavorMap,
ChainLink, Evolutions, Characteristic, ContestComboSets, ContestComboDetail,
ContestEffect, ContestName, ContestType, Description, Effect, EggGroup,
Encounter, EncounterCondition, EncounterConditionValue, EncounterMethod,
EncounterMethodRate, EncounterVersionDetails, EvolutionChain, EvolutionDetail,
EvolutionTrigger, FlavorBerryMap, FlavorText, Generation, Gender,
GenerationGameIndex, Genus, GrowthRate, GrowthRateExperienceLevel, Item,
ItemAttribute, ItemCategory, ItemFlingEffect, ItemHolderPokemon,
ItemHolderPokemonVersionDetail, ItemPocket, ItemSprites, Language, Location,
LocationArea, LocationAreaEncounter, Machine, MachineVersionDetail, Move,
MoveAilment, MoveBattleStyle, MoveBattleStylePreference, MoveCategory,
MoveDamageClass, MoveFlavorText, MoveLearnMethod, MoveMetaData, MoveStatAffect,
MoveStatAffectSets, MoveStatChange, MoveTarget, Name, NamedApiResource,
NamedApiResourceList, Nature, NaturePokeathlonStatAffect,
NaturePokeathlonStatAffectSets, NatureStatAffectSets, NatureStatChange,
PalParkArea, PalParkEncounterArea, PalParkEncounterSpecies, PastMoveStatValues,
PokeathlonStat, Pokedex, Pokemon, PokemonAbility, PokemonColor,
PokemonEncounter, PokemonEntry, PokemonForm, PokemonFormSprites, PokemonHabitat,
PokemonHeldItem, PokemonHeldItemVersion, PokemonMove, PokemonMoveVersion,
PokemonShape, PokemonSpecies, PokemonSpeciesDexEntry, PokemonSpeciesGender,
PokemonSpeciesVariety, PokemonSprites, PokemonStat, PokemonType, Region, Stat,
SuperContestEffect, Type, TypePokemon, TypeRelations, VerboseEffect, Version,
VersionEncounterDetail, VersionGameIndex, VersionGroup,
VersionGroupFlavorText

-}

import Http
import Json.Decode as Decode
    exposing
        ( Decoder
        , int
        , string
        , bool
        , maybe
        , list
        , lazy
        , map
        )
import Json.Decode.Pipeline exposing (decode, required)
import Task exposing (Task)


v2 : String
v2 =
    "https://pokeapi.co/api/v2/"


{-| Resource represents each endpoint available to you on the API

Note that each resource ends with an underscore because the design choice
was to keep the name of each related model free of the underscore

-}
type Resource
    = Ability_
    | Berry_
    | BerryFirmness_
    | BerryFlavor_
    | Characteristic_
    | ContestEffect_
    | ContestType_
    | EggGroup_
    | EncounterCondition_
    | EncounterConditionValue_
    | EncounterMethod_
    | EvolutionChain_
    | EvolutionTrigger_
    | Gender_
    | Generation_
    | GrowthRate_
    | Item_
    | ItemAttribute_
    | ItemCategory_
    | ItemFlingEffect_
    | ItemPocket_
    | Language_
    | Location_
    | LocationArea_
    | Machine_
    | Move_
    | MoveAilment_
    | MoveBattleStyle_
    | MoveCategory_
    | MoveDamageClass_
    | MoveLearnMethod_
    | MoveTarget_
    | Nature_
    | PalParkArea_
    | PokeathlonStat_
    | Pokedex_
    | Pokemon_
    | PokemonColor_
    | PokemonForm_
    | PokemonHabitat_
    | PokemonShape_
    | PokemonSpecies_
    | Region_
    | Stat_
    | SuperContestEffect_
    | Type_
    | Version_
    | VersionGroup_


{-| Message type that can be used to handle a result from the API when
requesting a list of resources

    type alias Model =
        { pokemon : Maybe NamedApiResourceList
        }

    update msg model =
        case msg of
            LoadedList Pokemon_ (Ok pokemon) ->
                ( { model | pokemon = Just pokemon }, Cmd.none )

            LoadedList Pokemon_ (Err reason) ->
                ( { model | pokemon = Nothing }, Cmd.none )

-}
type ListMsg
    = LoadedList Resource (Result Http.Error NamedApiResourceList)


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


{-| Message type that can be used to handle a result from the API when
requesting an individual resource

    type alias Model =
        { pokemon : Maybe Pokemon
        }

    update msg model =
        case msg of
            LoadedResource Pokemon_ (Ok pokemon) ->
                ( { model | pokemon = Just pokemon }, Cmd.none )

            LoadedResource Pokemon_ (Err reason) ->
                ( { model | pokemon = Nothing }, Cmd.none )

-}
type ResourceMsg resource
    = LoadedResource Resource (Result Http.Error resource)


{-| -}
getAbilityBy : String -> Task Http.Error Ability
getAbilityBy =
    getBy Ability_ decodeAbility


{-| -}
getBerryBy : String -> Task Http.Error Berry
getBerryBy =
    getBy Berry_ decodeBerry


{-| -}
getBerryFirmnessBy : String -> Task Http.Error BerryFirmness
getBerryFirmnessBy =
    getBy BerryFirmness_ decodeBerryFirmness


{-| -}
getBerryFlavorBy : String -> Task Http.Error BerryFlavor
getBerryFlavorBy =
    getBy BerryFlavor_ decodeBerryFlavor


{-| -}
getCharacteristicBy : String -> Task Http.Error Characteristic
getCharacteristicBy =
    getBy Characteristic_ decodeCharacteristic


{-| -}
getContestEffectBy : String -> Task Http.Error ContestEffect
getContestEffectBy =
    getBy ContestEffect_ decodeContestEffect


{-| -}
getContestTypeBy : String -> Task Http.Error ContestType
getContestTypeBy =
    getBy ContestType_ decodeContestType


{-| -}
getEggGroupBy : String -> Task Http.Error EggGroup
getEggGroupBy =
    getBy EggGroup_ decodeEggGroup


{-| -}
getEncounterConditionBy : String -> Task Http.Error EncounterCondition
getEncounterConditionBy =
    getBy EncounterCondition_ decodeEncounterCondition


{-| -}
getEncounterConditionValueBy : String -> Task Http.Error EncounterConditionValue
getEncounterConditionValueBy =
    getBy EncounterConditionValue_ decodeEncounterConditionValue


{-| -}
getEncounterMethodBy : String -> Task Http.Error EncounterMethod
getEncounterMethodBy =
    getBy EncounterMethod_ decodeEncounterMethod


{-| -}
getEvolutionChainBy : String -> Task Http.Error EvolutionChain
getEvolutionChainBy =
    getBy EvolutionChain_ decodeEvolutionChain


{-| -}
getEvolutionTriggerBy : String -> Task Http.Error EvolutionTrigger
getEvolutionTriggerBy =
    getBy EvolutionTrigger_ decodeEvolutionTrigger


{-| -}
getGenderBy : String -> Task Http.Error Gender
getGenderBy =
    getBy Gender_ decodeGender


{-| -}
getGenerationBy : String -> Task Http.Error Generation
getGenerationBy =
    getBy Generation_ decodeGeneration


{-| -}
getGrowthRateBy : String -> Task Http.Error GrowthRate
getGrowthRateBy =
    getBy GrowthRate_ decodeGrowthRate


{-| -}
getItemBy : String -> Task Http.Error Item
getItemBy =
    getBy Item_ decodeItem


{-| -}
getItemAttributeBy : String -> Task Http.Error ItemAttribute
getItemAttributeBy =
    getBy ItemAttribute_ decodeItemAttribute


{-| -}
getItemCategoryBy : String -> Task Http.Error ItemCategory
getItemCategoryBy =
    getBy ItemCategory_ decodeItemCategory


{-| -}
getItemFlingEffectBy : String -> Task Http.Error ItemFlingEffect
getItemFlingEffectBy =
    getBy ItemFlingEffect_ decodeItemFlingEffect


{-| -}
getItemPocketBy : String -> Task Http.Error ItemPocket
getItemPocketBy =
    getBy ItemPocket_ decodeItemPocket


{-| -}
getLanguageBy : String -> Task Http.Error Language
getLanguageBy =
    getBy Language_ decodeLanguage


{-| -}
getLocationBy : String -> Task Http.Error Location
getLocationBy =
    getBy Location_ decodeLocation


{-| -}
getLocationAreaBy : String -> Task Http.Error LocationArea
getLocationAreaBy =
    getBy LocationArea_ decodeLocationArea


{-| -}
getMachineBy : String -> Task Http.Error Machine
getMachineBy =
    getBy Machine_ decodeMachine


{-| -}
getMoveBy : String -> Task Http.Error Move
getMoveBy =
    getBy Move_ decodeMove


{-| -}
getMoveAilmentBy : String -> Task Http.Error MoveAilment
getMoveAilmentBy =
    getBy MoveAilment_ decodeMoveAilment


{-| -}
getMoveBattleStyleBy : String -> Task Http.Error MoveBattleStyle
getMoveBattleStyleBy =
    getBy MoveBattleStyle_ decodeMoveBattleStyle


{-| -}
getMoveCategoryBy : String -> Task Http.Error MoveCategory
getMoveCategoryBy =
    getBy MoveCategory_ decodeMoveCategory


{-| -}
getMoveDamageClassBy : String -> Task Http.Error MoveDamageClass
getMoveDamageClassBy =
    getBy MoveDamageClass_ decodeMoveDamageClass


{-| -}
getMoveLearnMethodBy : String -> Task Http.Error MoveLearnMethod
getMoveLearnMethodBy =
    getBy MoveLearnMethod_ decodeMoveLearnMethod


{-| -}
getMoveTargetBy : String -> Task Http.Error MoveTarget
getMoveTargetBy =
    getBy MoveTarget_ decodeMoveTarget


{-| -}
getNatureBy : String -> Task Http.Error Nature
getNatureBy =
    getBy Nature_ decodeNature


{-| -}
getPalParkAreaBy : String -> Task Http.Error PalParkArea
getPalParkAreaBy =
    getBy PalParkArea_ decodePalParkArea


{-| -}
getPokeathlonStatBy : String -> Task Http.Error PokeathlonStat
getPokeathlonStatBy =
    getBy PokeathlonStat_ decodePokeathlonStat


{-| -}
getPokedexBy : String -> Task Http.Error Pokedex
getPokedexBy =
    getBy Pokedex_ decodePokedex


{-| -}
getPokemonBy : String -> Task Http.Error Pokemon
getPokemonBy =
    getBy Pokemon_ decodePokemon


{-| -}
getPokemonColorBy : String -> Task Http.Error PokemonColor
getPokemonColorBy =
    getBy PokemonColor_ decodePokemonColor


{-| -}
getPokemonFormBy : String -> Task Http.Error PokemonForm
getPokemonFormBy =
    getBy PokemonForm_ decodePokemonForm


{-| -}
getPokemonHabitatBy : String -> Task Http.Error PokemonHabitat
getPokemonHabitatBy =
    getBy PokemonHabitat_ decodePokemonHabitat


{-| -}
getPokemonShapeBy : String -> Task Http.Error PokemonShape
getPokemonShapeBy =
    getBy PokemonShape_ decodePokemonShape


{-| -}
getPokemonSpeciesBy : String -> Task Http.Error PokemonSpecies
getPokemonSpeciesBy =
    getBy PokemonSpecies_ decodePokemonSpecies


{-| -}
getRegionBy : String -> Task Http.Error Region
getRegionBy =
    getBy Region_ decodeRegion


{-| -}
getStatBy : String -> Task Http.Error Stat
getStatBy =
    getBy Stat_ decodeStat


{-| -}
getSuperContestEffectBy : String -> Task Http.Error SuperContestEffect
getSuperContestEffectBy =
    getBy SuperContestEffect_ decodeSuperContestEffect


{-| -}
getTypeBy : String -> Task Http.Error Type
getTypeBy =
    getBy Type_ decodeType


{-| -}
getVersionBy : String -> Task Http.Error Version
getVersionBy =
    getBy Version_ decodeVersion


{-| -}
getVersionGroupBy : String -> Task Http.Error VersionGroup
getVersionGroupBy =
    getBy VersionGroup_ decodeVersionGroup


{-| -}
getBy : Resource -> Decoder a -> String -> Task Http.Error a
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
makeResourceUrl : ( String, String ) -> String
makeResourceUrl ( endpoint, param ) =
    String.concat
        [ v2
        , endpoint
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



-- TYPES & DECODERS


{-| -}
type alias Ability =
    { id : Int
    , name : String
    , isMainSeries : Bool
    , generation : NamedApiResource
    , names : List Name
    , effectEntries : List VerboseEffect
    , effectChanges : List AbilityEffectChange
    , flavorTextEntries : List AbilityFlavorText
    , pokemon : List AbilityPokemon
    }


{-| -}
decodeAbility : Decoder Ability
decodeAbility =
    decode Ability
        |> required "id" int
        |> required "name" string
        |> required "is_main_series" bool
        |> required "generation" decodeNamedApiResource
        |> required "names" (list decodeName)
        |> required "effect_entries" (list decodeVerboseEffect)
        |> required "effect_changes" (list decodeAbilityEffectChange)
        |> required "flavor_text_entries" (list decodeAbilityFlavorText)
        |> required "pokemon" (list decodeAbilityPokemon)


{-| -}
type alias AbilityEffectChange =
    { effectEntries : List Effect
    , versionGroup : NamedApiResource
    }


{-| -}
decodeAbilityEffectChange : Decoder AbilityEffectChange
decodeAbilityEffectChange =
    decode AbilityEffectChange
        |> required "effect_entries" (list decodeEffect)
        |> required "version_group" decodeNamedApiResource


{-| -}
type alias AbilityFlavorText =
    { flavorText : String
    , language : NamedApiResource
    , versionGroup : NamedApiResource
    }


{-| -}
decodeAbilityFlavorText : Decoder AbilityFlavorText
decodeAbilityFlavorText =
    decode AbilityFlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


{-| -}
type alias AbilityPokemon =
    { isHidden : Bool
    , slot : Int
    , pokemon : NamedApiResource
    }


{-| -}
decodeAbilityPokemon : Decoder AbilityPokemon
decodeAbilityPokemon =
    decode AbilityPokemon
        |> required "is_hidden" bool
        |> required "slot" int
        |> required "pokemon" decodeNamedApiResource


{-| -}
type alias ApiResource =
    { url : String
    }


{-| -}
decodeApiResource : Decoder ApiResource
decodeApiResource =
    decode ApiResource
        |> required "url" string


{-| -}
type alias ApiResourceList =
    { count : Int
    , next : Maybe String
    , previous : Maybe String
    , results : List ApiResource
    }


{-| -}
decodeApiResourceList : Decoder ApiResourceList
decodeApiResourceList =
    decode ApiResourceList
        |> required "count" int
        |> required "next" (maybe string)
        |> required "previous" (maybe string)
        |> required "results" (list decodeApiResource)


{-| -}
type alias AwesomeName =
    { awesomeName : String
    , language : NamedApiResource
    }


{-| -}
decodeAwesomeName : Decoder AwesomeName
decodeAwesomeName =
    decode AwesomeName
        |> required "awesome_name" string
        |> required "language" decodeNamedApiResource


{-| -}
type alias Berry =
    { id : Int
    , name : String
    , growthTime : Int
    , maxHarvest : Int
    , naturalGiftPower : Int
    , size : Int
    , smoothness : Int
    , soilDryness : Int
    , firmness : NamedApiResource
    , flavors : List BerryFlavorMap
    , item : NamedApiResource
    , naturalGiftType : NamedApiResource
    }


{-| -}
decodeBerry : Decoder Berry
decodeBerry =
    decode Berry
        |> required "id" int
        |> required "name" string
        |> required "growth_time" int
        |> required "max_harvest" int
        |> required "natural_gift_power" int
        |> required "size" int
        |> required "smoothness" int
        |> required "soil_dryness" int
        |> required "firmness" decodeNamedApiResource
        |> required "flavors" (list decodeBerryFlavorMap)
        |> required "item" decodeNamedApiResource
        |> required "natural_gift_type" decodeNamedApiResource


{-| -}
type alias BerryFirmness =
    { id : Int
    , name : String
    , berries : List NamedApiResource
    , names : List Name
    }


{-| -}
decodeBerryFirmness : Decoder BerryFirmness
decodeBerryFirmness =
    decode BerryFirmness
        |> required "id" int
        |> required "name" string
        |> required "berries" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
type alias BerryFlavor =
    { id : Int
    , name : String
    , berries : List FlavorBerryMap
    , contestType : NamedApiResource
    , names : List Name
    }


{-| -}
decodeBerryFlavor : Decoder BerryFlavor
decodeBerryFlavor =
    decode BerryFlavor
        |> required "id" int
        |> required "name" string
        |> required "berries" (list decodeFlavorBerryMap)
        |> required "contest_type" decodeNamedApiResource
        |> required "names" (list decodeName)


{-| -}
type alias BerryFlavorMap =
    { potency : Int
    , flavor : NamedApiResource
    }


{-| -}
decodeBerryFlavorMap : Decoder BerryFlavorMap
decodeBerryFlavorMap =
    decode BerryFlavorMap
        |> required "potency" int
        |> required "flavor" decodeNamedApiResource


{-| -}
type alias ChainLink =
    { isBaby : Bool
    , species : NamedApiResource
    , evolutionDetails : List EvolutionDetail
    , evolvesTo : Evolutions
    }


{-| -}
type Evolutions
    = Evolutions (List ChainLink)


{-| -}
decodeChainLink : Decoder ChainLink
decodeChainLink =
    decode ChainLink
        |> required "is_baby" bool
        |> required "species" decodeNamedApiResource
        |> required "evolution_details"
            (list decodeEvolutionDetail)
        |> required "evolves_to"
            (map Evolutions (list (lazy (\_ -> decodeChainLink))))


{-| -}
type alias Characteristic =
    { id : Int
    , geneModulo : Int
    , possibleValues : List Int
    , descriptions : List Description
    }


{-| -}
decodeCharacteristic : Decoder Characteristic
decodeCharacteristic =
    decode Characteristic
        |> required "id" int
        |> required "gene_modulo" int
        |> required "possible_values" (list int)
        |> required "descriptions" (list decodeDescription)


{-| -}
type alias ContestComboSets =
    { normal : ContestComboDetail
    , super : ContestComboDetail
    }


{-| -}
decodeContestComboSets : Decoder ContestComboSets
decodeContestComboSets =
    decode ContestComboSets
        |> required "normal" decodeContestComboDetail
        |> required "super" decodeContestComboDetail


{-| -}
type alias ContestComboDetail =
    { useBefore : List NamedApiResource
    , useAfter : List NamedApiResource
    }


{-| -}
decodeContestComboDetail : Decoder ContestComboDetail
decodeContestComboDetail =
    decode ContestComboDetail
        |> required "use_before" (list decodeNamedApiResource)
        |> required "use_after" (list decodeNamedApiResource)


{-| -}
type alias ContestEffect =
    { id : Int
    , appeal : Int
    , jam : Int
    , effectEntries : List Effect
    , flavorTextEntries : List FlavorText
    }


{-| -}
decodeContestEffect : Decoder ContestEffect
decodeContestEffect =
    decode ContestEffect
        |> required "id" int
        |> required "appeal" int
        |> required "jam" int
        |> required "effect_entries" (list decodeEffect)
        |> required "flavor_text_entries" (list decodeFlavorText)


{-| -}
type alias ContestName =
    { name : String
    , color : String
    , language : NamedApiResource
    }


{-| -}
decodeContestName : Decoder ContestName
decodeContestName =
    decode ContestName
        |> required "name" string
        |> required "color" string
        |> required "language" decodeNamedApiResource


{-| -}
type alias ContestType =
    { id : Int
    , name : String
    , berryFlavor : NamedApiResource
    , names : List ContestName
    }


{-| -}
decodeContestType : Decoder ContestType
decodeContestType =
    decode ContestType
        |> required "id" int
        |> required "name" string
        |> required "berry_flavor" decodeNamedApiResource
        |> required "names" (list decodeContestName)


{-| -}
type alias Description =
    { description : String
    , language : NamedApiResource
    }


{-| -}
decodeDescription : Decoder Description
decodeDescription =
    decode Description
        |> required "description" string
        |> required "language" decodeNamedApiResource


{-| -}
type alias Effect =
    { effect : String
    , language : NamedApiResource
    }


{-| -}
decodeEffect : Decoder Effect
decodeEffect =
    decode Effect
        |> required "effect" string
        |> required "language" decodeNamedApiResource


{-| -}
type alias EggGroup =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


{-| -}
decodeEggGroup : Decoder EggGroup
decodeEggGroup =
    decode EggGroup
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


{-| -}
type alias Encounter =
    { minLevel : Int
    , maxLevel : Int
    , conditionValues : List NamedApiResource
    , chance : Int
    , method : NamedApiResource
    }


{-| -}
decodeEncounter : Decoder Encounter
decodeEncounter =
    decode Encounter
        |> required "min_level" int
        |> required "max_level" int
        |> required "condition_values" (list decodeNamedApiResource)
        |> required "chance" int
        |> required "method" decodeNamedApiResource


{-| -}
type alias EncounterCondition =
    { id : Int
    , name : String
    , names : List Name
    , values : List NamedApiResource
    }


{-| -}
decodeEncounterCondition : Decoder EncounterCondition
decodeEncounterCondition =
    decode EncounterCondition
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "values" (list decodeNamedApiResource)


{-| -}
type alias EncounterConditionValue =
    { id : Int
    , name : String
    , condition : List NamedApiResource
    , names : List Name
    }


{-| -}
decodeEncounterConditionValue : Decoder EncounterConditionValue
decodeEncounterConditionValue =
    decode EncounterConditionValue
        |> required "id" int
        |> required "name" string
        |> required "condition" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
type alias EncounterMethod =
    { id : Int
    , name : String
    , order : Int
    , names : List Name
    }


{-| -}
decodeEncounterMethod : Decoder EncounterMethod
decodeEncounterMethod =
    decode EncounterMethod
        |> required "id" int
        |> required "name" string
        |> required "order" int
        |> required "names" (list decodeName)


{-| -}
type alias EncounterMethodRate =
    { encounterMethod : NamedApiResource
    , versionDetails : List EncounterVersionDetails
    }


{-| -}
decodeEncounterMethodRate : Decoder EncounterMethodRate
decodeEncounterMethodRate =
    decode EncounterMethodRate
        |> required "encounter_method" decodeNamedApiResource
        |> required "version_details" (list decodeEncounterVersionDetails)


{-| -}
type alias EncounterVersionDetails =
    { rate : Int
    , version : NamedApiResource
    }


{-| -}
decodeEncounterVersionDetails : Decoder EncounterVersionDetails
decodeEncounterVersionDetails =
    decode EncounterVersionDetails
        |> required "rate" int
        |> required "version" decodeNamedApiResource


{-| -}
type alias EvolutionChain =
    { id : Int
    , babyTriggerItem : NamedApiResource
    , chain : ChainLink
    }


{-| -}
decodeEvolutionChain : Decoder EvolutionChain
decodeEvolutionChain =
    decode EvolutionChain
        |> required "id" int
        |> required "baby_trigger_item" decodeNamedApiResource
        |> required "chain" decodeChainLink


{-| -}
type alias EvolutionDetail =
    { item : NamedApiResource
    , trigger : NamedApiResource
    , gender : Int
    , heldItem : NamedApiResource
    , knownMove : NamedApiResource
    , knownMoveType : NamedApiResource
    , location : NamedApiResource
    , minLevel : Int
    , minHappiness : Int
    , minBeauty : Int
    , minAffection : Int
    , needsOverworldRain : Bool
    , partySpecies : NamedApiResource
    , partyType : NamedApiResource
    , relativePhysicalStats : Int
    , timeOfDay : String
    , tradeSpecies : NamedApiResource
    , turnUpsideDown : Bool
    }


{-| -}
decodeEvolutionDetail : Decoder EvolutionDetail
decodeEvolutionDetail =
    decode EvolutionDetail
        |> required "item" decodeNamedApiResource
        |> required "trigger" decodeNamedApiResource
        |> required "gender" int
        |> required "held_item" decodeNamedApiResource
        |> required "known_move" decodeNamedApiResource
        |> required "known_move_type" decodeNamedApiResource
        |> required "location" decodeNamedApiResource
        |> required "min_level" int
        |> required "min_happiness" int
        |> required "min_beauty" int
        |> required "min_affection" int
        |> required "needs_overworld_rain" bool
        |> required "party_species" decodeNamedApiResource
        |> required "party_type" decodeNamedApiResource
        |> required "relative_physical_stat" int
        |> required "time_of_day" string
        |> required "trade_species" decodeNamedApiResource
        |> required "turn_upside_down" bool


{-| -}
type alias EvolutionTrigger =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


{-| -}
decodeEvolutionTrigger : Decoder EvolutionTrigger
decodeEvolutionTrigger =
    decode EvolutionTrigger
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species"
            (list decodeNamedApiResource)


{-| -}
type alias FlavorBerryMap =
    { potency : Int
    , berry : NamedApiResource
    }


{-| -}
decodeFlavorBerryMap : Decoder FlavorBerryMap
decodeFlavorBerryMap =
    decode FlavorBerryMap
        |> required "potency" int
        |> required "berry" decodeNamedApiResource


{-| -}
type alias FlavorText =
    { flavorText : String
    , language : NamedApiResource
    }


{-| -}
decodeFlavorText : Decoder FlavorText
decodeFlavorText =
    decode FlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource


{-| -}
type alias Generation =
    { id : Int
    , name : String
    , abilities : List NamedApiResource
    , names : List Name
    , mainRegion : NamedApiResource
    , moves : List NamedApiResource
    , pokemonSpecies : List NamedApiResource
    , types : List NamedApiResource
    , versionGroups : List NamedApiResource
    }


{-| -}
decodeGeneration : Decoder Generation
decodeGeneration =
    decode Generation
        |> required "id" int
        |> required "name" string
        |> required "abilities"
            (list decodeNamedApiResource)
        |> required "names" (list decodeName)
        |> required "main_region" decodeNamedApiResource
        |> required "moves"
            (list decodeNamedApiResource)
        |> required "pokemon_species"
            (list decodeNamedApiResource)
        |> required "types"
            (list decodeNamedApiResource)
        |> required "version_groups"
            (list decodeNamedApiResource)


{-| -}
type alias Gender =
    { id : Int
    , name : String
    , pokemonSpeciesDetails : List PokemonSpeciesGender
    , requiredForEvolution : List NamedApiResource
    }


{-| -}
decodeGender : Decoder Gender
decodeGender =
    decode Gender
        |> required "id" int
        |> required "name" string
        |> required "pokemon_species_details" (list decodePokemonSpeciesGender)
        |> required "required_for_evolution" (list decodeNamedApiResource)


{-| -}
type alias GenerationGameIndex =
    { gameIndex : Int
    , generation : NamedApiResource
    }


{-| -}
decodeGenerationGameIndex : Decoder GenerationGameIndex
decodeGenerationGameIndex =
    decode GenerationGameIndex
        |> required "game_index" int
        |> required "generation" decodeNamedApiResource


{-| -}
type alias Genus =
    { genus : String
    , language : NamedApiResource
    }


{-| -}
decodeGenus : Decoder Genus
decodeGenus =
    decode Genus
        |> required "genus" string
        |> required "language" decodeNamedApiResource


{-| -}
type alias GrowthRate =
    { id : Int
    , name : String
    , formula : String
    , descriptions : List Description
    , levels : List GrowthRateExperienceLevel
    , pokemonSpecies : List NamedApiResource
    }


{-| -}
decodeGrowthRate : Decoder GrowthRate
decodeGrowthRate =
    decode GrowthRate
        |> required "id" int
        |> required "name" string
        |> required "formula" string
        |> required "descriptions" (list decodeDescription)
        |> required "levels" (list decodeGrowthRateExperienceLevel)
        |> required "pokemon_species" (list decodeNamedApiResource)


{-| -}
type alias GrowthRateExperienceLevel =
    { level : Int
    , experience : Int
    }


{-| -}
decodeGrowthRateExperienceLevel : Decoder GrowthRateExperienceLevel
decodeGrowthRateExperienceLevel =
    decode GrowthRateExperienceLevel
        |> required "level" int
        |> required "experience" int


{-| -}
type alias Item =
    { id : Int
    , name : String
    , cost : Int
    , flingPower : Int
    , flingEffect : NamedApiResource
    , attributes : List NamedApiResource
    , category : ItemCategory
    , effectEntries : List VerboseEffect
    , flavorTextEntries : List VersionGroupFlavorText
    , gameIndicies : List GenerationGameIndex
    , names : List Name
    , sprites : ItemSprites
    , heldByPokemon : List ItemHolderPokemon
    , babyTriggerFor : ApiResource
    , machines : List MachineVersionDetail
    }


{-| -}
decodeItem : Decoder Item
decodeItem =
    decode Item
        |> required "id" int
        |> required "name" string
        |> required "cost" int
        |> required "fling_power" int
        |> required "fling_effect" decodeNamedApiResource
        |> required "attributes" (list decodeNamedApiResource)
        |> required "category" decodeItemCategory
        |> required "effect_entries" (list decodeVerboseEffect)
        |> required "flavor_text_entries" (list decodeVersionGroupFlavorText)
        |> required "game_indices" (list decodeGenerationGameIndex)
        |> required "names" (list decodeName)
        |> required "sprites" decodeItemSprites
        |> required "held_by_pokemon" (list decodeItemHolderPokemon)
        |> required "baby_trigger_for" decodeApiResource
        |> required "machines" (list decodeMachineVersionDetail)


{-| -}
type alias ItemAttribute =
    { id : Int
    , name : String
    , items : List NamedApiResource
    , names : List Name
    , descriptions : List Description
    }


{-| -}
decodeItemAttribute : Decoder ItemAttribute
decodeItemAttribute =
    decode ItemAttribute
        |> required "id" int
        |> required "name" string
        |> required "items" (list decodeNamedApiResource)
        |> required "names" (list decodeName)
        |> required "descriptions" (list decodeDescription)


{-| -}
type alias ItemCategory =
    { id : Int
    , name : String
    , items : List NamedApiResource
    , names : List Name
    , pocket : NamedApiResource
    }


{-| -}
decodeItemCategory : Decoder ItemCategory
decodeItemCategory =
    decode ItemCategory
        |> required "id" int
        |> required "name" string
        |> required "items" (list decodeNamedApiResource)
        |> required "names" (list decodeName)
        |> required "pocket" decodeNamedApiResource


{-| -}
type alias ItemFlingEffect =
    { id : Int
    , name : String
    , effectEntries : List Effect
    , items : List NamedApiResource
    }


{-| -}
decodeItemFlingEffect : Decoder ItemFlingEffect
decodeItemFlingEffect =
    decode ItemFlingEffect
        |> required "id" int
        |> required "name" string
        |> required "effect_entries" (list decodeEffect)
        |> required "items" (list decodeNamedApiResource)


{-| -}
type alias ItemHolderPokemon =
    { pokemon : String
    , versionDetails : List ItemHolderPokemonVersionDetail
    }


{-| -}
decodeItemHolderPokemon : Decoder ItemHolderPokemon
decodeItemHolderPokemon =
    decode ItemHolderPokemon
        |> required "pokemon" string
        |> required "version_details" (list decodeItemHolderPokemonVersionDetail)


{-| -}
type alias ItemHolderPokemonVersionDetail =
    { rarity : String
    , version : NamedApiResource
    }


{-| -}
decodeItemHolderPokemonVersionDetail : Decoder ItemHolderPokemonVersionDetail
decodeItemHolderPokemonVersionDetail =
    decode ItemHolderPokemonVersionDetail
        |> required "rarity" string
        |> required "version" decodeNamedApiResource


{-| -}
type alias ItemPocket =
    { id : Int
    , name : String
    , categories : List NamedApiResource
    , names : List Name
    }


{-| -}
decodeItemPocket : Decoder ItemPocket
decodeItemPocket =
    decode ItemPocket
        |> required "id" int
        |> required "name" string
        |> required "categories" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
type alias ItemSprites =
    { default : String
    }


{-| -}
decodeItemSprites : Decoder ItemSprites
decodeItemSprites =
    decode ItemSprites
        |> required "default" string


{-| -}
type alias Language =
    { id : Int
    , name : String
    , official : Bool
    , iso639 : String
    , iso3166 : String
    , names : List Name
    }


{-| -}
decodeLanguage : Decoder Language
decodeLanguage =
    decode Language
        |> required "id" int
        |> required "name" string
        |> required "official" bool
        |> required "iso639" string
        |> required "iso3166" string
        |> required "names" (list decodeName)


{-| -}
type alias Location =
    { id : Int
    , name : String
    , region : NamedApiResource
    , names : List Name
    , gameIndices : List GenerationGameIndex
    , areas : List NamedApiResource
    }


{-| -}
decodeLocation : Decoder Location
decodeLocation =
    decode Location
        |> required "id" int
        |> required "name" string
        |> required "region" decodeNamedApiResource
        |> required "names" (list decodeName)
        |> required "game_indices" (list decodeGenerationGameIndex)
        |> required "areas" (list decodeNamedApiResource)


{-| -}
type alias LocationArea =
    { id : Int
    , name : String
    , gameIndex : Int
    , encounterMethodRates : List EncounterMethodRate
    , location : NamedApiResource
    , names : List Name
    , pokemonEncounters : List PokemonEncounter
    }


{-| -}
decodeLocationArea : Decoder LocationArea
decodeLocationArea =
    decode LocationArea
        |> required "id" int
        |> required "name" string
        |> required "game_index" int
        |> required "encounter_method_rates" (list decodeEncounterMethodRate)
        |> required "location" decodeNamedApiResource
        |> required "names" (list decodeName)
        |> required "pokemon_encounters" (list decodePokemonEncounter)


{-| -}
type alias LocationAreaEncounter =
    { locationArea : NamedApiResource
    , versionDetails : List VersionEncounterDetail
    }


{-| -}
decodeLocationAreaEncounter : Decoder LocationAreaEncounter
decodeLocationAreaEncounter =
    decode LocationAreaEncounter
        |> required "location_area" decodeNamedApiResource
        |> required "version_details" (list decodeVersionEncounterDetail)


{-| -}
type alias Machine =
    { id : Int
    , item : NamedApiResource
    , move : NamedApiResource
    , versionGroup : NamedApiResource
    }


{-| -}
decodeMachine : Decoder Machine
decodeMachine =
    decode Machine
        |> required "id" int
        |> required "item" decodeNamedApiResource
        |> required "move" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


{-| -}
type alias MachineVersionDetail =
    { machine : ApiResource
    , versionGroup : NamedApiResource
    }


{-| -}
decodeMachineVersionDetail : Decoder MachineVersionDetail
decodeMachineVersionDetail =
    decode MachineVersionDetail
        |> required "machine" decodeApiResource
        |> required "version_group" decodeNamedApiResource


{-| -}
type alias Move =
    { id : Int
    , name : String
    , accuracy : Int
    , effectChance : Int
    , pp : Int
    , priority : Int
    , power : Int
    , contestCombos : ContestComboSets
    , contestType : NamedApiResource
    , contestEffect : ApiResource
    , damageClass : NamedApiResource
    , effectEntries : List VerboseEffect
    , effectChanges : List AbilityEffectChange
    , flavorTextEntries : List MoveFlavorText
    , generation : NamedApiResource
    , machines : List MachineVersionDetail
    , meta : MoveMetaData
    , names : List Name
    , pastValues : List PastMoveStatValues
    , statChanges : List MoveStatChange
    , superContestEffect : ApiResource
    , target : NamedApiResource
    , type_ : NamedApiResource
    }


{-| -}
decodeMove : Decoder Move
decodeMove =
    decode Move
        |> required "id" int
        |> required "name" string
        |> required "accuracy" int
        |> required "effect_chance" int
        |> required "pp" int
        |> required "priority" int
        |> required "power" int
        |> required "contest_combos" decodeContestComboSets
        |> required "contest_type" decodeNamedApiResource
        |> required "contest_effect" decodeApiResource
        |> required "damage_class" decodeNamedApiResource
        |> required "effect_entries" (list decodeVerboseEffect)
        |> required "effect_changes" (list decodeAbilityEffectChange)
        |> required "flavor_text_entries" (list decodeMoveFlavorText)
        |> required "generation" decodeNamedApiResource
        |> required "machines" (list decodeMachineVersionDetail)
        |> required "meta" decodeMoveMetaData
        |> required "names" (list decodeName)
        |> required "past_values" (list decodePastMoveStatValues)
        |> required "stat_changes" (list decodeMoveStatChange)
        |> required "super_contest_effect" decodeApiResource
        |> required "target" decodeNamedApiResource
        |> required "type" decodeNamedApiResource


{-| -}
type alias MoveAilment =
    { id : Int
    , name : String
    , moves : List NamedApiResource
    , names : List Name
    }


{-| -}
decodeMoveAilment : Decoder MoveAilment
decodeMoveAilment =
    decode MoveAilment
        |> required "id" int
        |> required "name" string
        |> required "moves" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
type alias MoveBattleStyle =
    { id : Int
    , name : String
    , names : List Name
    }


{-| -}
decodeMoveBattleStyle : Decoder MoveBattleStyle
decodeMoveBattleStyle =
    decode MoveBattleStyle
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)


{-| -}
type alias MoveBattleStylePreference =
    { lowHpPreference : Int
    , highHpPreference : Int
    , moveBattleStyle : NamedApiResource
    }


{-| -}
decodeMoveBattleStylePreference : Decoder MoveBattleStylePreference
decodeMoveBattleStylePreference =
    decode MoveBattleStylePreference
        |> required "low_hp_preference" int
        |> required "high_hp_preference" int
        |> required "move_battle_style" decodeNamedApiResource


{-| -}
type alias MoveCategory =
    { id : Int
    , name : String
    , moves : List NamedApiResource
    , descriptions : List Description
    }


{-| -}
decodeMoveCategory : Decoder MoveCategory
decodeMoveCategory =
    decode MoveCategory
        |> required "id" int
        |> required "name" string
        |> required "moves" (list decodeNamedApiResource)
        |> required "descriptions" (list decodeDescription)


{-| -}
type alias MoveDamageClass =
    { id : Int
    , name : String
    , descriptions : List Description
    , moves : List NamedApiResource
    , names : List Name
    }


{-| -}
decodeMoveDamageClass : Decoder MoveDamageClass
decodeMoveDamageClass =
    decode MoveDamageClass
        |> required "id" int
        |> required "name" string
        |> required "descriptions" (list decodeDescription)
        |> required "moves" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
type alias MoveFlavorText =
    { flavorText : String
    , language : NamedApiResource
    , versionGroup : NamedApiResource
    }


{-| -}
decodeMoveFlavorText : Decoder MoveFlavorText
decodeMoveFlavorText =
    decode MoveFlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


{-| -}
type alias MoveLearnMethod =
    { id : Int
    , name : String
    , descriptions : List Description
    , names : List Name
    , versionGroups : List NamedApiResource
    }


{-| -}
decodeMoveLearnMethod : Decoder MoveLearnMethod
decodeMoveLearnMethod =
    decode MoveLearnMethod
        |> required "id" int
        |> required "name" string
        |> required "descriptions" (list decodeDescription)
        |> required "names" (list decodeName)
        |> required "version_groups" (list decodeNamedApiResource)


{-| -}
type alias MoveMetaData =
    { ailment : NamedApiResource
    , category : NamedApiResource
    , minHits : Int
    , maxHits : Int
    , minTurns : Int
    , maxTurns : Int
    , drain : Int
    , healing : Int
    , critRate : Int
    , ailmentChance : Int
    , flinchChance : Int
    , statChance : Int
    }


{-| -}
decodeMoveMetaData : Decoder MoveMetaData
decodeMoveMetaData =
    decode MoveMetaData
        |> required "ailment" decodeNamedApiResource
        |> required "category" decodeNamedApiResource
        |> required "min_hits" int
        |> required "max_hits" int
        |> required "min_turns" int
        |> required "max_turns" int
        |> required "drains" int
        |> required "healing" int
        |> required "crit_rate" int
        |> required "ailment_chance" int
        |> required "flinch_chance" int
        |> required "stat_chance" int


{-| -}
type alias MoveStatAffect =
    { change : Int
    , move : NamedApiResource
    }


{-| -}
decodeMoveStatAffect : Decoder MoveStatAffect
decodeMoveStatAffect =
    decode MoveStatAffect
        |> required "change" int
        |> required "move" decodeNamedApiResource


{-| -}
type alias MoveStatAffectSets =
    { increase : List MoveStatAffect
    , decrease : List MoveStatAffect
    }


{-| -}
decodeMoveStatAffectSets : Decoder MoveStatAffectSets
decodeMoveStatAffectSets =
    decode MoveStatAffectSets
        |> required "increase" (list decodeMoveStatAffect)
        |> required "decrease" (list decodeMoveStatAffect)


{-| -}
type alias MoveStatChange =
    { change : Int
    , stat : NamedApiResource
    }


{-| -}
decodeMoveStatChange : Decoder MoveStatChange
decodeMoveStatChange =
    decode MoveStatChange
        |> required "change" int
        |> required "stat" decodeNamedApiResource


{-| -}
type alias MoveTarget =
    { id : Int
    , name : String
    , descriptions : List Description
    , moves : List NamedApiResource
    , names : List Name
    }


{-| -}
decodeMoveTarget : Decoder MoveTarget
decodeMoveTarget =
    decode MoveTarget
        |> required "id" int
        |> required "name" string
        |> required "descriptions" (list decodeDescription)
        |> required "moves" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
type alias Name =
    { name : String
    , language : NamedApiResource
    }


{-| -}
decodeName : Decoder Name
decodeName =
    decode Name
        |> required "name" string
        |> required "language" decodeNamedApiResource


{-| -}
type alias NamedApiResource =
    { name : String
    , url : String
    }


{-| -}
decodeNamedApiResource : Decoder NamedApiResource
decodeNamedApiResource =
    decode NamedApiResource
        |> required "name" string
        |> required "url" string


{-| -}
type alias NamedApiResourceList =
    { count : Int
    , next : Maybe String
    , previous : Maybe String
    , results : List NamedApiResource
    }


{-| -}
decodeNamedApiResourceList : Decoder NamedApiResourceList
decodeNamedApiResourceList =
    decode NamedApiResourceList
        |> required "count" int
        |> required "next" (maybe string)
        |> required "previous" (maybe string)
        |> required "results" (list decodeNamedApiResource)


{-| -}
type alias Nature =
    { id : Int
    , name : String
    , decreasedStat : NamedApiResource
    , increasedStat : NamedApiResource
    , hatesFlavor : NamedApiResource
    , likesFlavor : NamedApiResource
    , pokeathlonStatChanges : List NatureStatChange
    , moveBattleStylePreferences : List MoveBattleStylePreference
    , names : List Name
    }


{-| -}
decodeNature : Decoder Nature
decodeNature =
    decode Nature
        |> required "id" int
        |> required "name" string
        |> required "decreased_stat" decodeNamedApiResource
        |> required "increased_stat" decodeNamedApiResource
        |> required "hates_flavor" decodeNamedApiResource
        |> required "likes_flavor" decodeNamedApiResource
        |> required "pokeathlon_stat_changes" (list decodeNatureStatChange)
        |> required "move_battle_style_preferences" (list decodeMoveBattleStylePreference)
        |> required "names" (list decodeName)


{-| -}
type alias NaturePokeathlonStatAffect =
    { maxChange : Int
    , nature : NamedApiResource
    }


{-| -}
decodeNaturePokeathlonStatAffect : Decoder NaturePokeathlonStatAffect
decodeNaturePokeathlonStatAffect =
    decode NaturePokeathlonStatAffect
        |> required "max_change" int
        |> required "nature" decodeNamedApiResource


{-| -}
type alias NaturePokeathlonStatAffectSets =
    { increase : List NaturePokeathlonStatAffect
    , decrease : List NaturePokeathlonStatAffect
    }


{-| -}
decodeNaturePokeathlonStatAffectSets : Decoder NaturePokeathlonStatAffectSets
decodeNaturePokeathlonStatAffectSets =
    decode NaturePokeathlonStatAffectSets
        |> required "increase" (list decodeNaturePokeathlonStatAffect)
        |> required "decrease" (list decodeNaturePokeathlonStatAffect)


{-| -}
type alias NatureStatAffectSets =
    { increase : List NamedApiResource
    , decrease : List NamedApiResource
    }


{-| -}
decodeNatureStatAffectSets : Decoder NatureStatAffectSets
decodeNatureStatAffectSets =
    decode NatureStatAffectSets
        |> required "increase" (list decodeNamedApiResource)
        |> required "decrease" (list decodeNamedApiResource)


{-| -}
type alias NatureStatChange =
    { maxChange : Int
    , pokeathlonStat : NamedApiResource
    }


{-| -}
decodeNatureStatChange : Decoder NatureStatChange
decodeNatureStatChange =
    decode NatureStatChange
        |> required "max_change" int
        |> required "pokeathlon_stat" decodeNamedApiResource


{-| -}
type alias PalParkArea =
    { id : Int
    , name : String
    , names : List Name
    , pokemonEncounters : List PalParkEncounterSpecies
    }


{-| -}
decodePalParkArea : Decoder PalParkArea
decodePalParkArea =
    decode PalParkArea
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_encounters" (list decodePalParkEncounterSpecies)


{-| -}
type alias PalParkEncounterArea =
    { baseScore : Int
    , rate : Int
    , area : NamedApiResource
    }


{-| -}
decodePalParkEncounterArea : Decoder PalParkEncounterArea
decodePalParkEncounterArea =
    decode PalParkEncounterArea
        |> required "base_score" int
        |> required "rate" int
        |> required "area" decodeNamedApiResource


{-| -}
type alias PalParkEncounterSpecies =
    { baseScore : Int
    , rate : Int
    , pokemonSpecies : NamedApiResource
    }


{-| -}
decodePalParkEncounterSpecies : Decoder PalParkEncounterSpecies
decodePalParkEncounterSpecies =
    decode PalParkEncounterSpecies
        |> required "base_score" int
        |> required "rate" int
        |> required "pokemon_species" decodeNamedApiResource


{-| -}
type alias PastMoveStatValues =
    { accuracy : Int
    , effectChance : Int
    , power : Int
    , pp : Int
    , effectEntries : List VerboseEffect
    , type_ : NamedApiResource
    , versionGroup : NamedApiResource
    }


{-| -}
decodePastMoveStatValues : Decoder PastMoveStatValues
decodePastMoveStatValues =
    decode PastMoveStatValues
        |> required "accuracy" int
        |> required "effect_chance" int
        |> required "power" int
        |> required "pp" int
        |> required "effect_entries" (list decodeVerboseEffect)
        |> required "type" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


{-| -}
type alias PokeathlonStat =
    { id : Int
    , name : String
    , names : List Name
    , affectingNatures : NaturePokeathlonStatAffectSets
    }


{-| -}
decodePokeathlonStat : Decoder PokeathlonStat
decodePokeathlonStat =
    decode PokeathlonStat
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "affecting_natures" decodeNaturePokeathlonStatAffectSets


{-| -}
type alias Pokedex =
    { id : Int
    , name : String
    , isMainSeries : Bool
    , descriptions : List Description
    , names : List Name
    , pokemonEntries : List PokemonEntry
    , region : NamedApiResource
    , versionGroups : List NamedApiResource
    }


{-| -}
decodePokedex : Decoder Pokedex
decodePokedex =
    decode Pokedex
        |> required "id" int
        |> required "name" string
        |> required "is_main_series" bool
        |> required "descriptions" (list decodeDescription)
        |> required "names" (list decodeName)
        |> required "pokemon_entries" (list decodePokemonEntry)
        |> required "region" decodeNamedApiResource
        |> required "version_groups"
            (list decodeNamedApiResource)


{-| -}
type alias Pokemon =
    { id : Int
    , name : String
    , baseExperience : Int
    , height : Int
    , isDefault : Bool
    , order : Int
    , weight : Int
    , locationAreaEncounters : String
    , abilities : List PokemonAbility
    , forms : List NamedApiResource
    , moves : List PokemonMove
    , sprites : PokemonSprites
    , stats : List PokemonStat
    , heldItems : List PokemonHeldItem
    , species : NamedApiResource
    , gameIndices : List VersionGameIndex
    , types : List PokemonType
    }


{-| -}
decodePokemon : Decoder Pokemon
decodePokemon =
    decode Pokemon
        |> required "id" int
        |> required "name" string
        |> required "base_experience" int
        |> required "height" int
        |> required "is_default" bool
        |> required "order" int
        |> required "weight" int
        |> required "location_area_encounters" string
        |> required "abilities" (list decodePokemonAbility)
        |> required "forms" (list decodeNamedApiResource)
        |> required "moves" (list decodePokemonMove)
        |> required "sprites" decodePokemonSprites
        |> required "stats" (list decodePokemonStat)
        |> required "held_items" (list decodePokemonHeldItem)
        |> required "species" decodeNamedApiResource
        |> required "game_indices" (list decodeVersionGameIndex)
        |> required "types" (list decodePokemonType)


{-| -}
type alias PokemonAbility =
    { slot : Int
    , isHidden : Bool
    , ability : NamedApiResource
    }


{-| -}
decodePokemonAbility : Decoder PokemonAbility
decodePokemonAbility =
    decode PokemonAbility
        |> required "slot" int
        |> required "is_hidden" bool
        |> required "ability" decodeNamedApiResource


{-| -}
type alias PokemonColor =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


{-| -}
decodePokemonColor : Decoder PokemonColor
decodePokemonColor =
    decode PokemonColor
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


{-| -}
type alias PokemonEncounter =
    { pokemon : NamedApiResource
    , versionDetails : List VersionEncounterDetail
    }


{-| -}
decodePokemonEncounter : Decoder PokemonEncounter
decodePokemonEncounter =
    decode PokemonEncounter
        |> required "pokemon" decodeNamedApiResource
        |> required "version_details" (list decodeVersionEncounterDetail)


{-| -}
type alias PokemonEntry =
    { entryNumber : Int
    , pokemonSpecies : NamedApiResource
    }


{-| -}
decodePokemonEntry : Decoder PokemonEntry
decodePokemonEntry =
    decode PokemonEntry
        |> required "entry_number" int
        |> required "pokemon_species" decodeNamedApiResource


{-| -}
type alias PokemonForm =
    { id : Int
    , name : String
    , order : Int
    , formOrder : Int
    , isDefault : Bool
    , isBattleOnly : Bool
    , isMega : Bool
    , formName : String
    , pokemon : NamedApiResource
    , sprites : PokemonFormSprites
    , versionGroup : NamedApiResource
    , names : List Name
    , formNames : List Name
    }


{-| -}
decodePokemonForm : Decoder PokemonForm
decodePokemonForm =
    decode PokemonForm
        |> required "id" int
        |> required "name" string
        |> required "order" int
        |> required "form_order" int
        |> required "is_default" bool
        |> required "is_battle_only" bool
        |> required "is_mega" bool
        |> required "form_name" string
        |> required "pokemon" decodeNamedApiResource
        |> required "sprites" decodePokemonFormSprites
        |> required "version_group" decodeNamedApiResource
        |> required "names" (list decodeName)
        |> required "form_names" (list decodeName)


{-| -}
type alias PokemonFormSprites =
    { frontDefault : String
    , frontShiny : String
    , backDefault : String
    , backShiny : String
    }


{-| -}
decodePokemonFormSprites : Decoder PokemonFormSprites
decodePokemonFormSprites =
    decode PokemonFormSprites
        |> required "front_default" string
        |> required "front_shiny" string
        |> required "back_default" string
        |> required "back_shiny" string


{-| -}
type alias PokemonHabitat =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


{-| -}
decodePokemonHabitat : Decoder PokemonHabitat
decodePokemonHabitat =
    decode PokemonHabitat
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


{-| -}
type alias PokemonHeldItem =
    { item : NamedApiResource
    , versionDetails : List PokemonHeldItemVersion
    }


{-| -}
decodePokemonHeldItem : Decoder PokemonHeldItem
decodePokemonHeldItem =
    decode PokemonHeldItem
        |> required "item" decodeNamedApiResource
        |> required "version_details"
            (list decodePokemonHeldItemVersion)


{-| -}
type alias PokemonHeldItemVersion =
    { version : NamedApiResource
    , rarity : Int
    }


{-| -}
decodePokemonHeldItemVersion : Decoder PokemonHeldItemVersion
decodePokemonHeldItemVersion =
    decode PokemonHeldItemVersion
        |> required "version" decodeNamedApiResource
        |> required "rarity" int


{-| -}
type alias PokemonMove =
    { move : NamedApiResource
    , versionGroupDetails : List PokemonMoveVersion
    }


{-| -}
decodePokemonMove : Decoder PokemonMove
decodePokemonMove =
    decode PokemonMove
        |> required "move" decodeNamedApiResource
        |> required "version_group_details"
            (list decodePokemonMoveVersion)


{-| -}
type alias PokemonMoveVersion =
    { moveLearnMethod : NamedApiResource
    , versionGroup : NamedApiResource
    , levelLearnedAt : Int
    }


{-| -}
decodePokemonMoveVersion : Decoder PokemonMoveVersion
decodePokemonMoveVersion =
    decode PokemonMoveVersion
        |> required "move_learn_method" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource
        |> required "level_learned_at" int


{-| -}
type alias PokemonShape =
    { id : Int
    , name : String
    , awesomeNames : List AwesomeName
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


{-| -}
decodePokemonShape : Decoder PokemonShape
decodePokemonShape =
    decode PokemonShape
        |> required "id" int
        |> required "name" string
        |> required "awesome_names" (list decodeAwesomeName)
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


{-| -}
type alias PokemonSpecies =
    { id : Int
    , name : String
    , order : Int
    , genderRate : Int
    , captureRate : Int
    , baseHappiness : Int
    , isBaby : Bool
    , hatchCounter : Int
    , hasGenderDifferences : Bool
    , formsSwitchable : Bool
    , growthRate : NamedApiResource
    , pokedexNumbers : List PokemonSpeciesDexEntry
    , eggGroups : List NamedApiResource
    , color : NamedApiResource
    , shape : NamedApiResource
    , evolvesFromSpecies : NamedApiResource
    , evolutionChain : ApiResource
    , habitat : NamedApiResource
    , generation : NamedApiResource
    , names : List Name
    , palParkEncounters : List PalParkEncounterArea
    , flavorTextEntries : List FlavorText
    , formDescription : List Description
    , genera : List Genus
    , varieties : List PokemonSpeciesVariety
    }


{-| -}
decodePokemonSpecies : Decoder PokemonSpecies
decodePokemonSpecies =
    decode PokemonSpecies
        |> required "id" int
        |> required "name" string
        |> required "order" int
        |> required "gender_rate" int
        |> required "capture_rate" int
        |> required "base_happiness" int
        |> required "is_baby" bool
        |> required "hatch_counter" int
        |> required "has_gender_differences" bool
        |> required "forms_switchable" bool
        |> required "growth_rate" decodeNamedApiResource
        |> required "pokedex_numbers" (list decodePokemonSpeciesDexEntry)
        |> required "egg_groups" (list decodeNamedApiResource)
        |> required "color" decodeNamedApiResource
        |> required "shape" decodeNamedApiResource
        |> required "evolves_from_species" decodeNamedApiResource
        |> required "evolution_chain" decodeApiResource
        |> required "habitat" decodeNamedApiResource
        |> required "generation" decodeNamedApiResource
        |> required "names" (list decodeName)
        |> required "pal_park_encounters" (list decodePalParkEncounterArea)
        |> required "flavor_text_entries" (list decodeFlavorText)
        |> required "form_descriptions" (list decodeDescription)
        |> required "genera" (list decodeGenus)
        |> required "varieties" (list decodePokemonSpeciesVariety)


{-| -}
type alias PokemonSpeciesDexEntry =
    { entryNumber : Int
    , pokedex : NamedApiResource
    }


{-| -}
decodePokemonSpeciesDexEntry : Decoder PokemonSpeciesDexEntry
decodePokemonSpeciesDexEntry =
    decode PokemonSpeciesDexEntry
        |> required "entry_number" int
        |> required "pokedex" decodeNamedApiResource


{-| -}
type alias PokemonSpeciesGender =
    { rate : Int
    , pokemonSpecies : NamedApiResource
    }


{-| -}
decodePokemonSpeciesGender : Decoder PokemonSpeciesGender
decodePokemonSpeciesGender =
    decode PokemonSpeciesGender
        |> required "rate" int
        |> required "pokemon_species" decodeNamedApiResource


{-| -}
type alias PokemonSpeciesVariety =
    { isDefault : Bool
    , pokemon : NamedApiResource
    }


{-| -}
decodePokemonSpeciesVariety : Decoder PokemonSpeciesVariety
decodePokemonSpeciesVariety =
    decode PokemonSpeciesVariety
        |> required "is_default" bool
        |> required "pokemon" decodeNamedApiResource


{-| -}
type alias PokemonSprites =
    { frontDefault : Maybe String
    , frontShiny : Maybe String
    , frontFemale : Maybe String
    , frontShinyFemale : Maybe String
    , backDefault : Maybe String
    , backShiny : Maybe String
    , backFemale : Maybe String
    , backShinyFemale : Maybe String
    }


{-| -}
decodePokemonSprites : Decoder PokemonSprites
decodePokemonSprites =
    decode PokemonSprites
        |> required "front_default" (maybe string)
        |> required "front_shiny" (maybe string)
        |> required "front_female" (maybe string)
        |> required "front_shiny_female" (maybe string)
        |> required "back_default" (maybe string)
        |> required "back_shiny" (maybe string)
        |> required "back_female" (maybe string)
        |> required "back_shiny_female" (maybe string)


{-| -}
type alias PokemonStat =
    { effort : Int
    , baseStat : Int
    , stat : NamedApiResource
    }


{-| -}
decodePokemonStat : Decoder PokemonStat
decodePokemonStat =
    decode PokemonStat
        |> required "effort" int
        |> required "base_stat" int
        |> required "stat" decodeNamedApiResource


{-| -}
type alias PokemonType =
    { slot : Int
    , type_ : NamedApiResource
    }


{-| -}
decodePokemonType : Decoder PokemonType
decodePokemonType =
    decode PokemonType
        |> required "slot" int
        |> required "type" decodeNamedApiResource


{-| -}
type alias Region =
    { id : Int
    , name : String
    , locations : List NamedApiResource
    , mainGeneration : NamedApiResource
    , names : List Name
    , pokedexes : List NamedApiResource
    , versionGroups : List NamedApiResource
    }


{-| -}
decodeRegion : Decoder Region
decodeRegion =
    decode Region
        |> required "id" int
        |> required "name" string
        |> required "locations" (list decodeNamedApiResource)
        |> required "main_generation" decodeNamedApiResource
        |> required "names" (list decodeName)
        |> required "pokedexes" (list decodeNamedApiResource)
        |> required "version_groups" (list decodeNamedApiResource)


{-| -}
type alias Stat =
    { id : Int
    , name : String
    , gameIndex : Int
    , isBattleOnly : Bool
    , affectingMoves : MoveStatAffectSets
    , affectingNatures : NatureStatAffectSets
    , characteristics : List ApiResource
    , moveDamageClass : NamedApiResource
    , names : List Name
    }


{-| -}
decodeStat : Decoder Stat
decodeStat =
    decode Stat
        |> required "id" int
        |> required "name" string
        |> required "game_index" int
        |> required "is_battle_only" bool
        |> required "affecting_moves" decodeMoveStatAffectSets
        |> required "affecting_natures" decodeNatureStatAffectSets
        |> required "characteristics" (list decodeApiResource)
        |> required "move_damage_class" decodeNamedApiResource
        |> required "names" (list decodeName)


{-| -}
type alias SuperContestEffect =
    { id : Int
    , appeal : Int
    , flavorTextEntries : List FlavorText
    , moves : List NamedApiResource
    }


{-| -}
decodeSuperContestEffect : Decoder SuperContestEffect
decodeSuperContestEffect =
    decode SuperContestEffect
        |> required "id" int
        |> required "appeal" int
        |> required "flavor_text_entries" (list decodeFlavorText)
        |> required "moves" (list decodeNamedApiResource)


{-| -}
type alias Type =
    { id : Int
    , name : String
    , damageRelations : TypeRelations
    , gameIndices : List GenerationGameIndex
    , generation : NamedApiResource
    , moveDamageClass : NamedApiResource
    , names : List Name
    , pokemon : List TypePokemon
    , moves : List NamedApiResource
    }


{-| -}
decodeType : Decoder Type
decodeType =
    decode Type
        |> required "id" int
        |> required "name" string
        |> required "damage_relations" decodeTypeRelations
        |> required "game_indices" (list decodeGenerationGameIndex)
        |> required "generation" decodeNamedApiResource
        |> required "move_damage_class" decodeNamedApiResource
        |> required "names" (list decodeName)
        |> required "pokemon" (list decodeTypePokemon)
        |> required "moves" (list decodeNamedApiResource)


{-| -}
type alias TypePokemon =
    { slot : Int
    , pokemon : NamedApiResource
    }


{-| -}
decodeTypePokemon : Decoder TypePokemon
decodeTypePokemon =
    decode TypePokemon
        |> required "slot" int
        |> required "pokemon" decodeNamedApiResource


{-| -}
type alias TypeRelations =
    { noDamageTo : List NamedApiResource
    , halfDamageTo : List NamedApiResource
    , doubleDamageTo : List NamedApiResource
    , noDamageFrom : List NamedApiResource
    , halfDamageFrom : List NamedApiResource
    , doubleDamageFrom : List NamedApiResource
    }


{-| -}
decodeTypeRelations : Decoder TypeRelations
decodeTypeRelations =
    decode TypeRelations
        |> required "no_damage_to" (list decodeNamedApiResource)
        |> required "half_damage_to" (list decodeNamedApiResource)
        |> required "double_damage_to" (list decodeNamedApiResource)
        |> required "no_damage_from" (list decodeNamedApiResource)
        |> required "half_damage_from" (list decodeNamedApiResource)
        |> required "double_damage_from" (list decodeNamedApiResource)


{-| -}
type alias VerboseEffect =
    { effect : String
    , shortEffect : String
    , language : NamedApiResource
    }


{-| -}
decodeVerboseEffect : Decoder VerboseEffect
decodeVerboseEffect =
    decode VerboseEffect
        |> required "effect" string
        |> required "short_effect" string
        |> required "language" decodeNamedApiResource


{-| -}
type alias Version =
    { id : Int
    , name : String
    , names : List Name
    , versionGroup : NamedApiResource
    }


{-| -}
decodeVersion : Decoder Version
decodeVersion =
    decode Version
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "version_group" decodeNamedApiResource


{-| -}
type alias VersionEncounterDetail =
    { version : NamedApiResource
    , maxChance : Int
    , encounterDetails : List Encounter
    }


{-| -}
decodeVersionEncounterDetail : Decoder VersionEncounterDetail
decodeVersionEncounterDetail =
    decode VersionEncounterDetail
        |> required "version" decodeNamedApiResource
        |> required "max_chance" int
        |> required "encounter_details" (list decodeEncounter)


{-| -}
type alias VersionGameIndex =
    { gameIndex : Int
    , version : NamedApiResource
    }


{-| -}
decodeVersionGameIndex : Decoder VersionGameIndex
decodeVersionGameIndex =
    decode VersionGameIndex
        |> required "game_index" int
        |> required "version" decodeNamedApiResource


{-| -}
type alias VersionGroup =
    { id : Int
    , name : String
    , order : Int
    , generation : NamedApiResource
    , moveLearnMethods : List NamedApiResource
    , pokedexes : List NamedApiResource
    , regions : List NamedApiResource
    , versions : List NamedApiResource
    }


{-| -}
decodeVersionGroup : Decoder VersionGroup
decodeVersionGroup =
    decode VersionGroup
        |> required "id" int
        |> required "name" string
        |> required "order" int
        |> required "generation" decodeNamedApiResource
        |> required "move_learn_methods"
            (list decodeNamedApiResource)
        |> required "pokedexes"
            (list decodeNamedApiResource)
        |> required "regions"
            (list decodeNamedApiResource)
        |> required "versions"
            (list decodeNamedApiResource)


{-| -}
type alias VersionGroupFlavorText =
    { text : String
    , language : NamedApiResource
    , versionGroup : NamedApiResource
    }


{-| -}
decodeVersionGroupFlavorText : Decoder VersionGroupFlavorText
decodeVersionGroupFlavorText =
    decode VersionGroupFlavorText
        |> required "text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource
