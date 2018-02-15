module Json.Decode.PokeApi
    exposing
        ( decodeAbility
        , decodeAbilityEffectChange
        , decodeAbilityFlavorText
        , decodeAbilityPokemon
        , decodeApiResource
        , decodeApiResourceList
        , decodeAwesomeName
        , decodeBerry
        , decodeBerryFirmness
        , decodeBerryFlavor
        , decodeBerryFlavorMap
        , decodeChainLink
        , decodeCharacteristic
        , decodeContestComboSets
        , decodeContestComboDetail
        , decodeContestEffect
        , decodeContestName
        , decodeContestType
        , decodeDescription
        , decodeEffect
        , decodeEggGroup
        , decodeEncounter
        , decodeEncounterCondition
        , decodeEncounterConditionValue
        , decodeEncounterMethod
        , decodeEncounterMethodRate
        , decodeEncounterVersionDetails
        , decodeEvolutionChain
        , decodeEvolutionDetail
        , decodeEvolutionTrigger
        , decodeFlavorBerryMap
        , decodeFlavorText
        , decodeGeneration
        , decodeGender
        , decodeGenerationGameIndex
        , decodeGenus
        , decodeGrowthRate
        , decodeGrowthRateExperienceLevel
        , decodeItem
        , decodeItemAttribute
        , decodeItemCategory
        , decodeItemFlingEffect
        , decodeItemHolderPokemon
        , decodeItemHolderPokemonVersionDetail
        , decodeItemPocket
        , decodeItemSprites
        , decodeLanguage
        , decodeLocation
        , decodeLocationArea
        , decodeLocationAreaEncounter
        , decodeMachine
        , decodeMachineVersionDetail
        , decodeMove
        , decodeMoveAilment
        , decodeMoveBattleStyle
        , decodeMoveBattleStylePreference
        , decodeMoveCategory
        , decodeMoveDamageClass
        , decodeMoveFlavorText
        , decodeMoveLearnMethod
        , decodeMoveMetaData
        , decodeMoveStatAffect
        , decodeMoveStatAffectSets
        , decodeMoveStatChange
        , decodeMoveTarget
        , decodeName
        , decodeNamedApiResource
        , decodeNamedApiResourceList
        , decodeNature
        , decodeNaturePokeathlonStatAffect
        , decodeNaturePokeathlonStatAffectSets
        , decodeNatureStatAffectSets
        , decodeNatureStatChange
        , decodePalParkArea
        , decodePalParkEncounterArea
        , decodePalParkEncounterSpecies
        , decodePastMoveStatValues
        , decodePokeathlonStat
        , decodePokedex
        , decodePokemon
        , decodePokemonAbility
        , decodePokemonColor
        , decodePokemonEncounter
        , decodePokemonEntry
        , decodePokemonForm
        , decodePokemonFormSprites
        , decodePokemonHabitat
        , decodePokemonHeldItem
        , decodePokemonHeldItemVersion
        , decodePokemonMove
        , decodePokemonMoveVersion
        , decodePokemonShape
        , decodePokemonSpecies
        , decodePokemonSpeciesDexEntry
        , decodePokemonSpeciesGender
        , decodePokemonSpeciesVariety
        , decodePokemonSprites
        , decodePokemonStat
        , decodePokemonType
        , decodeRegion
        , decodeStat
        , decodeSuperContestEffect
        , decodeType
        , decodeTypePokemon
        , decodeTypeRelations
        , decodeVerboseEffect
        , decodeVersion
        , decodeVersionEncounterDetail
        , decodeVersionGameIndex
        , decodeVersionGroup
        , decodeVersionGroupFlavorText
        )

