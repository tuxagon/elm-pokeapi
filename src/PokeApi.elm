module PokeApi
    exposing
        ( Resource(..)
        , Ability
        , AbilityEffectChange
        , AbilityFlavorText
        , AbilityPokemon
        , ApiResource
        , ApiResourceList
        , ApiUrl(..)
        , ApiListUrl(..)
        , AwesomeName
        , Berry
        , BerryFirmness
        , BerryFlavor
        , BerryFlavorMap
        , ChainLink
        , Evolutions(..)
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
        )

{-| This library is a wrapper for PokeApi (<https://pokeapi.co/>) that provides
you with concrete types to all the applicable models


# General

@docs ApiUrl, ApiListUrl, Resource


# Poke API Models

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
MoveStatAffectSets, MoveStatChange, MoveTarget, Name, Nature, NaturePokeathlonStatAffect,
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


{-| -}
type ApiUrl
    = ApiUrl String


{-| -}
type ApiListUrl
    = ApiListUrl String


{-| -}
type alias Ability =
    { id : Int
    , name : String
    , isMainSeries : Bool
    , generation : ApiResource
    , names : List Name
    , effectEntries : List VerboseEffect
    , effectChanges : List AbilityEffectChange
    , flavorTextEntries : List AbilityFlavorText
    , pokemon : List AbilityPokemon
    }


{-| -}
type alias AbilityEffectChange =
    { effectEntries : List Effect
    , versionGroup : ApiResource
    }


{-| -}
type alias AbilityFlavorText =
    { flavorText : String
    , language : ApiResource
    , versionGroup : ApiResource
    }


{-| -}
type alias AbilityPokemon =
    { isHidden : Bool
    , slot : Int
    , pokemon : ApiResource
    }


{-| -}
type alias ApiResource =
    { name : String
    , url : ApiUrl
    }


{-| -}
type alias ApiResourceList =
    { count : Int
    , next : Maybe ApiListUrl
    , previous : Maybe ApiListUrl
    , results : List ApiResource
    }


{-| -}
type alias AwesomeName =
    { awesomeName : String
    , language : ApiResource
    }


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
    , firmness : ApiResource
    , flavors : List BerryFlavorMap
    , item : ApiResource
    , naturalGiftType : ApiResource
    }


{-| -}
type alias BerryFirmness =
    { id : Int
    , name : String
    , berries : List ApiResource
    , names : List Name
    }


{-| -}
type alias BerryFlavor =
    { id : Int
    , name : String
    , berries : List FlavorBerryMap
    , contestType : ApiResource
    , names : List Name
    }


{-| -}
type alias BerryFlavorMap =
    { potency : Int
    , flavor : ApiResource
    }


{-| -}
type alias ChainLink =
    { isBaby : Bool
    , species : ApiResource
    , evolutionDetails : List EvolutionDetail
    , evolvesTo : Evolutions
    }


{-| -}
type Evolutions
    = Evolutions (List ChainLink)


{-| -}
type alias Characteristic =
    { id : Int
    , geneModulo : Int
    , possibleValues : List Int
    , descriptions : List Description
    }


{-| -}
type alias ContestComboSets =
    { normal : Maybe ContestComboDetail
    , super : Maybe ContestComboDetail
    }


{-| -}
type alias ContestComboDetail =
    { useBefore : Maybe (List ApiResource)
    , useAfter : Maybe (List ApiResource)
    }


{-| -}
type alias ContestEffect =
    { id : Int
    , appeal : Int
    , jam : Int
    , effectEntries : List Effect
    , flavorTextEntries : List FlavorText
    }


{-| -}
type alias ContestName =
    { name : String
    , color : String
    , language : ApiResource
    }


{-| -}
type alias ContestType =
    { id : Int
    , name : String
    , berryFlavor : ApiResource
    , names : List ContestName
    }


{-| -}
type alias Description =
    { description : String
    , language : ApiResource
    }


{-| -}
type alias Effect =
    { effect : String
    , language : ApiResource
    }


{-| -}
type alias EggGroup =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List ApiResource
    }


