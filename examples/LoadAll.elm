module LoadAll exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import PokeApi exposing (..)
import PokeApi.Tasks exposing (..)
import Task exposing (..)


main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { abilities : Maybe (Result Http.Error ApiResourceList)
    , berries : Maybe (Result Http.Error ApiResourceList)
    , berryFirmnesses : Maybe (Result Http.Error ApiResourceList)
    , berryFlavors : Maybe (Result Http.Error ApiResourceList)
    , characteristics : Maybe (Result Http.Error ApiResourceList)
    , contestEffects : Maybe (Result Http.Error ApiResourceList)
    , contestTypes : Maybe (Result Http.Error ApiResourceList)
    , eggGroups : Maybe (Result Http.Error ApiResourceList)
    , encounterConditions : Maybe (Result Http.Error ApiResourceList)
    , encounterConditionValues : Maybe (Result Http.Error ApiResourceList)
    , encounterMethods : Maybe (Result Http.Error ApiResourceList)
    , evolutionChains : Maybe (Result Http.Error ApiResourceList)
    , evolutionTriggers : Maybe (Result Http.Error ApiResourceList)
    , genders : Maybe (Result Http.Error ApiResourceList)
    , generations : Maybe (Result Http.Error ApiResourceList)
    , growthRates : Maybe (Result Http.Error ApiResourceList)
    , items : Maybe (Result Http.Error ApiResourceList)
    , itemAttributes : Maybe (Result Http.Error ApiResourceList)
    , itemCategories : Maybe (Result Http.Error ApiResourceList)
    , itemFlingEffects : Maybe (Result Http.Error ApiResourceList)
    , itemPockets : Maybe (Result Http.Error ApiResourceList)
    , languages : Maybe (Result Http.Error ApiResourceList)
    , locations : Maybe (Result Http.Error ApiResourceList)
    , locationAreas : Maybe (Result Http.Error ApiResourceList)
    , machines : Maybe (Result Http.Error ApiResourceList)
    , moves : Maybe (Result Http.Error ApiResourceList)
    , moveAilments : Maybe (Result Http.Error ApiResourceList)
    , moveBattleStyles : Maybe (Result Http.Error ApiResourceList)
    , moveCategories : Maybe (Result Http.Error ApiResourceList)
    , moveDamageClasses : Maybe (Result Http.Error ApiResourceList)
    , moveLearnMethods : Maybe (Result Http.Error ApiResourceList)
    , moveTargets : Maybe (Result Http.Error ApiResourceList)
    , natures : Maybe (Result Http.Error ApiResourceList)
    , palParkAreas : Maybe (Result Http.Error ApiResourceList)
    , pokeathlonStats : Maybe (Result Http.Error ApiResourceList)
    , pokedexes : Maybe (Result Http.Error ApiResourceList)
    , pokemon : Maybe (Result Http.Error ApiResourceList)
    , pokemonColors : Maybe (Result Http.Error ApiResourceList)
    , pokemonForms : Maybe (Result Http.Error ApiResourceList)
    , pokemonHabitats : Maybe (Result Http.Error ApiResourceList)
    , pokemonShapes : Maybe (Result Http.Error ApiResourceList)
    , pokemonSpecies : Maybe (Result Http.Error ApiResourceList)
    , regions : Maybe (Result Http.Error ApiResourceList)
    , stats : Maybe (Result Http.Error ApiResourceList)
    , superContestEffects : Maybe (Result Http.Error ApiResourceList)
    , types : Maybe (Result Http.Error ApiResourceList)
    , versions : Maybe (Result Http.Error ApiResourceList)
    , versionGroups : Maybe (Result Http.Error ApiResourceList)
    , ability : Maybe (Result Http.Error Ability)
    , berry : Maybe (Result Http.Error Berry)
    , berryFirmness : Maybe (Result Http.Error BerryFirmness)
    , berryFlavor : Maybe (Result Http.Error BerryFlavor)
    , characteristic : Maybe (Result Http.Error Characteristic)
    , contestEffect : Maybe (Result Http.Error ContestEffect)
    , contestType : Maybe (Result Http.Error ContestType)
    , eggGroup : Maybe (Result Http.Error EggGroup)
    , encounterCondition : Maybe (Result Http.Error EncounterCondition)
    , encounterConditionValue : Maybe (Result Http.Error EncounterConditionValue)
    , encounterMethod : Maybe (Result Http.Error EncounterMethod)
    , evolutionChain : Maybe (Result Http.Error EvolutionChain)
    , evolutionTrigger : Maybe (Result Http.Error EvolutionTrigger)
    , gender : Maybe (Result Http.Error Gender)
    , generation : Maybe (Result Http.Error Generation)
    , growthRate : Maybe (Result Http.Error GrowthRate)
    , item : Maybe (Result Http.Error Item)
    , itemAttribute : Maybe (Result Http.Error ItemAttribute)
    , itemCategory : Maybe (Result Http.Error ItemCategory)
    , itemFlingEffect : Maybe (Result Http.Error ItemFlingEffect)
    , itemPocket : Maybe (Result Http.Error ItemPocket)
    , language : Maybe (Result Http.Error Language)
    , location : Maybe (Result Http.Error Location)
    , locationArea : Maybe (Result Http.Error LocationArea)
    , machine : Maybe (Result Http.Error Machine)
    , move : Maybe (Result Http.Error Move)
    , moveAilment : Maybe (Result Http.Error MoveAilment)
    , moveBattleStyle : Maybe (Result Http.Error MoveBattleStyle)
    , moveCategory : Maybe (Result Http.Error MoveCategory)
    , moveDamageClass : Maybe (Result Http.Error MoveDamageClass)
    , moveLearnMethod : Maybe (Result Http.Error MoveLearnMethod)
    , moveTarget : Maybe (Result Http.Error MoveTarget)
    , nature : Maybe (Result Http.Error Nature)
    , palParkArea : Maybe (Result Http.Error PalParkArea)
    , pokeathlonStat : Maybe (Result Http.Error PokeathlonStat)
    , pokedex : Maybe (Result Http.Error Pokedex)
    , pokemon_ : Maybe (Result Http.Error Pokemon)
    , pokemonColor : Maybe (Result Http.Error PokemonColor)
    , pokemonForm : Maybe (Result Http.Error PokemonForm)
    , pokemonHabitat : Maybe (Result Http.Error PokemonHabitat)
    , pokemonShape : Maybe (Result Http.Error PokemonShape)
    , pokemonSpecies_ : Maybe (Result Http.Error PokemonSpecies)
    , region : Maybe (Result Http.Error Region)
    , stat : Maybe (Result Http.Error Stat)
    , superContestEffect : Maybe (Result Http.Error SuperContestEffect)
    , type_ : Maybe (Result Http.Error Type)
    , version : Maybe (Result Http.Error Version)
    , versionGroup : Maybe (Result Http.Error VersionGroup)
    }


