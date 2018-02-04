module PokeApi exposing (..)

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


type alias HttpResult a =
    Result Http.Error a



-- MESSAGES


type ListMsg
    = Loaded Resource (HttpResult ApiResourceList)


type ResourceMsg
    = LoadedPokemon (HttpResult Pokemon)


type Resource
    = Pokemon_



-- URLS


type alias ListOptions =
    { limit : Int
    , page : Int
    , offset : Int
    }


v2 : String
v2 =
    "https://pokeapi.co/api/v2/"


makeUrl :
    String
    -> String
    -> String
makeUrl resource param =
    String.concat [ v2, resource, "/", param ]


makeUrlWithOptions :
    String
    -> String
    -> ListOptions
    -> String
makeUrlWithOptions resource param opts =
    let
        q =
            "?"
                ++ String.join "&"
                    [ "limit="
                    , toString opts.limit
                    , "page="
                    , toString opts.page
                    , "offset="
                    , toString opts.offset
                    ]
    in
        makeUrl resource param ++ q


get :
    Decoder a
    -> String
    -> Http.Request a
get decoder url =
    Http.get url decoder


getPokemon : Cmd ListMsg
getPokemon =
    getPokemonWithOptions
        { limit = 20
        , page = 1
        , offset = 0
        }


getPokemonWithOptions :
    ListOptions
    -> Cmd ListMsg
getPokemonWithOptions opts =
    let
        request =
            get decodeApiResourceList <|
                makeUrlWithOptions "pokemon" "" opts
    in
        Http.send (Loaded Pokemon_) request


getPokemonById : Int -> Cmd ResourceMsg
getPokemonById id =
    getPokemonByName (toString id)


getPokemonByName : String -> Cmd ResourceMsg
getPokemonByName name =
    let
        request =
            get decodePokemon <|
                makeUrl "pokemon" name
    in
        Http.send LoadedPokemon request



-- TYPES & DECODERS


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


type alias AbilityEffectChange =
    { effectEntries : List Effect
    , versionGroup : NamedApiResource
    }


decodeAbilityEffectChange : Decoder AbilityEffectChange
decodeAbilityEffectChange =
    decode AbilityEffectChange
        |> required "effect_entries" (list decodeEffect)
        |> required "version_group" decodeNamedApiResource


type alias AbilityFlavorText =
    { flavorText : String
    , language : NamedApiResource
    , versionGroup : NamedApiResource
    }


decodeAbilityFlavorText : Decoder AbilityFlavorText
decodeAbilityFlavorText =
    decode AbilityFlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


type alias AbilityPokemon =
    { isHidden : Bool
    , slot : Int
    , pokemon : NamedApiResource
    }


decodeAbilityPokemon : Decoder AbilityPokemon
decodeAbilityPokemon =
    decode AbilityPokemon
        |> required "is_hidden" bool
        |> required "slot" int
        |> required "pokemon" decodeNamedApiResource


type alias ApiResource =
    { url : String
    }


decodeApiResource : Decoder ApiResource
decodeApiResource =
    decode ApiResource
        |> required "url" string


type alias ApiResourceList =
    { count : Int
    , next : Maybe String
    , previous : Maybe String
    , results : List ApiResource
    }


decodeApiResourceList : Decoder ApiResourceList
decodeApiResourceList =
    decode ApiResourceList
        |> required "count" int
        |> required "next" (maybe string)
        |> required "previous" (maybe string)
        |> required "results" (list decodeApiResource)


type alias AwesomeName =
    { awesomeName : String
    , language : NamedApiResource
    }


decodeAwesomeName : Decoder AwesomeName
decodeAwesomeName =
    decode AwesomeName
        |> required "awesome_name" string
        |> required "language" decodeNamedApiResource


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


type alias BerryFirmness =
    { id : Int
    , name : String
    , berries : List NamedApiResource
    , names : List Name
    }


decodeBerryFirmness : Decoder BerryFirmness
decodeBerryFirmness =
    decode BerryFirmness
        |> required "id" int
        |> required "name" string
        |> required "berries" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


type alias BerryFlavor =
    { id : Int
    , name : String
    , berries : List FlavorBerryMap
    , contestType : NamedApiResource
    , names : List Name
    }