{-| PokeApi decoders


# Decoders

@docs decodeAbility, decodeAbilityEffectChange, decodeAbilityFlavorText,
decodeAbilityPokemon, decodeApiResource, decodeApiResourceList,
decodeAwesomeName, decodeBerry, decodeBerryFirmness, decodeBerryFlavor,
decodeBerryFlavorMap, decodeChainLink, decodeCharacteristic,
decodeContestComboSets, decodeContestComboDetail, decodeContestEffect,
decodeContestName, decodeContestType, decodeDescription, decodeEffect,
decodeEggGroup, decodeEncounter, decodeEncounterCondition,
decodeEncounterConditionValue, decodeEncounterMethod, decodeEncounterMethodRate,
decodeEncounterVersionDetails, decodeEvolutionChain, decodeEvolutionDetail,
decodeEvolutionTrigger, decodeFlavorBerryMap, decodeFlavorText,
decodeGeneration, decodeGender, decodeGenerationGameIndex, decodeGenus,
decodeGrowthRate, decodeGrowthRateExperienceLevel, decodeItem,
decodeItemAttribute, decodeItemCategory, decodeItemFlingEffect,
decodeItemHolderPokemon, decodeItemHolderPokemonVersionDetail, decodeItemPocket,
decodeItemSprites, decodeLanguage, decodeLocation, decodeLocationArea,
decodeLocationAreaEncounter, decodeMachine, decodeMachineVersionDetail,
decodeMove, decodeMoveAilment, decodeMoveBattleStyle,
decodeMoveBattleStylePreference, decodeMoveCategory, decodeMoveDamageClass,
decodeMoveFlavorText, decodeMoveLearnMethod, decodeMoveMetaData,
decodeMoveStatAffect, decodeMoveStatAffectSets, decodeMoveStatChange,
decodeMoveTarget, decodeName, decodeNamedApiResource,
decodeNamedApiResourceList, decodeNature, decodeNaturePokeathlonStatAffect,
decodeNaturePokeathlonStatAffectSets, decodeNatureStatAffectSets,
decodeNatureStatChange, decodePalParkArea, decodePalParkEncounterArea,
decodePalParkEncounterSpecies, decodePastMoveStatValues, decodePokeathlonStat,
decodePokedex, decodePokemon, decodePokemonAbility, decodePokemonColor,
decodePokemonEncounter, decodePokemonEntry, decodePokemonForm,
decodePokemonFormSprites, decodePokemonHabitat, decodePokemonHeldItem,
decodePokemonHeldItemVersion, decodePokemonMove, decodePokemonMoveVersion,
decodePokemonShape, decodePokemonSpecies, decodePokemonSpeciesDexEntry,
decodePokemonSpeciesGender, decodePokemonSpeciesVariety, decodePokemonSprites,
decodePokemonStat, decodePokemonType, decodeRegion, decodeStat,
decodeSuperContestEffect, decodeType, decodeTypePokemon, decodeTypeRelations,
decodeVerboseEffect, decodeVersion, decodeVersionEncounterDetail,
decodeVersionGameIndex, decodeVersionGroup, decodeVersionGroupFlavorText
decodeVersionGroupFlavorText

-}

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
import PokeApi exposing (..)


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
decodeAbilityEffectChange : Decoder AbilityEffectChange
decodeAbilityEffectChange =
    decode AbilityEffectChange
        |> required "effect_entries" (list decodeEffect)
        |> required "version_group" decodeNamedApiResource


{-| -}
decodeAbilityFlavorText : Decoder AbilityFlavorText
decodeAbilityFlavorText =
    decode AbilityFlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


{-| -}
decodeAbilityPokemon : Decoder AbilityPokemon
decodeAbilityPokemon =
    decode AbilityPokemon
        |> required "is_hidden" bool
        |> required "slot" int
        |> required "pokemon" decodeNamedApiResource


{-| -}
decodeApiResource : Decoder ApiResource
decodeApiResource =
    decode ApiResource
        |> required "url" string


{-| -}
decodeApiResourceList : Decoder ApiResourceList
decodeApiResourceList =
    decode ApiResourceList
        |> required "count" int
        |> required "next" (maybe string)
        |> required "previous" (maybe string)
        |> required "results" (list decodeApiResource)