init : ( Model, Cmd Msg )
init =
    ( { abilities = Nothing
      , berries = Nothing
      , berryFirmnesses = Nothing
      , berryFlavors = Nothing
      , characteristics = Nothing
      , contestEffects = Nothing
      , contestTypes = Nothing
      , eggGroups = Nothing
      , encounterConditions = Nothing
      , encounterConditionValues = Nothing
      , encounterMethods = Nothing
      , evolutionChains = Nothing
      , evolutionTriggers = Nothing
      , genders = Nothing
      , generations = Nothing
      , growthRates = Nothing
      , items = Nothing
      , itemAttributes = Nothing
      , itemCategories = Nothing
      , itemFlingEffects = Nothing
      , itemPockets = Nothing
      , languages = Nothing
      , locations = Nothing
      , locationAreas = Nothing
      , machines = Nothing
      , moves = Nothing
      , moveAilments = Nothing
      , moveBattleStyles = Nothing
      , moveCategories = Nothing
      , moveDamageClasses = Nothing
      , moveLearnMethods = Nothing
      , moveTargets = Nothing
      , natures = Nothing
      , palParkAreas = Nothing
      , pokeathlonStats = Nothing
      , pokedexes = Nothing
      , pokemon = Nothing
      , pokemonColors = Nothing
      , pokemonForms = Nothing
      , pokemonHabitats = Nothing
      , pokemonShapes = Nothing
      , pokemonSpecies = Nothing
      , regions = Nothing
      , stats = Nothing
      , superContestEffects = Nothing
      , types = Nothing
      , versions = Nothing
      , versionGroups = Nothing
      , ability = Nothing
      , berry = Nothing
      , berryFirmness = Nothing
      , berryFlavor = Nothing
      , characteristic = Nothing
      , contestEffect = Nothing
      , contestType = Nothing
      , eggGroup = Nothing
      , encounterCondition = Nothing
      , encounterConditionValue = Nothing
      , encounterMethod = Nothing
      , evolutionChain = Nothing
      , evolutionTrigger = Nothing
      , gender = Nothing
      , generation = Nothing
      , growthRate = Nothing
      , item = Nothing
      , itemAttribute = Nothing
      , itemCategory = Nothing
      , itemFlingEffect = Nothing
      , itemPocket = Nothing
      , language = Nothing
      , location = Nothing
      , locationArea = Nothing
      , machine = Nothing
      , move = Nothing
      , moveAilment = Nothing
      , moveBattleStyle = Nothing
      , moveCategory = Nothing
      , moveDamageClass = Nothing
      , moveLearnMethod = Nothing
      , moveTarget = Nothing
      , nature = Nothing
      , palParkArea = Nothing
      , pokeathlonStat = Nothing
      , pokedex = Nothing
      , pokemon_ = Nothing
      , pokemonColor = Nothing
      , pokemonForm = Nothing
      , pokemonHabitat = Nothing
      , pokemonShape = Nothing
      , pokemonSpecies_ = Nothing
      , region = Nothing
      , stat = Nothing
      , superContestEffect = Nothing
      , type_ = Nothing
      , version = Nothing
      , versionGroup = Nothing
      }
    , Cmd.none
    )


hit list =
    case list of
        [] ->
            Task.succeed []

        task :: tasks ->
            task
                |> Task.andThen (\resp -> Task.map ((::) resp) (hit tasks))