decodeBerryFlavor : Decoder BerryFlavor
decodeBerryFlavor =
    decode BerryFlavor
        |> required "id" int
        |> required "name" string
        |> required "berries" (list decodeFlavorBerryMap)
        |> required "contest_type" decodeNamedApiResource
        |> required "names" (list decodeName)


type alias BerryFlavorMap =
    { potency : Int
    , flavor : NamedApiResource
    }


decodeBerryFlavorMap : Decoder BerryFlavorMap
decodeBerryFlavorMap =
    decode BerryFlavorMap
        |> required "potency" int
        |> required "flavor" decodeNamedApiResource


type alias ChainLink =
    { isBaby : Bool
    , species : NamedApiResource
    , evolutionDetails : List EvolutionDetail
    , evolvesTo : Evolutions
    }


type Evolutions
    = Evolutions (List ChainLink)


decodeChainLink : Decoder ChainLink
decodeChainLink =
    decode ChainLink
        |> required "is_baby" bool
        |> required "species" decodeNamedApiResource
        |> required "evolution_details"
            (list decodeEvolutionDetail)
        |> required "evolves_to"
            (map Evolutions (list (lazy (\_ -> decodeChainLink))))


type alias Characteristic =
    { id : Int
    , geneModulo : Int
    , possibleValues : List Int
    , descriptions : List Description
    }


decodeCharacteristic : Decoder Characteristic
decodeCharacteristic =
    decode Characteristic
        |> required "id" int
        |> required "gene_modulo" int
        |> required "possible_values" (list int)
        |> required "descriptions" (list decodeDescription)


type alias ContestComboSets =
    { normal : ContestComboDetail
    , super : ContestComboDetail
    }


decodeContestComboSets : Decoder ContestComboSets
decodeContestComboSets =
    decode ContestComboSets
        |> required "normal" decodeContestComboDetail
        |> required "super" decodeContestComboDetail


type alias ContestComboDetail =
    { useBefore : List NamedApiResource
    , useAfter : List NamedApiResource
    }


decodeContestComboDetail : Decoder ContestComboDetail
decodeContestComboDetail =
    decode ContestComboDetail
        |> required "use_before" (list decodeNamedApiResource)
        |> required "use_after" (list decodeNamedApiResource)


type alias ContestEffect =
    { id : Int
    , appeal : Int
    , jam : Int
    , effectEntries : List Effect
    , flavorTextEntries : List FlavorText
    }


decodeContestEffect : Decoder ContestEffect
decodeContestEffect =
    decode ContestEffect
        |> required "id" int
        |> required "appeal" int
        |> required "jam" int
        |> required "effect_entries" (list decodeEffect)
        |> required "flavor_text_entries" (list decodeFlavorText)


type alias ContestName =
    { name : String
    , color : String
    , language : NamedApiResource
    }


decodeContestName : Decoder ContestName
decodeContestName =
    decode ContestName
        |> required "name" string
        |> required "color" string
        |> required "language" decodeNamedApiResource


type alias ContestType =
    { id : Int
    , name : String
    , berryFlavor : NamedApiResource
    , names : List ContestName
    }


decodeContestType : Decoder ContestType
decodeContestType =
    decode ContestType
        |> required "id" int
        |> required "name" string
        |> required "berry_flavor" decodeNamedApiResource
        |> required "names" (list decodeContestName)


type alias Description =
    { description : String
    , language : NamedApiResource
    }


decodeDescription : Decoder Description
decodeDescription =
    decode Description
        |> required "description" string
        |> required "language" decodeNamedApiResource


type alias Effect =
    { effect : String
    , language : NamedApiResource
    }


decodeEffect : Decoder Effect
decodeEffect =
    decode Effect
        |> required "effect" string
        |> required "language" decodeNamedApiResource


type alias EggGroup =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


decodeEggGroup : Decoder EggGroup
decodeEggGroup =
    decode EggGroup
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


type alias Encounter =
    { minLevel : Int
    , maxLevel : Int
    , conditionValues : List NamedApiResource
    , chance : Int
    , method : NamedApiResource
    }


decodeEncounter : Decoder Encounter
decodeEncounter =
    decode Encounter
        |> required "min_level" int
        |> required "max_level" int
        |> required "condition_values" (list decodeNamedApiResource)
        |> required "chance" int
        |> required "method" decodeNamedApiResource


type alias EncounterCondition =
    { id : Int
    , name : String
    , names : List Name
    , values : List NamedApiResource
    }