{-| -}
type alias Encounter =
    { minLevel : Int
    , maxLevel : Int
    , conditionValues : List ApiResource
    , chance : Int
    , method : ApiResource
    }


{-| -}
type alias EncounterCondition =
    { id : Int
    , name : String
    , names : List Name
    , values : List ApiResource
    }


{-| -}
type alias EncounterConditionValue =
    { id : Int
    , name : String
    , condition : ApiResource
    , names : List Name
    }


{-| -}
type alias EncounterMethod =
    { id : Int
    , name : String
    , order : Int
    , names : List Name
    }


{-| -}
type alias EncounterMethodRate =
    { encounterMethod : ApiResource
    , versionDetails : List EncounterVersionDetails
    }


{-| -}
type alias EncounterVersionDetails =
    { rate : Int
    , version : ApiResource
    }


{-| -}
type alias EvolutionChain =
    { id : Int
    , babyTriggerItem : Maybe ApiResource
    , chain : Maybe ChainLink
    }


{-| -}
type alias EvolutionDetail =
    { item : Maybe ApiResource
    , trigger : ApiResource
    , gender : Maybe Int
    , heldItem : Maybe ApiResource
    , knownMove : Maybe ApiResource
    , knownMoveType : Maybe ApiResource
    , location : Maybe ApiResource
    , minLevel : Int
    , minHappiness : Maybe Int
    , minBeauty : Maybe Int
    , minAffection : Maybe Int
    , needsOverworldRain : Bool
    , partySpecies : Maybe ApiResource
    , partyType : Maybe ApiResource
    , relativePhysicalStats : Maybe Int
    , timeOfDay : String
    , tradeSpecies : Maybe ApiResource
    , turnUpsideDown : Bool
    }


{-| -}
type alias EvolutionTrigger =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List ApiResource
    }


{-| -}
type alias FlavorBerryMap =
    { potency : Int
    , berry : ApiResource
    }


{-| -}
type alias FlavorText =
    { flavorText : String
    , language : ApiResource
    }


{-| -}
type alias Generation =
    { id : Int
    , name : String
    , abilities : List ApiResource
    , names : List Name
    , mainRegion : ApiResource
    , moves : List ApiResource
    , pokemonSpecies : List ApiResource
    , types : List ApiResource
    , versionGroups : List ApiResource
    }


{-| -}
type alias Gender =
    { id : Int
    , name : String
    , pokemonSpeciesDetails : List PokemonSpeciesGender
    , requiredForEvolution : List ApiResource
    }


{-| -}
type alias GenerationGameIndex =
    { gameIndex : Int
    , generation : ApiResource
    }


{-| -}
type alias Genus =
    { genus : String
    , language : ApiResource
    }


{-| -}
type alias GrowthRate =
    { id : Int
    , name : String
    , formula : String
    , descriptions : List Description
    , levels : List GrowthRateExperienceLevel
    , pokemonSpecies : List ApiResource
    }


{-| -}
type alias GrowthRateExperienceLevel =
    { level : Int
    , experience : Int
    }


{-| -}
type alias Item =
    { id : Int
    , name : String
    , cost : Int
    , flingPower : Maybe Int
    , flingEffect : Maybe ApiResource
    , attributes : List ApiResource
    , category : ApiResource
    , effectEntries : List VerboseEffect
    , flavorTextEntries : List VersionGroupFlavorText
    , gameIndicies : List GenerationGameIndex
    , names : List Name
    , sprites : ItemSprites
    , heldByPokemon : List ItemHolderPokemon
    , babyTriggerFor : Maybe ApiResource
    , machines : List MachineVersionDetail
    }


{-| -}
type alias ItemAttribute =
    { id : Int
    , name : String
    , items : List ApiResource
    , names : List Name
    , descriptions : List Description
    }


{-| -}
type alias ItemCategory =
    { id : Int
    , name : String
    , items : List ApiResource
    , names : List Name
    , pocket : ApiResource
    }