type Msg
    = TestAllClicked
    | ReceivedAbilities (Result Http.Error ApiResourceList)
    | ReceivedBerries (Result Http.Error ApiResourceList)
    | ReceivedBerryFirmnesses (Result Http.Error ApiResourceList)
    | ReceivedBerryFlavors (Result Http.Error ApiResourceList)
    | ReceivedCharacteristics (Result Http.Error ApiResourceList)
    | ReceivedContestEffects (Result Http.Error ApiResourceList)
    | ReceivedContestTypes (Result Http.Error ApiResourceList)
    | ReceivedEggGroups (Result Http.Error ApiResourceList)
    | ReceivedEncounterConditions (Result Http.Error ApiResourceList)
    | ReceivedEncounterConditionValues (Result Http.Error ApiResourceList)
    | ReceivedEncounterMethods (Result Http.Error ApiResourceList)
    | ReceivedEvolutionChains (Result Http.Error ApiResourceList)
    | ReceivedEvolutionTriggers (Result Http.Error ApiResourceList)
    | ReceivedGenders (Result Http.Error ApiResourceList)
    | ReceivedGenerations (Result Http.Error ApiResourceList)
    | ReceivedGrowthRates (Result Http.Error ApiResourceList)
    | ReceivedItems (Result Http.Error ApiResourceList)
    | ReceivedItemAttributes (Result Http.Error ApiResourceList)
    | ReceivedItemCategories (Result Http.Error ApiResourceList)
    | ReceivedItemFlingEffects (Result Http.Error ApiResourceList)
    | ReceivedItemPockets (Result Http.Error ApiResourceList)
    | ReceivedLanguages (Result Http.Error ApiResourceList)
    | ReceivedLocations (Result Http.Error ApiResourceList)
    | ReceivedLocationAreas (Result Http.Error ApiResourceList)
    | ReceivedMachines (Result Http.Error ApiResourceList)
    | ReceivedMoves (Result Http.Error ApiResourceList)
    | ReceivedMoveAilments (Result Http.Error ApiResourceList)
    | ReceivedMoveBattleStyles (Result Http.Error ApiResourceList)
    | ReceivedMoveCategories (Result Http.Error ApiResourceList)
    | ReceivedMoveDamageClasses (Result Http.Error ApiResourceList)
    | ReceivedMoveLearnMethods (Result Http.Error ApiResourceList)
    | ReceivedMoveTargets (Result Http.Error ApiResourceList)
    | ReceivedNatures (Result Http.Error ApiResourceList)
    | ReceivedPalParkAreas (Result Http.Error ApiResourceList)
    | ReceivedPokeathlonStats (Result Http.Error ApiResourceList)
    | ReceivedPokedexes (Result Http.Error ApiResourceList)
    | ReceivedPokemon (Result Http.Error ApiResourceList)
    | ReceivedPokemonColors (Result Http.Error ApiResourceList)
    | ReceivedPokemonForms (Result Http.Error ApiResourceList)
    | ReceivedPokemonHabitats (Result Http.Error ApiResourceList)
    | ReceivedPokemonShapes (Result Http.Error ApiResourceList)
    | ReceivedPokemonSpecies (Result Http.Error ApiResourceList)
    | ReceivedRegions (Result Http.Error ApiResourceList)
    | ReceivedStats (Result Http.Error ApiResourceList)
    | ReceivedSuperContestEffects (Result Http.Error ApiResourceList)
    | ReceivedTypes (Result Http.Error ApiResourceList)
    | ReceivedVersions (Result Http.Error ApiResourceList)
    | ReceivedVersionGroups (Result Http.Error ApiResourceList)
    | ReceivedAbility (Result Http.Error Ability)
    | ReceivedBerry (Result Http.Error Berry)
    | ReceivedBerryFirmness (Result Http.Error BerryFirmness)
    | ReceivedBerryFlavor (Result Http.Error BerryFlavor)
    | ReceivedCharacteristic (Result Http.Error Characteristic)
    | ReceivedContestEffect (Result Http.Error ContestEffect)
    | ReceivedContestType (Result Http.Error ContestType)
    | ReceivedEggGroup (Result Http.Error EggGroup)
    | ReceivedEncounterCondition (Result Http.Error EncounterCondition)
    | ReceivedEncounterConditionValue (Result Http.Error EncounterConditionValue)
    | ReceivedEncounterMethod (Result Http.Error EncounterMethod)
    | ReceivedEvolutionChain (Result Http.Error EvolutionChain)
    | ReceivedEvolutionTrigger (Result Http.Error EvolutionTrigger)
    | ReceivedGender (Result Http.Error Gender)
    | ReceivedGeneration (Result Http.Error Generation)
    | ReceivedGrowthRate (Result Http.Error GrowthRate)
    | ReceivedItem (Result Http.Error Item)
    | ReceivedItemAttribute (Result Http.Error ItemAttribute)
    | ReceivedItemCategory (Result Http.Error ItemCategory)
    | ReceivedItemFlingEffect (Result Http.Error ItemFlingEffect)
    | ReceivedItemPocket (Result Http.Error ItemPocket)
    | ReceivedLanguage (Result Http.Error Language)
    | ReceivedLocation (Result Http.Error Location)
    | ReceivedLocationArea (Result Http.Error LocationArea)
    | ReceivedMachine (Result Http.Error Machine)
    | ReceivedMove (Result Http.Error Move)
    | ReceivedMoveAilment (Result Http.Error MoveAilment)
    | ReceivedMoveBattleStyle (Result Http.Error MoveBattleStyle)
    | ReceivedMoveCategory (Result Http.Error MoveCategory)
    | ReceivedMoveDamageClass (Result Http.Error MoveDamageClass)
    | ReceivedMoveLearnMethod (Result Http.Error MoveLearnMethod)
    | ReceivedMoveTarget (Result Http.Error MoveTarget)
    | ReceivedNature (Result Http.Error Nature)
    | ReceivedPalParkArea (Result Http.Error PalParkArea)
    | ReceivedPokeathlonStat (Result Http.Error PokeathlonStat)
    | ReceivedPokedex (Result Http.Error Pokedex)
    | ReceivedPokemon_ (Result Http.Error Pokemon)
    | ReceivedPokemonColor (Result Http.Error PokemonColor)
    | ReceivedPokemonForm (Result Http.Error PokemonForm)
    | ReceivedPokemonHabitat (Result Http.Error PokemonHabitat)
    | ReceivedPokemonShape (Result Http.Error PokemonShape)
    | ReceivedPokemonSpecies_ (Result Http.Error PokemonSpecies)
    | ReceivedRegion (Result Http.Error Region)
    | ReceivedStat (Result Http.Error Stat)
    | ReceivedSuperContestEffect (Result Http.Error SuperContestEffect)
    | ReceivedType (Result Http.Error Type)
    | ReceivedVersion (Result Http.Error Version)
    | ReceivedVersionGroup (Result Http.Error VersionGroup)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TestAllClicked ->
            ( model
            , Cmd.batch
                [ getResourceList Ability_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedAbilities
                , getResourceList Berry_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedBerries
                , getResourceList BerryFirmness_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedBerryFirmnesses
                , getResourceList BerryFlavor_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedBerryFlavors
                , getResourceList Characteristic_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedCharacteristics
                , getResourceList ContestEffect_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedContestEffects
                , getResourceList ContestType_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedContestTypes
                , getResourceList EggGroup_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedEggGroups
                , getResourceList EncounterCondition_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedEncounterConditions
                , getResourceList EncounterConditionValue_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedEncounterConditionValues
                , getResourceList EncounterMethod_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedEncounterMethods
                , getResourceList EvolutionChain_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedEvolutionChains
                , getResourceList EvolutionTrigger_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedEvolutionTriggers
                , getResourceList Gender_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedGenders
                , getResourceList Generation_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedGenerations
                , getResourceList GrowthRate_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedGrowthRates
                , getResourceList Item_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedItems
                , getResourceList ItemAttribute_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedItemAttributes
                , getResourceList ItemCategory_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedItemCategories
                , getResourceList ItemFlingEffect_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedItemFlingEffects
                , getResourceList ItemPocket_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedItemPockets
                , getResourceList Language_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedLanguages
                , getResourceList Location_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedLocations
                , getResourceList LocationArea_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedLocationAreas
                , getResourceList Machine_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedMachines
                , getResourceList Move_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedMoves
                , getResourceList MoveAilment_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedMoveAilments
                , getResourceList MoveBattleStyle_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedMoveBattleStyles
                , getResourceList MoveCategory_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedMoveCategories
                , getResourceList MoveDamageClass_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedMoveDamageClasses
                , getResourceList MoveLearnMethod_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedMoveLearnMethods
                , getResourceList MoveTarget_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedMoveTargets
                , getResourceList Nature_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedNatures
                , getResourceList PalParkArea_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPalParkAreas
                , getResourceList PokeathlonStat_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPokeathlonStats
                , getResourceList Pokedex_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPokedexes
                , getResourceList Pokemon_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPokemon
                , getResourceList PokemonColor_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPokemonColors
                , getResourceList PokemonForm_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPokemonForms
                , getResourceList PokemonHabitat_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPokemonHabitats
                , getResourceList PokemonShape_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPokemonShapes
                , getResourceList PokemonSpecies_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedPokemonSpecies
                , getResourceList Region_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedRegions
                , getResourceList Stat_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedStats
                , getResourceList SuperContestEffect_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedSuperContestEffects
                , getResourceList Type_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedTypes
                , getResourceList Version_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedVersions
                , getResourceList VersionGroup_ (onPageOfSize 1 1000)
                    |> Task.attempt ReceivedVersionGroups
                , getAbilityBy (idOf 1)
                    |> Task.attempt ReceivedAbility
                , getBerryBy (idOf 1)
                    |> Task.attempt ReceivedBerry
                , getBerryFirmnessBy (idOf 1)
                    |> Task.attempt ReceivedBerryFirmness
                , getBerryFlavorBy (idOf 1)
                    |> Task.attempt ReceivedBerryFlavor
                , getCharacteristicBy (idOf 1)
                    |> Task.attempt ReceivedCharacteristic
                , getContestEffectBy (idOf 1)
                    |> Task.attempt ReceivedContestEffect
                , getContestTypeBy (idOf 1)
                    |> Task.attempt ReceivedContestType
                , getEggGroupBy (idOf 1)
                    |> Task.attempt ReceivedEggGroup
                , getEncounterConditionBy (idOf 1)
                    |> Task.attempt ReceivedEncounterCondition
                , getEncounterConditionValueBy (idOf 1)
                    |> Task.attempt ReceivedEncounterConditionValue
                , getEncounterMethodBy (idOf 1)
                    |> Task.attempt ReceivedEncounterMethod
                , getEvolutionChainBy (idOf 1)
                    |> Task.attempt ReceivedEvolutionChain
                , getEvolutionTriggerBy (idOf 1)
                    |> Task.attempt ReceivedEvolutionTrigger
                , getGenderBy (idOf 1)
                    |> Task.attempt ReceivedGender
                , getGenerationBy (idOf 1)
                    |> Task.attempt ReceivedGeneration
                , getGrowthRateBy (idOf 1)
                    |> Task.attempt ReceivedGrowthRate
                , getItemBy (idOf 1)
                    |> Task.attempt ReceivedItem
                , getItemAttributeBy (idOf 1)
                    |> Task.attempt ReceivedItemAttribute
                , getItemCategoryBy (idOf 1)
                    |> Task.attempt ReceivedItemCategory
                , getItemFlingEffectBy (idOf 1)
                    |> Task.attempt ReceivedItemFlingEffect
                , getItemPocketBy (idOf 1)
                    |> Task.attempt ReceivedItemPocket
                , getLanguageBy (idOf 1)
                    |> Task.attempt ReceivedLanguage
                , getLocationBy (idOf 1)
                    |> Task.attempt ReceivedLocation
                , getLocationAreaBy (idOf 1)
                    |> Task.attempt ReceivedLocationArea
                , getMachineBy (idOf 1)
                    |> Task.attempt ReceivedMachine
                , getMoveBy (idOf 1)
                    |> Task.attempt ReceivedMove
                , getMoveAilmentBy (idOf 1)
                    |> Task.attempt ReceivedMoveAilment
                , getMoveBattleStyleBy (idOf 1)
                    |> Task.attempt ReceivedMoveBattleStyle
                , getMoveCategoryBy (idOf 1)
                    |> Task.attempt ReceivedMoveCategory
                , getMoveDamageClassBy (idOf 1)
                    |> Task.attempt ReceivedMoveDamageClass
                , getMoveLearnMethodBy (idOf 1)
                    |> Task.attempt ReceivedMoveLearnMethod
                , getMoveTargetBy (idOf 1)
                    |> Task.attempt ReceivedMoveTarget
                , getNatureBy (idOf 1)
                    |> Task.attempt ReceivedNature
                , getPalParkAreaBy (idOf 1)
                    |> Task.attempt ReceivedPalParkArea
                , getPokeathlonStatBy (idOf 1)
                    |> Task.attempt ReceivedPokeathlonStat
                , getPokedexBy (idOf 1)
                    |> Task.attempt ReceivedPokedex
                , getPokemonBy (idOf 1)
                    |> Task.attempt ReceivedPokemon_
                , getPokemonColorBy (idOf 1)
                    |> Task.attempt ReceivedPokemonColor
                , getPokemonFormBy (idOf 1)
                    |> Task.attempt ReceivedPokemonForm
                , getPokemonHabitatBy (idOf 1)
                    |> Task.attempt ReceivedPokemonHabitat
                , getPokemonShapeBy (idOf 1)
                    |> Task.attempt ReceivedPokemonShape
                , getPokemonSpeciesBy (idOf 1)
                    |> Task.attempt ReceivedPokemonSpecies_
                , getRegionBy (idOf 1)
                    |> Task.attempt ReceivedRegion
                , getStatBy (idOf 1)
                    |> Task.attempt ReceivedStat
                , getSuperContestEffectBy (idOf 1)
                    |> Task.attempt ReceivedSuperContestEffect
                , getTypeBy (idOf 1)
                    |> Task.attempt ReceivedType
                , getVersionBy (idOf 1)
                    |> Task.attempt ReceivedVersion
                , getVersionGroupBy (idOf 1)
                    |> Task.attempt ReceivedVersionGroup
                ]
            )

        ReceivedAbilities result ->
            ( { model | abilities = Just result }, Cmd.none )

        ReceivedBerries result ->
            ( { model | berries = Just result }, Cmd.none )

        ReceivedBerryFirmnesses result ->
            ( { model | berryFirmnesses = Just result }, Cmd.none )

        ReceivedBerryFlavors result ->
            ( { model | berryFlavors = Just result }, Cmd.none )

        ReceivedCharacteristics result ->
            ( { model | characteristics = Just result }, Cmd.none )

        ReceivedContestEffects result ->
            ( { model | contestEffects = Just result }, Cmd.none )

        ReceivedContestTypes result ->
            ( { model | contestTypes = Just result }, Cmd.none )

        ReceivedEggGroups result ->
            ( { model | eggGroups = Just result }, Cmd.none )

        ReceivedEncounterConditions result ->
            ( { model | encounterConditions = Just result }, Cmd.none )

        ReceivedEncounterConditionValues result ->
            ( { model | encounterConditionValues = Just result }, Cmd.none )

        ReceivedEncounterMethods result ->
            ( { model | encounterMethods = Just result }, Cmd.none )

        ReceivedEvolutionChains result ->
            ( { model | evolutionChains = Just result }, Cmd.none )

        ReceivedEvolutionTriggers result ->
            ( { model | evolutionTriggers = Just result }, Cmd.none )

        ReceivedGenders result ->
            ( { model | genders = Just result }, Cmd.none )

        ReceivedGenerations result ->
            ( { model | generations = Just result }, Cmd.none )

        ReceivedGrowthRates result ->
            ( { model | growthRates = Just result }, Cmd.none )

        ReceivedItems result ->
            ( { model | items = Just result }, Cmd.none )

        ReceivedItemAttributes result ->
            ( { model | itemAttributes = Just result }, Cmd.none )

        ReceivedItemCategories result ->
            ( { model | itemCategories = Just result }, Cmd.none )

        ReceivedItemFlingEffects result ->
            ( { model | itemFlingEffects = Just result }, Cmd.none )

        ReceivedItemPockets result ->
            ( { model | itemPockets = Just result }, Cmd.none )

        ReceivedLanguages result ->
            ( { model | languages = Just result }, Cmd.none )

        ReceivedLocations result ->
            ( { model | locations = Just result }, Cmd.none )

        ReceivedLocationAreas result ->
            ( { model | locationAreas = Just result }, Cmd.none )

        ReceivedMachines result ->
            ( { model | machines = Just result }, Cmd.none )

        ReceivedMoves result ->
            ( { model | moves = Just result }, Cmd.none )

        ReceivedMoveAilments result ->
            ( { model | moveAilments = Just result }, Cmd.none )

        ReceivedMoveBattleStyles result ->
            ( { model | moveBattleStyles = Just result }, Cmd.none )

        ReceivedMoveCategories result ->
            ( { model | moveCategories = Just result }, Cmd.none )

        ReceivedMoveDamageClasses result ->
            ( { model | moveDamageClasses = Just result }, Cmd.none )

        ReceivedMoveLearnMethods result ->
            ( { model | moveLearnMethods = Just result }, Cmd.none )

        ReceivedMoveTargets result ->
            ( { model | moveTargets = Just result }, Cmd.none )

        ReceivedNatures result ->
            ( { model | natures = Just result }, Cmd.none )

        ReceivedPalParkAreas result ->
            ( { model | palParkAreas = Just result }, Cmd.none )

        ReceivedPokeathlonStats result ->
            ( { model | pokeathlonStats = Just result }, Cmd.none )

        ReceivedPokedexes result ->
            ( { model | pokedexes = Just result }, Cmd.none )

        ReceivedPokemon result ->
            ( { model | pokemon = Just result }, Cmd.none )

        ReceivedPokemonColors result ->
            ( { model | pokemonColors = Just result }, Cmd.none )

        ReceivedPokemonForms result ->
            ( { model | pokemonForms = Just result }, Cmd.none )

        ReceivedPokemonHabitats result ->
            ( { model | pokemonHabitats = Just result }, Cmd.none )

        ReceivedPokemonShapes result ->
            ( { model | pokemonShapes = Just result }, Cmd.none )

        ReceivedPokemonSpecies result ->
            ( { model | pokemonSpecies = Just result }, Cmd.none )

        ReceivedRegions result ->
            ( { model | regions = Just result }, Cmd.none )

        ReceivedStats result ->
            ( { model | stats = Just result }, Cmd.none )

        ReceivedSuperContestEffects result ->
            ( { model | superContestEffects = Just result }, Cmd.none )

        ReceivedTypes result ->
            ( { model | types = Just result }, Cmd.none )

        ReceivedVersions result ->
            ( { model | versions = Just result }, Cmd.none )

        ReceivedVersionGroups result ->
            ( { model | versionGroups = Just result }, Cmd.none )

        ReceivedAbility result ->
            ( { model | ability = Just result }, Cmd.none )

        ReceivedBerry result ->
            ( { model | berry = Just result }, Cmd.none )

        ReceivedBerryFirmness result ->
            ( { model | berryFirmness = Just result }, Cmd.none )

        ReceivedBerryFlavor result ->
            ( { model | berryFlavor = Just result }, Cmd.none )

        ReceivedCharacteristic result ->
            ( { model | characteristic = Just result }, Cmd.none )

        ReceivedContestEffect result ->
            ( { model | contestEffect = Just result }, Cmd.none )

        ReceivedContestType result ->
            ( { model | contestType = Just result }, Cmd.none )

        ReceivedEggGroup result ->
            ( { model | eggGroup = Just result }, Cmd.none )

        ReceivedEncounterCondition result ->
            ( { model | encounterCondition = Just result }, Cmd.none )

        ReceivedEncounterConditionValue result ->
            ( { model | encounterConditionValue = Just result }, Cmd.none )

        ReceivedEncounterMethod result ->
            ( { model | encounterMethod = Just result }, Cmd.none )

        ReceivedEvolutionChain result ->
            ( { model | evolutionChain = Just result }, Cmd.none )

        ReceivedEvolutionTrigger result ->
            ( { model | evolutionTrigger = Just result }, Cmd.none )

        ReceivedGender result ->
            ( { model | gender = Just result }, Cmd.none )

        ReceivedGeneration result ->
            ( { model | generation = Just result }, Cmd.none )

        ReceivedGrowthRate result ->
            ( { model | growthRate = Just result }, Cmd.none )

        ReceivedItem result ->
            ( { model | item = Just result }, Cmd.none )

        ReceivedItemAttribute result ->
            ( { model | itemAttribute = Just result }, Cmd.none )

        ReceivedItemCategory result ->
            ( { model | itemCategory = Just result }, Cmd.none )

        ReceivedItemFlingEffect result ->
            ( { model | itemFlingEffect = Just result }, Cmd.none )

        ReceivedItemPocket result ->
            ( { model | itemPocket = Just result }, Cmd.none )

        ReceivedLanguage result ->
            ( { model | language = Just result }, Cmd.none )

        ReceivedLocation result ->
            ( { model | location = Just result }, Cmd.none )

        ReceivedLocationArea result ->
            ( { model | locationArea = Just result }, Cmd.none )

        ReceivedMachine result ->
            ( { model | machine = Just result }, Cmd.none )

        ReceivedMove result ->
            ( { model | move = Just result }, Cmd.none )

        ReceivedMoveAilment result ->
            ( { model | moveAilment = Just result }, Cmd.none )

        ReceivedMoveBattleStyle result ->
            ( { model | moveBattleStyle = Just result }, Cmd.none )

        ReceivedMoveCategory result ->
            ( { model | moveCategory = Just result }, Cmd.none )

        ReceivedMoveDamageClass result ->
            ( { model | moveDamageClass = Just result }, Cmd.none )

        ReceivedMoveLearnMethod result ->
            ( { model | moveLearnMethod = Just result }, Cmd.none )

        ReceivedMoveTarget result ->
            ( { model | moveTarget = Just result }, Cmd.none )

        ReceivedNature result ->
            ( { model | nature = Just result }, Cmd.none )

        ReceivedPalParkArea result ->
            ( { model | palParkArea = Just result }, Cmd.none )

        ReceivedPokeathlonStat result ->
            ( { model | pokeathlonStat = Just result }, Cmd.none )

        ReceivedPokedex result ->
            ( { model | pokedex = Just result }, Cmd.none )

        ReceivedPokemon_ result ->
            ( { model | pokemon_ = Just result }, Cmd.none )

        ReceivedPokemonColor result ->
            ( { model | pokemonColor = Just result }, Cmd.none )

        ReceivedPokemonForm result ->
            ( { model | pokemonForm = Just result }, Cmd.none )

        ReceivedPokemonHabitat result ->
            ( { model | pokemonHabitat = Just result }, Cmd.none )

        ReceivedPokemonShape result ->
            ( { model | pokemonShape = Just result }, Cmd.none )

        ReceivedPokemonSpecies_ result ->
            ( { model | pokemonSpecies_ = Just result }, Cmd.none )

        ReceivedRegion result ->
            ( { model | region = Just result }, Cmd.none )

        ReceivedStat result ->
            ( { model | stat = Just result }, Cmd.none )

        ReceivedSuperContestEffect result ->
            ( { model | superContestEffect = Just result }, Cmd.none )

        ReceivedType result ->
            ( { model | type_ = Just result }, Cmd.none )

        ReceivedVersion result ->
            ( { model | version = Just result }, Cmd.none )

        ReceivedVersionGroup result ->
            ( { model | versionGroup = Just result }, Cmd.none )