decodeEncounterCondition : Decoder EncounterCondition
decodeEncounterCondition =
    decode EncounterCondition
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "values" (list decodeNamedApiResource)


type alias EncounterConditionValue =
    { id : Int
    , name : String
    , condition : List NamedApiResource
    , names : List Name
    }


decodeEncounterConditionValue : Decoder EncounterConditionValue
decodeEncounterConditionValue =
    decode EncounterConditionValue
        |> required "id" int
        |> required "name" string
        |> required "condition" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


type alias EncounterMethod =
    { id : Int
    , name : String
    , order : Int
    , names : List Name
    }


decodeEncounterMethod : Decoder EncounterMethod
decodeEncounterMethod =
    decode EncounterMethod
        |> required "id" int
        |> required "name" string
        |> required "order" int
        |> required "names" (list decodeName)


type alias EncounterMethodRate =
    { encounterMethod : NamedApiResource
    , versionDetails : List EncounterVersionDetails
    }


decodeEncounterMethodRate : Decoder EncounterMethodRate
decodeEncounterMethodRate =
    decode EncounterMethodRate
        |> required "encounter_method" decodeNamedApiResource
        |> required "version_details" (list decodeEncounterVersionDetails)


type alias EncounterVersionDetails =
    { rate : Int
    , version : NamedApiResource
    }


decodeEncounterVersionDetails : Decoder EncounterVersionDetails
decodeEncounterVersionDetails =
    decode EncounterVersionDetails
        |> required "rate" int
        |> required "version" decodeNamedApiResource


type alias EvolutionChain =
    { id : Int
    , babyTriggerItem : NamedApiResource
    , chain : ChainLink
    }


decodeEvolutionChain : Decoder EvolutionChain
decodeEvolutionChain =
    decode EvolutionChain
        |> required "id" int
        |> required "baby_trigger_item" decodeNamedApiResource
        |> required "chain" decodeChainLink


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


type alias EvolutionTrigger =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


decodeEvolutionTrigger : Decoder EvolutionTrigger
decodeEvolutionTrigger =
    decode EvolutionTrigger
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species"
            (list decodeNamedApiResource)


type alias FlavorBerryMap =
    { potency : Int
    , berry : NamedApiResource
    }


decodeFlavorBerryMap : Decoder FlavorBerryMap
decodeFlavorBerryMap =
    decode FlavorBerryMap
        |> required "potency" int
        |> required "berry" decodeNamedApiResource


type alias FlavorText =
    { flavorText : String
    , language : NamedApiResource
    }


decodeFlavorText : Decoder FlavorText
decodeFlavorText =
    decode FlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource


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


type alias Gender =
    { id : Int
    , name : String
    , pokemonSpeciesDetails : List PokemonSpeciesGender
    , requiredForEvolution : List NamedApiResource
    }


decodeGender : Decoder Gender
decodeGender =
    decode Gender
        |> required "id" int
        |> required "name" string
        |> required "pokemon_species_details" (list decodePokemonSpeciesGender)
        |> required "required_for_evolution" (list decodeNamedApiResource)


type alias GenerationGameIndex =
    { gameIndex : Int
    , generation : NamedApiResource
    }


decodeGenerationGameIndex : Decoder GenerationGameIndex
decodeGenerationGameIndex =
    decode GenerationGameIndex
        |> required "game_index" int
        |> required "generation" decodeNamedApiResource


type alias Genus =
    { genus : String
    , language : NamedApiResource
    }


decodeGenus : Decoder Genus
decodeGenus =
    decode Genus
        |> required "genus" string
        |> required "language" decodeNamedApiResource


type alias GrowthRate =
    { id : Int
    , name : String
    , formula : String
    , descriptions : List Description
    , levels : List GrowthRateExperienceLevel
    , pokemonSpecies : List NamedApiResource
    }


decodeGrowthRate : Decoder GrowthRate
decodeGrowthRate =
    decode GrowthRate
        |> required "id" int
        |> required "name" string
        |> required "formula" string
        |> required "descriptions" (list decodeDescription)
        |> required "levels" (list decodeGrowthRateExperienceLevel)
        |> required "pokemon_species" (list decodeNamedApiResource)


type alias GrowthRateExperienceLevel =
    { level : Int
    , experience : Int
    }