{-| -}
type alias ItemFlingEffect =
    { id : Int
    , name : String
    , effectEntries : List Effect
    , items : List ApiResource
    }


{-| -}
type alias ItemHolderPokemon =
    { pokemon : ApiResource
    , versionDetails : List ItemHolderPokemonVersionDetail
    }


{-| -}
type alias ItemHolderPokemonVersionDetail =
    { rarity : Int
    , version : ApiResource
    }


{-| -}
type alias ItemPocket =
    { id : Int
    , name : String
    , categories : List ApiResource
    , names : List Name
    }


{-| -}
type alias ItemSprites =
    { default : String
    }


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
type alias Location =
    { id : Int
    , name : String
    , region : ApiResource
    , names : List Name
    , gameIndices : List GenerationGameIndex
    , areas : List ApiResource
    }


{-| -}
type alias LocationArea =
    { id : Int
    , name : String
    , gameIndex : Int
    , encounterMethodRates : List EncounterMethodRate
    , location : ApiResource
    , names : List Name
    , pokemonEncounters : List PokemonEncounter
    }


{-| -}
type alias LocationAreaEncounter =
    { locationArea : ApiResource
    , versionDetails : List VersionEncounterDetail
    }


{-| -}
type alias Machine =
    { id : Int
    , item : ApiResource
    , move : ApiResource
    , versionGroup : ApiResource
    }


{-| -}
type alias MachineVersionDetail =
    { machine : ApiResource
    , versionGroup : ApiResource
    }


{-| -}
type alias Move =
    { id : Int
    , name : String
    , accuracy : Int
    , effectChance : Maybe Int
    , pp : Maybe Int
    , priority : Int
    , power : Int
    , contestCombos : ContestComboSets
    , contestType : ApiResource
    , contestEffect : ApiResource
    , damageClass : ApiResource
    , effectEntries : List VerboseEffect
    , effectChanges : List AbilityEffectChange
    , flavorTextEntries : List MoveFlavorText
    , generation : ApiResource
    , machines : List MachineVersionDetail
    , meta : MoveMetaData
    , names : List Name
    , pastValues : List PastMoveStatValues
    , statChanges : List MoveStatChange
    , superContestEffect : ApiResource
    , target : ApiResource
    , type_ : ApiResource
    }


{-| -}
type alias MoveAilment =
    { id : Int
    , name : String
    , moves : List ApiResource
    , names : List Name
    }


{-| -}
type alias MoveBattleStyle =
    { id : Int
    , name : String
    , names : List Name
    }


{-| -}
type alias MoveBattleStylePreference =
    { lowHpPreference : Int
    , highHpPreference : Int
    , moveBattleStyle : ApiResource
    }


{-| -}
type alias MoveCategory =
    { id : Int
    , name : String
    , moves : List ApiResource
    , descriptions : List Description
    }


{-| -}
type alias MoveDamageClass =
    { id : Int
    , name : String
    , descriptions : List Description
    , moves : List ApiResource
    , names : List Name
    }


{-| -}
type alias MoveFlavorText =
    { flavorText : String
    , language : ApiResource
    , versionGroup : ApiResource
    }


{-| -}
type alias MoveLearnMethod =
    { id : Int
    , name : String
    , descriptions : List Description
    , names : List Name
    , versionGroups : List ApiResource
    }


{-| -}
type alias MoveMetaData =
    { ailment : ApiResource
    , category : ApiResource
    , minHits : Maybe Int
    , maxHits : Maybe Int
    , minTurns : Maybe Int
    , maxTurns : Maybe Int
    , drain : Int
    , healing : Int
    , critRate : Int
    , ailmentChance : Int
    , flinchChance : Int
    , statChance : Int
    }


{-| -}
type alias MoveStatAffect =
    { change : Int
    , move : ApiResource
    }


{-| -}
type alias MoveStatAffectSets =
    { increase : List MoveStatAffect
    , decrease : List MoveStatAffect
    }