{-| -}
decodeAwesomeName : Decoder AwesomeName
decodeAwesomeName =
    decode AwesomeName
        |> required "awesome_name" string
        |> required "language" decodeNamedApiResource


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
decodeBerryFirmness : Decoder BerryFirmness
decodeBerryFirmness =
    decode BerryFirmness
        |> required "id" int
        |> required "name" string
        |> required "berries" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


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
decodeBerryFlavorMap : Decoder BerryFlavorMap
decodeBerryFlavorMap =
    decode BerryFlavorMap
        |> required "potency" int
        |> required "flavor" decodeNamedApiResource


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
decodeCharacteristic : Decoder Characteristic
decodeCharacteristic =
    decode Characteristic
        |> required "id" int
        |> required "gene_modulo" int
        |> required "possible_values" (list int)
        |> required "descriptions" (list decodeDescription)


{-| -}
decodeContestComboSets : Decoder ContestComboSets
decodeContestComboSets =
    decode ContestComboSets
        |> required "normal" decodeContestComboDetail
        |> required "super" decodeContestComboDetail


{-| -}
decodeContestComboDetail : Decoder ContestComboDetail
decodeContestComboDetail =
    decode ContestComboDetail
        |> required "use_before" ((maybe << list) decodeNamedApiResource)
        |> required "use_after" ((maybe << list) decodeNamedApiResource)


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
decodeContestName : Decoder ContestName
decodeContestName =
    decode ContestName
        |> required "name" string
        |> required "color" string
        |> required "language" decodeNamedApiResource


{-| -}
decodeContestType : Decoder ContestType
decodeContestType =
    decode ContestType
        |> required "id" int
        |> required "name" string
        |> required "berry_flavor" decodeNamedApiResource
        |> required "names" (list decodeContestName)


{-| -}
decodeDescription : Decoder Description
decodeDescription =
    decode Description
        |> required "description" string
        |> required "language" decodeNamedApiResource


{-| -}
decodeEffect : Decoder Effect
decodeEffect =
    decode Effect
        |> required "effect" string
        |> required "language" decodeNamedApiResource


{-| -}
decodeEggGroup : Decoder EggGroup
decodeEggGroup =
    decode EggGroup
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


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
decodeEncounterCondition : Decoder EncounterCondition
decodeEncounterCondition =
    decode EncounterCondition
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "values" (list decodeNamedApiResource)


{-| -}
decodeEncounterConditionValue : Decoder EncounterConditionValue
decodeEncounterConditionValue =
    decode EncounterConditionValue
        |> required "id" int
        |> required "name" string
        |> required "condition" decodeNamedApiResource
        |> required "names" (list decodeName)


{-| -}
decodeEncounterMethod : Decoder EncounterMethod
decodeEncounterMethod =
    decode EncounterMethod
        |> required "id" int
        |> required "name" string
        |> required "order" int
        |> required "names" (list decodeName)


{-| -}
decodeEncounterMethodRate : Decoder EncounterMethodRate
decodeEncounterMethodRate =
    decode EncounterMethodRate
        |> required "encounter_method" decodeNamedApiResource
        |> required "version_details" (list decodeEncounterVersionDetails)


{-| -}
decodeEncounterVersionDetails : Decoder EncounterVersionDetails
decodeEncounterVersionDetails =
    decode EncounterVersionDetails
        |> required "rate" int
        |> required "version" decodeNamedApiResource


{-| -}
decodeEvolutionChain : Decoder EvolutionChain
decodeEvolutionChain =
    decode EvolutionChain
        |> required "id" int
        |> required "baby_trigger_item" (maybe decodeNamedApiResource)
        |> required "chain" decodeChainLink