decodeGrowthRateExperienceLevel : Decoder GrowthRateExperienceLevel
decodeGrowthRateExperienceLevel =
    decode GrowthRateExperienceLevel
        |> required "level" int
        |> required "experience" int


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


type alias ItemAttribute =
    { id : Int
    , name : String
    , items : List NamedApiResource
    , names : List Name
    , descriptions : List Description
    }


decodeItemAttribute : Decoder ItemAttribute
decodeItemAttribute =
    decode ItemAttribute
        |> required "id" int
        |> required "name" string
        |> required "items" (list decodeNamedApiResource)
        |> required "names" (list decodeName)
        |> required "descriptions" (list decodeDescription)


type alias ItemCategory =
    { id : Int
    , name : String
    , items : List NamedApiResource
    , names : List Name
    , pocket : NamedApiResource
    }


decodeItemCategory : Decoder ItemCategory
decodeItemCategory =
    decode ItemCategory
        |> required "id" int
        |> required "name" string
        |> required "items" (list decodeNamedApiResource)
        |> required "names" (list decodeName)
        |> required "pocket" decodeNamedApiResource


type alias ItemFlingEffect =
    { id : Int
    , name : String
    , effectEntries : List Effect
    , items : List NamedApiResource
    }


decodeItemFlingEffect : Decoder ItemFlingEffect
decodeItemFlingEffect =
    decode ItemFlingEffect
        |> required "id" int
        |> required "name" string
        |> required "effect_entries" (list decodeEffect)
        |> required "items" (list decodeNamedApiResource)


type alias ItemHolderPokemon =
    { pokemon : String
    , versionDetails : List ItemHolderPokemonVersionDetail
    }


decodeItemHolderPokemon : Decoder ItemHolderPokemon
decodeItemHolderPokemon =
    decode ItemHolderPokemon
        |> required "pokemon" string
        |> required "version_details" (list decodeItemHolderPokemonVersionDetail)


type alias ItemHolderPokemonVersionDetail =
    { rarity : String
    , version : NamedApiResource
    }


decodeItemHolderPokemonVersionDetail : Decoder ItemHolderPokemonVersionDetail
decodeItemHolderPokemonVersionDetail =
    decode ItemHolderPokemonVersionDetail
        |> required "rarity" string
        |> required "version" decodeNamedApiResource


type alias ItemPocket =
    { id : Int
    , name : String
    , categories : List NamedApiResource
    , names : List Name
    }


decodeItemPocket : Decoder ItemPocket
decodeItemPocket =
    decode ItemPocket
        |> required "id" int
        |> required "name" string
        |> required "categories" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


type alias ItemSprites =
    { default : String
    }


decodeItemSprites : Decoder ItemSprites
decodeItemSprites =
    decode ItemSprites
        |> required "default" string


type alias Language =
    { id : Int
    , name : String
    , official : Bool
    , iso639 : String
    , iso3166 : String
    , names : List Name
    }


decodeLanguage : Decoder Language
decodeLanguage =
    decode Language
        |> required "id" int
        |> required "name" string
        |> required "official" bool
        |> required "iso639" string
        |> required "iso3166" string
        |> required "names" (list decodeName)


type alias Location =
    { id : Int
    , name : String
    , region : NamedApiResource
    , names : List Name
    , gameIndices : List GenerationGameIndex
    , areas : List NamedApiResource
    }


decodeLocation : Decoder Location
decodeLocation =
    decode Location
        |> required "id" int
        |> required "name" string
        |> required "region" decodeNamedApiResource
        |> required "names" (list decodeName)
        |> required "game_indices" (list decodeGenerationGameIndex)
        |> required "areas" (list decodeNamedApiResource)


type alias LocationArea =
    { id : Int
    , name : String
    , gameIndex : Int
    , encounterMethodRates : List EncounterMethodRate
    , location : NamedApiResource
    , names : List Name
    , pokemonEncounters : List PokemonEncounter
    }


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


type alias LocationAreaEncounter =
    { locationArea : NamedApiResource
    , versionDetails : List VersionEncounterDetail
    }


decodeLocationAreaEncounter : Decoder LocationAreaEncounter
decodeLocationAreaEncounter =
    decode LocationAreaEncounter
        |> required "location_area" decodeNamedApiResource
        |> required "version_details" (list decodeVersionEncounterDetail)