{-| -}
type alias MoveStatChange =
    { change : Int
    , stat : ApiResource
    }


{-| -}
type alias MoveTarget =
    { id : Int
    , name : String
    , descriptions : List Description
    , moves : List ApiResource
    , names : List Name
    }


{-| -}
type alias Name =
    { name : String
    , language : ApiResource
    }


{-| -}
type alias Nature =
    { id : Int
    , name : String
    , decreasedStat : Maybe ApiResource
    , increasedStat : Maybe ApiResource
    , hatesFlavor : Maybe ApiResource
    , likesFlavor : Maybe ApiResource
    , pokeathlonStatChanges : List NatureStatChange
    , moveBattleStylePreferences : List MoveBattleStylePreference
    , names : List Name
    }


{-| -}
type alias NaturePokeathlonStatAffect =
    { maxChange : Int
    , nature : ApiResource
    }


{-| -}
type alias NaturePokeathlonStatAffectSets =
    { increase : List NaturePokeathlonStatAffect
    , decrease : List NaturePokeathlonStatAffect
    }


{-| -}
type alias NatureStatAffectSets =
    { increase : List ApiResource
    , decrease : List ApiResource
    }


{-| -}
type alias NatureStatChange =
    { maxChange : Int
    , pokeathlonStat : ApiResource
    }


{-| -}
type alias PalParkArea =
    { id : Int
    , name : String
    , names : List Name
    , pokemonEncounters : List PalParkEncounterSpecies
    }


{-| -}
type alias PalParkEncounterArea =
    { baseScore : Int
    , rate : Int
    , area : ApiResource
    }


{-| -}
type alias PalParkEncounterSpecies =
    { baseScore : Int
    , rate : Int
    , pokemonSpecies : ApiResource
    }


{-| -}
type alias PastMoveStatValues =
    { accuracy : Maybe Int
    , effectChance : Maybe Int
    , power : Maybe Int
    , pp : Maybe Int
    , effectEntries : List VerboseEffect
    , type_ : ApiResource
    , versionGroup : ApiResource
    }


{-| -}
type alias PokeathlonStat =
    { id : Int
    , name : String
    , names : List Name
    , affectingNatures : NaturePokeathlonStatAffectSets
    }


{-| -}
type alias Pokedex =
    { id : Int
    , name : String
    , isMainSeries : Bool
    , descriptions : List Description
    , names : List Name
    , pokemonEntries : List PokemonEntry
    , region : Maybe ApiResource
    , versionGroups : List ApiResource
    }


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
    , forms : List ApiResource
    , moves : List PokemonMove
    , sprites : PokemonSprites
    , stats : List PokemonStat
    , heldItems : List PokemonHeldItem
    , species : ApiResource
    , gameIndices : List VersionGameIndex
    , types : List PokemonType
    }


{-| -}
type alias PokemonAbility =
    { slot : Int
    , isHidden : Bool
    , ability : ApiResource
    }


{-| -}
type alias PokemonColor =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List ApiResource
    }


{-| -}
type alias PokemonEncounter =
    { pokemon : ApiResource
    , versionDetails : List VersionEncounterDetail
    }


{-| -}
type alias PokemonEntry =
    { entryNumber : Int
    , pokemonSpecies : ApiResource
    }


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
    , pokemon : ApiResource
    , sprites : PokemonFormSprites
    , versionGroup : ApiResource
    , names : List Name
    , formNames : List Name
    }


{-| -}
type alias PokemonFormSprites =
    { frontDefault : String
    , frontShiny : String
    , backDefault : String
    , backShiny : String
    }


{-| -}
type alias PokemonHabitat =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List ApiResource
    }


{-| -}
type alias PokemonHeldItem =
    { item : ApiResource
    , versionDetails : List PokemonHeldItemVersion
    }


{-| -}
type alias PokemonHeldItemVersion =
    { version : ApiResource
    , rarity : Int
    }


{-| -}
type alias PokemonMove =
    { move : ApiResource
    , versionGroupDetails : List PokemonMoveVersion
    }