{-| -}
decodeEvolutionDetail : Decoder EvolutionDetail
decodeEvolutionDetail =
    decode EvolutionDetail
        |> required "item" (maybe decodeNamedApiResource)
        |> required "trigger" decodeNamedApiResource
        |> required "gender" (maybe int)
        |> required "held_item" (maybe decodeNamedApiResource)
        |> required "known_move" (maybe decodeNamedApiResource)
        |> required "known_move_type" (maybe decodeNamedApiResource)
        |> required "location" (maybe decodeNamedApiResource)
        |> required "min_level" int
        |> required "min_happiness" (maybe int)
        |> required "min_beauty" (maybe int)
        |> required "min_affection" (maybe int)
        |> required "needs_overworld_rain" bool
        |> required "party_species" (maybe decodeNamedApiResource)
        |> required "party_type" (maybe decodeNamedApiResource)
        |> required "relative_physical_stats" (maybe int)
        |> required "time_of_day" string
        |> required "trade_species" (maybe decodeNamedApiResource)
        |> required "turn_upside_down" bool


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
decodeFlavorBerryMap : Decoder FlavorBerryMap
decodeFlavorBerryMap =
    decode FlavorBerryMap
        |> required "potency" int
        |> required "berry" decodeNamedApiResource


{-| -}
decodeFlavorText : Decoder FlavorText
decodeFlavorText =
    decode FlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource


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
decodeGender : Decoder Gender
decodeGender =
    decode Gender
        |> required "id" int
        |> required "name" string
        |> required "pokemon_species_details" (list decodePokemonSpeciesGender)
        |> required "required_for_evolution" (list decodeNamedApiResource)


{-| -}
decodeGenerationGameIndex : Decoder GenerationGameIndex
decodeGenerationGameIndex =
    decode GenerationGameIndex
        |> required "game_index" int
        |> required "generation" decodeNamedApiResource


{-| -}
decodeGenus : Decoder Genus
decodeGenus =
    decode Genus
        |> required "genus" string
        |> required "language" decodeNamedApiResource


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
decodeGrowthRateExperienceLevel : Decoder GrowthRateExperienceLevel
decodeGrowthRateExperienceLevel =
    decode GrowthRateExperienceLevel
        |> required "level" int
        |> required "experience" int


{-| -}
decodeItem : Decoder Item
decodeItem =
    decode Item
        |> required "id" int
        |> required "name" string
        |> required "cost" int
        |> required "fling_power" (maybe int)
        |> required "fling_effect" (maybe decodeNamedApiResource)
        |> required "attributes" (list decodeNamedApiResource)
        |> required "category" decodeNamedApiResource
        |> required "effect_entries" (list decodeVerboseEffect)
        |> required "flavor_text_entries" (list decodeVersionGroupFlavorText)
        |> required "game_indices" (list decodeGenerationGameIndex)
        |> required "names" (list decodeName)
        |> required "sprites" decodeItemSprites
        |> required "held_by_pokemon" (list decodeItemHolderPokemon)
        |> required "baby_trigger_for" (maybe decodeApiResource)
        |> required "machines" (list decodeMachineVersionDetail)


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
decodeItemCategory : Decoder ItemCategory
decodeItemCategory =
    decode ItemCategory
        |> required "id" int
        |> required "name" string
        |> required "items" (list decodeNamedApiResource)
        |> required "names" (list decodeName)
        |> required "pocket" decodeNamedApiResource


{-| -}
decodeItemFlingEffect : Decoder ItemFlingEffect
decodeItemFlingEffect =
    decode ItemFlingEffect
        |> required "id" int
        |> required "name" string
        |> required "effect_entries" (list decodeEffect)
        |> required "items" (list decodeNamedApiResource)


{-| -}
decodeItemHolderPokemon : Decoder ItemHolderPokemon
decodeItemHolderPokemon =
    decode ItemHolderPokemon
        |> required "pokemon" string
        |> required "version_details" (list decodeItemHolderPokemonVersionDetail)


{-| -}
decodeItemHolderPokemonVersionDetail : Decoder ItemHolderPokemonVersionDetail
decodeItemHolderPokemonVersionDetail =
    decode ItemHolderPokemonVersionDetail
        |> required "rarity" string
        |> required "version" decodeNamedApiResource


{-| -}
decodeItemPocket : Decoder ItemPocket
decodeItemPocket =
    decode ItemPocket
        |> required "id" int
        |> required "name" string
        |> required "categories" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