type alias Machine =
    { id : Int
    , item : NamedApiResource
    , move : NamedApiResource
    , versionGroup : NamedApiResource
    }


decodeMachine : Decoder Machine
decodeMachine =
    decode Machine
        |> required "id" int
        |> required "item" decodeNamedApiResource
        |> required "move" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


type alias MachineVersionDetail =
    { machine : ApiResource
    , versionGroup : NamedApiResource
    }


decodeMachineVersionDetail : Decoder MachineVersionDetail
decodeMachineVersionDetail =
    decode MachineVersionDetail
        |> required "machine" decodeApiResource
        |> required "version_group" decodeNamedApiResource


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


type alias MoveAilment =
    { id : Int
    , name : String
    , moves : List NamedApiResource
    , names : List Name
    }


decodeMoveAilment : Decoder MoveAilment
decodeMoveAilment =
    decode MoveAilment
        |> required "id" int
        |> required "name" string
        |> required "moves" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


type alias MoveBattleStyle =
    { id : Int
    , name : String
    , names : List Name
    }


decodeMoveBattleStyle : Decoder MoveBattleStyle
decodeMoveBattleStyle =
    decode MoveBattleStyle
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)


type alias MoveBattleStylePreference =
    { lowHpPreference : Int
    , highHpPreference : Int
    , moveBattleStyle : NamedApiResource
    }


decodeMoveBattleStylePreference : Decoder MoveBattleStylePreference
decodeMoveBattleStylePreference =
    decode MoveBattleStylePreference
        |> required "low_hp_preference" int
        |> required "high_hp_preference" int
        |> required "move_battle_style" decodeNamedApiResource


type alias MoveCategory =
    { id : Int
    , name : String
    , moves : List NamedApiResource
    , descriptions : List Description
    }


decodeMoveCategory : Decoder MoveCategory
decodeMoveCategory =
    decode MoveCategory
        |> required "id" int
        |> required "name" string
        |> required "moves" (list decodeNamedApiResource)
        |> required "descriptions" (list decodeDescription)


type alias MoveDamageClass =
    { id : Int
    , name : String
    , descriptions : List Description
    , moves : List NamedApiResource
    , names : List Name
    }


decodeMoveDamageClass : Decoder MoveDamageClass
decodeMoveDamageClass =
    decode MoveDamageClass
        |> required "id" int
        |> required "name" string
        |> required "descriptions" (list decodeDescription)
        |> required "moves" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


type alias MoveFlavorText =
    { flavorText : String
    , language : NamedApiResource
    , versionGroup : NamedApiResource
    }


decodeMoveFlavorText : Decoder MoveFlavorText
decodeMoveFlavorText =
    decode MoveFlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


type alias MoveLearnMethod =
    { id : Int
    , name : String
    , descriptions : List Description
    , names : List Name
    , versionGroups : List NamedApiResource
    }


decodeMoveLearnMethod : Decoder MoveLearnMethod
decodeMoveLearnMethod =
    decode MoveLearnMethod
        |> required "id" int
        |> required "name" string
        |> required "descriptions" (list decodeDescription)
        |> required "names" (list decodeName)
        |> required "version_groups" (list decodeNamedApiResource)


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


type alias MoveStatAffect =
    { change : Int
    , move : NamedApiResource
    }


decodeMoveStatAffect : Decoder MoveStatAffect
decodeMoveStatAffect =
    decode MoveStatAffect
        |> required "change" int
        |> required "move" decodeNamedApiResource


type alias MoveStatAffectSets =
    { increase : List MoveStatAffect
    , decrease : List MoveStatAffect
    }


decodeMoveStatAffectSets : Decoder MoveStatAffectSets
decodeMoveStatAffectSets =
    decode MoveStatAffectSets
        |> required "increase" (list decodeMoveStatAffect)
        |> required "decrease" (list decodeMoveStatAffect)


type alias MoveStatChange =
    { change : Int
    , stat : NamedApiResource
    }


decodeMoveStatChange : Decoder MoveStatChange
decodeMoveStatChange =
    decode MoveStatChange
        |> required "change" int
        |> required "stat" decodeNamedApiResource


type alias MoveTarget =
    { id : Int
    , name : String
    , descriptions : List Description
    , moves : List NamedApiResource
    , names : List Name
    }