{-| -}
type alias PokemonMoveVersion =
    { moveLearnMethod : ApiResource
    , versionGroup : ApiResource
    , levelLearnedAt : Int
    }


{-| -}
type alias PokemonShape =
    { id : Int
    , name : String
    , awesomeNames : List AwesomeName
    , names : List Name
    , pokemonSpecies : List ApiResource
    }


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
    , growthRate : ApiResource
    , pokedexNumbers : List PokemonSpeciesDexEntry
    , eggGroups : List ApiResource
    , color : ApiResource
    , shape : ApiResource
    , evolvesFromSpecies : Maybe ApiResource
    , evolutionChain : ApiResource
    , habitat : Maybe ApiResource
    , generation : ApiResource
    , names : List Name
    , palParkEncounters : List PalParkEncounterArea
    , flavorTextEntries : List FlavorText
    , formDescription : List Description
    , genera : List Genus
    , varieties : List PokemonSpeciesVariety
    }


{-| -}
type alias PokemonSpeciesDexEntry =
    { entryNumber : Int
    , pokedex : ApiResource
    }


{-| -}
type alias PokemonSpeciesGender =
    { rate : Int
    , pokemonSpecies : ApiResource
    }


{-| -}
type alias PokemonSpeciesVariety =
    { isDefault : Bool
    , pokemon : ApiResource
    }


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
type alias PokemonStat =
    { effort : Int
    , baseStat : Int
    , stat : ApiResource
    }


{-| -}
type alias PokemonType =
    { slot : Int
    , type_ : ApiResource
    }


{-| -}
type alias Region =
    { id : Int
    , name : String
    , locations : List ApiResource
    , mainGeneration : ApiResource
    , names : List Name
    , pokedexes : List ApiResource
    , versionGroups : List ApiResource
    }


{-| -}
type alias Stat =
    { id : Int
    , name : String
    , gameIndex : Int
    , isBattleOnly : Bool
    , affectingMoves : MoveStatAffectSets
    , affectingNatures : NatureStatAffectSets
    , characteristics : List ApiResource
    , moveDamageClass : Maybe ApiResource
    , names : List Name
    }


{-| -}
type alias SuperContestEffect =
    { id : Int
    , appeal : Int
    , flavorTextEntries : List FlavorText
    , moves : List ApiResource
    }


{-| -}
type alias Type =
    { id : Int
    , name : String
    , damageRelations : TypeRelations
    , gameIndices : List GenerationGameIndex
    , generation : ApiResource
    , moveDamageClass : Maybe ApiResource
    , names : List Name
    , pokemon : List TypePokemon
    , moves : List ApiResource
    }


{-| -}
type alias TypePokemon =
    { slot : Int
    , pokemon : ApiResource
    }


{-| -}
type alias TypeRelations =
    { noDamageTo : List ApiResource
    , halfDamageTo : List ApiResource
    , doubleDamageTo : List ApiResource
    , noDamageFrom : List ApiResource
    , halfDamageFrom : List ApiResource
    , doubleDamageFrom : List ApiResource
    }


{-| -}
type alias VerboseEffect =
    { effect : String
    , shortEffect : String
    , language : ApiResource
    }


{-| -}
type alias Version =
    { id : Int
    , name : String
    , names : List Name
    , versionGroup : ApiResource
    }


{-| -}
type alias VersionEncounterDetail =
    { version : ApiResource
    , maxChance : Int
    , encounterDetails : List Encounter
    }


{-| -}
type alias VersionGameIndex =
    { gameIndex : Int
    , version : ApiResource
    }


{-| -}
type alias VersionGroup =
    { id : Int
    , name : String
    , order : Int
    , generation : ApiResource
    , moveLearnMethods : List ApiResource
    , pokedexes : List ApiResource
    , regions : List ApiResource
    , versions : List ApiResource
    }


{-| -}
type alias VersionGroupFlavorText =
    { text : String
    , language : ApiResource
    , versionGroup : ApiResource
    }