decodeItemSprites : Decoder ItemSprites
decodeItemSprites =
    decode ItemSprites
        |> required "default" string


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
decodeLocationAreaEncounter : Decoder LocationAreaEncounter
decodeLocationAreaEncounter =
    decode LocationAreaEncounter
        |> required "location_area" decodeNamedApiResource
        |> required "version_details" (list decodeVersionEncounterDetail)


{-| -}
decodeMachine : Decoder Machine
decodeMachine =
    decode Machine
        |> required "id" int
        |> required "item" decodeNamedApiResource
        |> required "move" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


{-| -}
decodeMachineVersionDetail : Decoder MachineVersionDetail
decodeMachineVersionDetail =
    decode MachineVersionDetail
        |> required "machine" decodeApiResource
        |> required "version_group" decodeNamedApiResource


{-| -}
decodeMove : Decoder Move
decodeMove =
    decode Move
        |> required "id" int
        |> required "name" string
        |> required "accuracy" int
        |> required "effect_chance" (maybe int)
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
decodeMoveAilment : Decoder MoveAilment
decodeMoveAilment =
    decode MoveAilment
        |> required "id" int
        |> required "name" string
        |> required "moves" (list decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
decodeMoveBattleStyle : Decoder MoveBattleStyle
decodeMoveBattleStyle =
    decode MoveBattleStyle
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)


{-| -}
decodeMoveBattleStylePreference : Decoder MoveBattleStylePreference
decodeMoveBattleStylePreference =
    decode MoveBattleStylePreference
        |> required "low_hp_preference" int
        |> required "high_hp_preference" int
        |> required "move_battle_style" decodeNamedApiResource


{-| -}
decodeMoveCategory : Decoder MoveCategory
decodeMoveCategory =
    decode MoveCategory
        |> required "id" int
        |> required "name" string
        |> required "moves" (list decodeNamedApiResource)
        |> required "descriptions" (list decodeDescription)


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
decodeMoveFlavorText : Decoder MoveFlavorText
decodeMoveFlavorText =
    decode MoveFlavorText
        |> required "flavor_text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource


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
decodeMoveMetaData : Decoder MoveMetaData
decodeMoveMetaData =
    decode MoveMetaData
        |> required "ailment" decodeNamedApiResource
        |> required "category" decodeNamedApiResource
        |> required "min_hits" (maybe int)
        |> required "max_hits" (maybe int)
        |> required "min_turns" (maybe int)
        |> required "max_turns" (maybe int)
        |> required "drain" int
        |> required "healing" int
        |> required "crit_rate" int
        |> required "ailment_chance" int
        |> required "flinch_chance" int
        |> required "stat_chance" int


{-| -}
decodeMoveStatAffect : Decoder MoveStatAffect
decodeMoveStatAffect =
    decode MoveStatAffect
        |> required "change" int
        |> required "move" decodeNamedApiResource


{-| -}
decodeMoveStatAffectSets : Decoder MoveStatAffectSets
decodeMoveStatAffectSets =
    decode MoveStatAffectSets
        |> required "increase" (list decodeMoveStatAffect)
        |> required "decrease" (list decodeMoveStatAffect)


{-| -}
decodeMoveStatChange : Decoder MoveStatChange
decodeMoveStatChange =
    decode MoveStatChange
        |> required "change" int
        |> required "stat" decodeNamedApiResource


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
decodeName : Decoder Name
decodeName =
    decode Name
        |> required "name" string
        |> required "language" decodeNamedApiResource


{-| -}
decodeNamedApiResource : Decoder NamedApiResource
decodeNamedApiResource =
    decode NamedApiResource
        |> required "name" string
        |> required "url" string


{-| -}
decodeNamedApiResourceList : Decoder NamedApiResourceList
decodeNamedApiResourceList =
    decode NamedApiResourceList
        |> required "count" int
        |> required "next" (maybe string)
        |> required "previous" (maybe string)
        |> required "results" (list decodeNamedApiResource)