decodeMoveTarget : Decoder MoveTarget
decodeMoveTarget =
    decode MoveTarget
        |> required "id" int
        |> required "name" string
        |> required "descriptions" (list decodeDescription)
        |> required "moves" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


type alias Name =
    { name : String
    , language : NamedApiResource
    }


decodeName : Decoder Name
decodeName =
    decode Name
        |> required "name" string
        |> required "language" decodeNamedApiResource


type alias NamedApiResource =
    { name : String
    , url : String
    }


decodeNamedApiResource : Decoder NamedApiResource
decodeNamedApiResource =
    decode NamedApiResource
        |> required "name" string
        |> required "url" string


type alias NamedApiResourceList =
    { count : Int
    , next : Maybe String
    , previous : Maybe String
    , results : List NamedApiResource
    }


decodeNamedApiResourceList : Decoder NamedApiResourceList
decodeNamedApiResourceList =
    decode NamedApiResourceList
        |> required "count" int
        |> required "next" (maybe string)
        |> required "previous" (maybe string)
        |> required "results" (list decodeNamedApiResource)


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


type alias NaturePokeathlonStatAffect =
    { maxChange : Int
    , nature : NamedApiResource
    }


decodeNaturePokeathlonStatAffect : Decoder NaturePokeathlonStatAffect
decodeNaturePokeathlonStatAffect =
    decode NaturePokeathlonStatAffect
        |> required "max_change" int
        |> required "nature" decodeNamedApiResource


type alias NaturePokeathlonStatAffectSets =
    { increase : List NaturePokeathlonStatAffect
    , decrease : List NaturePokeathlonStatAffect
    }


decodeNaturePokeathlonStatAffectSets : Decoder NaturePokeathlonStatAffectSets
decodeNaturePokeathlonStatAffectSets =
    decode NaturePokeathlonStatAffectSets
        |> required "increase" (list decodeNaturePokeathlonStatAffect)
        |> required "decrease" (list decodeNaturePokeathlonStatAffect)


type alias NatureStatAffectSets =
    { increase : List NamedApiResource
    , decrease : List NamedApiResource
    }


decodeNatureStatAffectSets : Decoder NatureStatAffectSets
decodeNatureStatAffectSets =
    decode NatureStatAffectSets
        |> required "increase" (list decodeNamedApiResource)
        |> required "decrease" (list decodeNamedApiResource)


type alias NatureStatChange =
    { maxChange : Int
    , pokeathlonStat : NamedApiResource
    }


decodeNatureStatChange : Decoder NatureStatChange
decodeNatureStatChange =
    decode NatureStatChange
        |> required "max_change" int
        |> required "pokeathlon_stat" decodeNamedApiResource


type alias PalParkArea =
    { id : Int
    , name : String
    , names : List Name
    , pokemonEncounters : List PalParkEncounterSpecies
    }


decodePalParkArea : Decoder PalParkArea
decodePalParkArea =
    decode PalParkArea
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_encounters" (list decodePalParkEncounterSpecies)


type alias PalParkEncounterArea =
    { baseScore : Int
    , rate : Int
    , area : NamedApiResource
    }


decodePalParkEncounterArea : Decoder PalParkEncounterArea
decodePalParkEncounterArea =
    decode PalParkEncounterArea
        |> required "base_score" int
        |> required "rate" int
        |> required "area" decodeNamedApiResource


type alias PalParkEncounterSpecies =
    { baseScore : Int
    , rate : Int
    , pokemonSpecies : NamedApiResource
    }


decodePalParkEncounterSpecies : Decoder PalParkEncounterSpecies
decodePalParkEncounterSpecies =
    decode PalParkEncounterSpecies
        |> required "base_score" int
        |> required "rate" int
        |> required "pokemon_species" decodeNamedApiResource


type alias PastMoveStatValues =
    { accuracy : Int
    , effectChance : Int
    , power : Int
    , pp : Int
    , effectEntries : List VerboseEffect
    , type_ : NamedApiResource
    , versionGroup : NamedApiResource
    }


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


type alias PokeathlonStat =
    { id : Int
    , name : String
    , names : List Name
    , affectingNatures : NaturePokeathlonStatAffectSets
    }


decodePokeathlonStat : Decoder PokeathlonStat
decodePokeathlonStat =
    decode PokeathlonStat
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "affecting_natures" decodeNaturePokeathlonStatAffectSets


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