view : Model -> Html Msg
view model =
    div
        []
        [ ul []
            [ viewLoadStatus "List Ability" model.abilities
            , viewLoadStatus "List Berry" model.berries
            , viewLoadStatus "List Berry Firmess" model.berryFirmnesses
            , viewLoadStatus "List Berry Flavor" model.berryFlavors
            , viewLoadStatus "List Characteristic" model.characteristics
            , viewLoadStatus "List Contest Effect" model.contestEffects
            , viewLoadStatus "List Contest Type" model.contestTypes
            , viewLoadStatus "List Egg Group" model.eggGroups
            , viewLoadStatus "List Encounter Condition" model.encounterConditions
            , viewLoadStatus "List Encounter Condition Value" model.encounterConditionValues
            , viewLoadStatus "List Encounter Method" model.encounterMethods
            , viewLoadStatus "List Evolution Chain" model.evolutionChains
            , viewLoadStatus "List Evolution Trigger" model.evolutionTriggers
            , viewLoadStatus "List Gender" model.genders
            , viewLoadStatus "List Generation" model.generations
            , viewLoadStatus "List Growth Rate" model.growthRates
            , viewLoadStatus "List Item" model.items
            , viewLoadStatus "List Item Attribute" model.itemAttributes
            , viewLoadStatus "List Item Category" model.itemCategories
            , viewLoadStatus "List Item Fling Effect" model.itemFlingEffects
            , viewLoadStatus "List Item Pocket" model.itemPockets
            , viewLoadStatus "List Language" model.languages
            , viewLoadStatus "List Location" model.locations
            , viewLoadStatus "List Location Area" model.locationAreas
            , viewLoadStatus "List Machine" model.machines
            , viewLoadStatus "List Move" model.moves
            , viewLoadStatus "List Move Ailment" model.moveAilments
            , viewLoadStatus "List Move Battle Style" model.moveBattleStyles
            , viewLoadStatus "List Move Category" model.moveCategories
            , viewLoadStatus "List Move Damage Class" model.moveDamageClasses
            , viewLoadStatus "List Move Learn Method" model.moveLearnMethods
            , viewLoadStatus "List Move Target" model.moveTargets
            , viewLoadStatus "List Nature" model.natures
            , viewLoadStatus "List PalPark Area" model.palParkAreas
            , viewLoadStatus "List Pokeathlon Stat" model.pokeathlonStats
            , viewLoadStatus "List Pokedex" model.pokedexes
            , viewLoadStatus "List Pokemon" model.pokemon
            , viewLoadStatus "List Pokemon Color" model.pokemonColors
            , viewLoadStatus "List Pokemon Form" model.pokemonForms
            , viewLoadStatus "List Pokemon Habitat" model.pokemonHabitats
            , viewLoadStatus "List Pokemon Shape" model.pokemonShapes
            , viewLoadStatus "List Pokemon Species" model.pokemonSpecies
            , viewLoadStatus "List Region" model.regions
            , viewLoadStatus "List Stat" model.stats
            , viewLoadStatus "List Super Contest Effect" model.superContestEffects
            , viewLoadStatus "List Type" model.types
            , viewLoadStatus "List Version" model.versions
            , viewLoadStatus "List Version Group" model.versionGroups
            , viewLoadStatus "Ability" model.ability
            , viewLoadStatus "Berry" model.berry
            , viewLoadStatus "BerryFirmness" model.berryFirmness
            , viewLoadStatus "BerryFlavor" model.berryFlavor
            , viewLoadStatus "Characteristic" model.characteristic
            , viewLoadStatus "ContestEffect" model.contestEffect
            , viewLoadStatus "ContestType" model.contestType
            , viewLoadStatus "EggGroup" model.eggGroup
            , viewLoadStatus "EncounterCondition" model.encounterCondition
            , viewLoadStatus "EncounterConditionValue" model.encounterConditionValue
            , viewLoadStatus "EncounterMethod" model.encounterMethod
            , viewLoadStatus "EvolutionChain" model.evolutionChain
            , viewLoadStatus "EvolutionTrigger" model.evolutionTrigger
            , viewLoadStatus "Gender" model.gender
            , viewLoadStatus "Generation" model.generation
            , viewLoadStatus "GrowthRate" model.growthRate
            , viewLoadStatus "Item" model.item
            , viewLoadStatus "ItemAttribute" model.itemAttribute
            , viewLoadStatus "ItemCategory" model.itemCategory
            , viewLoadStatus "ItemFlingEffect" model.itemFlingEffect
            , viewLoadStatus "ItemPocket" model.itemPocket
            , viewLoadStatus "Language" model.language
            , viewLoadStatus "Location" model.location
            , viewLoadStatus "LocationArea" model.locationArea
            , viewLoadStatus "Machine" model.machine
            , viewLoadStatus "Move" model.move
            , viewLoadStatus "MoveAilment" model.moveAilment
            , viewLoadStatus "MoveBattleStyle" model.moveBattleStyle
            , viewLoadStatus "MoveCategory" model.moveCategory
            , viewLoadStatus "MoveDamageClass" model.moveDamageClass
            , viewLoadStatus "MoveLearnMethod" model.moveLearnMethod
            , viewLoadStatus "MoveTarget" model.moveTarget
            , viewLoadStatus "Nature" model.nature
            , viewLoadStatus "PalParkArea" model.palParkArea
            , viewLoadStatus "PokeathlonStat" model.pokeathlonStat
            , viewLoadStatus "Pokedex" model.pokedex
            , viewLoadStatus "Pokemon" model.pokemon_
            , viewLoadStatus "PokemonColor" model.pokemonColor
            , viewLoadStatus "PokemonForm" model.pokemonForm
            , viewLoadStatus "PokemonHabitat" model.pokemonHabitat
            , viewLoadStatus "PokemonShape" model.pokemonShape
            , viewLoadStatus "PokemonSpecies" model.pokemonSpecies_
            , viewLoadStatus "Region" model.region
            , viewLoadStatus "Stat" model.stat
            , viewLoadStatus "SuperContestEffect" model.superContestEffect
            , viewLoadStatus "Type" model.type_
            , viewLoadStatus "Version" model.version
            , viewLoadStatus "VersionGroup" model.versionGroup
            ]
        , button [ onClick TestAllClicked ] [ text "Test All" ]
        ]


viewLoadStatus : String -> Maybe (Result Http.Error a) -> Html msg
viewLoadStatus str maybeResult =
    case maybeResult of
        Nothing ->
            text ""

        Just result ->
            li []
                [ case result of
                    Ok good ->
                        span
                            [ style
                                [ ( "color", "green" ) ]
                            ]
                            [ text (str ++ ": GOOD") ]

                    Err bad ->
                        span
                            [ style
                                [ ( "color", "red" ) ]
                            ]
                            [ text (str ++ ": BAD") ]
                ]