{-| -}
decodeNature : Decoder Nature
decodeNature =
    decode Nature
        |> required "id" int
        |> required "name" string
        |> required "decreased_stat" (maybe decodeNamedApiResource)
        |> required "increased_stat" (maybe decodeNamedApiResource)
        |> required "hates_flavor" (maybe decodeNamedApiResource)
        |> required "likes_flavor" (maybe decodeNamedApiResource)
        |> required "pokeathlon_stat_changes" (list decodeNatureStatChange)
        |> required "move_battle_style_preferences" (list decodeMoveBattleStylePreference)
        |> required "names" (list decodeName)


{-| -}
decodeNaturePokeathlonStatAffect : Decoder NaturePokeathlonStatAffect
decodeNaturePokeathlonStatAffect =
    decode NaturePokeathlonStatAffect
        |> required "max_change" int
        |> required "nature" decodeNamedApiResource


{-| -}
decodeNaturePokeathlonStatAffectSets : Decoder NaturePokeathlonStatAffectSets
decodeNaturePokeathlonStatAffectSets =
    decode NaturePokeathlonStatAffectSets
        |> required "increase" (list decodeNaturePokeathlonStatAffect)
        |> required "decrease" (list decodeNaturePokeathlonStatAffect)


{-| -}
decodeNatureStatAffectSets : Decoder NatureStatAffectSets
decodeNatureStatAffectSets =
    decode NatureStatAffectSets
        |> required "increase" (list decodeNamedApiResource)
        |> required "decrease" (list decodeNamedApiResource)


{-| -}
decodeNatureStatChange : Decoder NatureStatChange
decodeNatureStatChange =
    decode NatureStatChange
        |> required "max_change" int
        |> required "pokeathlon_stat" decodeNamedApiResource


{-| -}
decodePalParkArea : Decoder PalParkArea
decodePalParkArea =
    decode PalParkArea
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_encounters" (list decodePalParkEncounterSpecies)


{-| -}
decodePalParkEncounterArea : Decoder PalParkEncounterArea
decodePalParkEncounterArea =
    decode PalParkEncounterArea
        |> required "base_score" int
        |> required "rate" int
        |> required "area" decodeNamedApiResource


{-| -}
decodePalParkEncounterSpecies : Decoder PalParkEncounterSpecies
decodePalParkEncounterSpecies =
    decode PalParkEncounterSpecies
        |> required "base_score" int
        |> required "rate" int
        |> required "pokemon_species" decodeNamedApiResource


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
decodePokeathlonStat : Decoder PokeathlonStat
decodePokeathlonStat =
    decode PokeathlonStat
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "affecting_natures" decodeNaturePokeathlonStatAffectSets


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
        |> required "region" (maybe decodeNamedApiResource)
        |> required "version_groups"
            (list decodeNamedApiResource)


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
decodePokemonAbility : Decoder PokemonAbility
decodePokemonAbility =
    decode PokemonAbility
        |> required "slot" int
        |> required "is_hidden" bool
        |> required "ability" decodeNamedApiResource


{-| -}
decodePokemonColor : Decoder PokemonColor
decodePokemonColor =
    decode PokemonColor
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


{-| -}
decodePokemonEncounter : Decoder PokemonEncounter
decodePokemonEncounter =
    decode PokemonEncounter
        |> required "pokemon" decodeNamedApiResource
        |> required "version_details" (list decodeVersionEncounterDetail)


{-| -}
decodePokemonEntry : Decoder PokemonEntry
decodePokemonEntry =
    decode PokemonEntry
        |> required "entry_number" int
        |> required "pokemon_species" decodeNamedApiResource


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
decodePokemonFormSprites : Decoder PokemonFormSprites
decodePokemonFormSprites =
    decode PokemonFormSprites
        |> required "front_default" string
        |> required "front_shiny" string
        |> required "back_default" string
        |> required "back_shiny" string


{-| -}
decodePokemonHabitat : Decoder PokemonHabitat
decodePokemonHabitat =
    decode PokemonHabitat
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "pokemon_species" (list decodeNamedApiResource)


{-| -}
decodePokemonHeldItem : Decoder PokemonHeldItem
decodePokemonHeldItem =
    decode PokemonHeldItem
        |> required "item" decodeNamedApiResource
        |> required "version_details"
            (list decodePokemonHeldItemVersion)


{-| -}
decodePokemonHeldItemVersion : Decoder PokemonHeldItemVersion
decodePokemonHeldItemVersion =
    decode PokemonHeldItemVersion
        |> required "version" decodeNamedApiResource
        |> required "rarity" int


{-| -}
decodePokemonMove : Decoder PokemonMove
decodePokemonMove =
    decode PokemonMove
        |> required "move" decodeNamedApiResource
        |> required "version_group_details"
            (list decodePokemonMoveVersion)


{-| -}
decodePokemonMoveVersion : Decoder PokemonMoveVersion
decodePokemonMoveVersion =
    decode PokemonMoveVersion
        |> required "move_learn_method" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource
        |> required "level_learned_at" int


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
        |> required "evolves_from_species" (maybe decodeNamedApiResource)
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
decodePokemonSpeciesDexEntry : Decoder PokemonSpeciesDexEntry
decodePokemonSpeciesDexEntry =
    decode PokemonSpeciesDexEntry
        |> required "entry_number" int
        |> required "pokedex" decodeNamedApiResource


{-| -}
decodePokemonSpeciesGender : Decoder PokemonSpeciesGender
decodePokemonSpeciesGender =
    decode PokemonSpeciesGender
        |> required "rate" int
        |> required "pokemon_species" decodeNamedApiResource


{-| -}
decodePokemonSpeciesVariety : Decoder PokemonSpeciesVariety
decodePokemonSpeciesVariety =
    decode PokemonSpeciesVariety
        |> required "is_default" bool
        |> required "pokemon" decodeNamedApiResource


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
decodePokemonStat : Decoder PokemonStat
decodePokemonStat =
    decode PokemonStat
        |> required "effort" int
        |> required "base_stat" int
        |> required "stat" decodeNamedApiResource


{-| -}
decodePokemonType : Decoder PokemonType
decodePokemonType =
    decode PokemonType
        |> required "slot" int
        |> required "type" decodeNamedApiResource


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
        |> required "move_damage_class" (maybe decodeNamedApiResource)
        |> required "names" (list decodeName)


{-| -}
decodeSuperContestEffect : Decoder SuperContestEffect
decodeSuperContestEffect =
    decode SuperContestEffect
        |> required "id" int
        |> required "appeal" int
        |> required "flavor_text_entries" (list decodeFlavorText)
        |> required "moves" (list decodeNamedApiResource)


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
decodeTypePokemon : Decoder TypePokemon
decodeTypePokemon =
    decode TypePokemon
        |> required "slot" int
        |> required "pokemon" decodeNamedApiResource


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
decodeVerboseEffect : Decoder VerboseEffect
decodeVerboseEffect =
    decode VerboseEffect
        |> required "effect" string
        |> required "short_effect" string
        |> required "language" decodeNamedApiResource


{-| -}
decodeVersion : Decoder Version
decodeVersion =
    decode Version
        |> required "id" int
        |> required "name" string
        |> required "names" (list decodeName)
        |> required "version_group" decodeNamedApiResource


{-| -}
decodeVersionEncounterDetail : Decoder VersionEncounterDetail
decodeVersionEncounterDetail =
    decode VersionEncounterDetail
        |> required "version" decodeNamedApiResource
        |> required "max_chance" int
        |> required "encounter_details" (list decodeEncounter)


{-| -}
decodeVersionGameIndex : Decoder VersionGameIndex
decodeVersionGameIndex =
    decode VersionGameIndex
        |> required "game_index" int
        |> required "version" decodeNamedApiResource


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
decodeVersionGroupFlavorText : Decoder VersionGroupFlavorText
decodeVersionGroupFlavorText =
    decode VersionGroupFlavorText
        |> required "text" string
        |> required "language" decodeNamedApiResource
        |> required "version_group" decodeNamedApiResource