type alias PokemonAbility =
    { slot : Int
    , isHidden : Bool
    , ability : NamedApiResource
    }


decodePokemonAbility : Decoder PokemonAbility
decodePokemonAbility =
    decode PokemonAbility
        |> required "slot" int
        |> required "is_hidden" bool
        |> required "ability" decodeNamedApiResource


type alias PokemonColor =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


decodePokemonColor : Decoder PokemonColor
decodePokemonColor =
    decode PokemonColor
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


type alias PokemonEncounter =
    { pokemon : NamedApiResource
    , versionDetails : List VersionEncounterDetail
    }


decodePokemonEncounter : Decoder PokemonEncounter
decodePokemonEncounter =
    decode PokemonEncounter
        |> required "pokemon" decodeNamedApiResource
        |> required "version_details" (list decodeVersionEncounterDetail)


type alias PokemonEntry =
    { entryNumber : Int
    , pokemonSpecies : NamedApiResource
    }


decodePokemonEntry : Decoder PokemonEntry
decodePokemonEntry =
    decode PokemonEntry
        |> required "entry_number" int
        |> required "pokemon_species" decodeNamedApiResource


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


type alias PokemonFormSprites =
    { frontDefault : String
    , frontShiny : String
    , backDefault : String
    , backShiny : String
    }


decodePokemonFormSprites : Decoder PokemonFormSprites
decodePokemonFormSprites =
    decode PokemonFormSprites
        |> required "front_default" string
        |> required "front_shiny" string
        |> required "back_default" string
        |> required "back_shiny" string


type alias PokemonHabitat =
    { id : Int
    , name : String
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


decodePokemonHabitat : Decoder PokemonHabitat
decodePokemonHabitat =
    decode PokemonHabitat
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


type alias PokemonHeldItem =
    { item : NamedApiResource
    , versionDetails : List PokemonHeldItemVersion
    }


decodePokemonHeldItem : Decoder PokemonHeldItem
decodePokemonHeldItem =
    decode PokemonHeldItem
        |> required "item" decodeNamedApiResource
        |> required "version_details"
            (list decodePokemonHeldItemVersion)


type alias PokemonHeldItemVersion =
    { version : NamedApiResource
    , rarity : Int
    }


decodePokemonHeldItemVersion : Decoder PokemonHeldItemVersion
decodePokemonHeldItemVersion =
    decode PokemonHeldItemVersion
        |> required "version" decodeNamedApiResource
        |> required "rarity" int


type alias PokemonMove =
    { move : NamedApiResource
    , versionGroupDetails : List PokemonMoveVersion
    }


decodePokemonMove : Decoder PokemonMove
decodePokemonMove =
    decode PokemonMove
        |> required "move" decodeNamedApiResource
        |> required "version_group_details"
            (list decodePokemonMoveVersion)


type alias PokemonMoveVersion =
    { moveLearnMethod : NamedApiResource
    , versionGroup : NamedApiResource
    , levelLearnedAt : Int
    }


decodePokemonMoveVersion : Decoder PokemonMoveVersion
decodePokemonMoveVersion =
    decode PokemonMoveVersion
        |> required "move_learn_method" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource
        |> required "level_learned_at" int


type alias PokemonShape =
    { id : Int
    , name : String
    , awesomeNames : List AwesomeName
    , names : List Name
    , pokemonSpecies : List NamedApiResource
    }


decodePokemonShape : Decoder PokemonShape
decodePokemonShape =
    decode PokemonShape
        |> required "id" int
        |> required "name" string
        |> required "awesome_names" (list decodeAwesomeName)
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


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


type alias PokemonSpeciesDexEntry =
    { entryNumber : Int
    , pokedex : NamedApiResource
    }


decodePokemonSpeciesDexEntry : Decoder PokemonSpeciesDexEntry
decodePokemonSpeciesDexEntry =
    decode PokemonSpeciesDexEntry
        |> required "entry_number" int
        |> required "pokedex" decodeNamedApiResource


type alias PokemonSpeciesGender =
    { rate : Int
    , pokemonSpecies : NamedApiResource
    }


decodePokemonSpeciesGender : Decoder PokemonSpeciesGender
decodePokemonSpeciesGender =
    decode PokemonSpeciesGender
        |> required "rate" int
        |> required "pokemon_species" decodeNamedApiResource


type alias PokemonSpeciesVariety =
    { isDefault : Bool
    , pokemon : NamedApiResource
    }


decodePokemonSpeciesVariety : Decoder PokemonSpeciesVariety
decodePokemonSpeciesVariety =
    decode PokemonSpeciesVariety
        |> required "is_default" bool
        |> required "pokemon" decodeNamedApiResource


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


type alias PokemonStat =
    { effort : Int
    , baseStat : Int
    , stat : NamedApiResource
    }


decodePokemonStat : Decoder PokemonStat
decodePokemonStat =
    decode PokemonStat
        |> required "effort" int
        |> required "base_stat" int
        |> required "stat" decodeNamedApiResource


type alias PokemonType =
    { slot : Int
    , type_ : NamedApiResource
    }


decodePokemonType : Decoder PokemonType
decodePokemonType =
    decode PokemonType
        |> required "slot" int
        |> required "type" decodeNamedApiResource


type alias Region =
    { id : Int
    , name : String
    , locations : List NamedApiResource
    , mainGeneration : NamedApiResource
    , names : List Name
    , pokedexes : List NamedApiResource
    , versionGroups : List NamedApiResource
    }


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


type alias SuperContestEffect =
    { id : Int
    , appeal : Int
    , flavorTextEntries : List FlavorText
    , moves : List NamedApiResource
    }


decodeSuperContestEffect : Decoder SuperContestEffect
decodeSuperContestEffect =
    decode SuperContestEffect
        |> required "id" int
        |> required "appeal" int
        |> required "flavor_text_entries" (list decodeFlavorText)
        |> required "moves" (list decodeNamedApiResource)


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


type alias TypePokemon =
    { slot : Int
    , pokemon : NamedApiResource
    }


decodeTypePokemon : Decoder TypePokemon
decodeTypePokemon =
    decode TypePokemon
        |> required "slot" int
        |> required "pokemon" decodeNamedApiResource


type alias TypeRelations =
    { noDamageTo : List NamedApiResource
    , halfDamageTo : List NamedApiResource
    , doubleDamageTo : List NamedApiResource
    , noDamageFrom : List NamedApiResource
    , halfDamageFrom : List NamedApiResource
    , doubleDamageFrom : List NamedApiResource
    }


decodeTypeRelations : Decoder TypeRelations
decodeTypeRelations =
    decode TypeRelations
        |> required "no_damage_to" (list decodeNamedApiResource)
        |> required "half_damage_to" (list decodeNamedApiResource)
        |> required "double_damage_to" (list decodeNamedApiResource)
        |> required "no_damage_from" (list decodeNamedApiResource)
        |> required "half_damage_from" (list decodeNamedApiResource)
        |> required "double_damage_from" (list decodeNamedApiResource)


type alias VerboseEffect =
    { effect : String
    , shortEffect : String
    , language : NamedApiResource
    }


decodeVerboseEffect : Decoder VerboseEffect
decodeVerboseEffect =
    decode VerboseEffect
        |> required "effect" string
        |> required "short_effect" string
        |> required "language" decodeNamedApiResource


type alias Version =
    { id : Int
    , name : String
    , names : List Name
    , versionGroup : NamedApiResource
    }


decodeVersion : Decoder Version
decodeVersion =
    decode Version
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "version_group" decodeNamedApiResource


type alias VersionEncounterDetail =
    { version : NamedApiResource
    , maxChance : Int
    , encounterDetails : List Encounter
    }


decodeVersionEncounterDetail : Decoder VersionEncounterDetail
decodeVersionEncounterDetail =
    decode VersionEncounterDetail
        |> required "version" decodeNamedApiResource
        |> required "max_chance" int
        |> required "encounter_details" (list decodeEncounter)


type alias VersionGameIndex =
    { gameIndex : Int
    , version : NamedApiResource
    }


decodeVersionGameIndex : Decoder VersionGameIndex
decodeVersionGameIndex =
    decode VersionGameIndex
        |> required "game_index" int
        |> required "version" decodeNamedApiResource


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


type alias VersionGroupFlavorText =
    { text : String
    , language : NamedApiResource
    , versionGroup : NamedApiResource
    }


decodeVersionGroupFlavorText : Decoder VersionGroupFlavorText
decodeVersionGroupFlavorText =
    decode VersionGroupFlavorText
        |> required "text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource
