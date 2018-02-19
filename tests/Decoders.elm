module Decoders exposing (..)

import Expect exposing (Expectation)
import Json.Decode exposing (Decoder, decodeString)
import PokeApi.Decoders as Decoders
import Test exposing (..)
import Test.Valid as Valid


suite : Test
suite =
    describe "The PokeApi.Decoders module"
        [ describe "PokeApi.Decoders.decodeAbility"
            [ decodeValidPayload
                "Ability"
                Valid.ability
                Decoders.decodeAbility
            ]
        , describe "PokeApi.Decoders.decodeAbilityEffectChange"
            [ decodeValidPayload
                "AbilityEffectChange"
                Valid.abilityEffectChange
                Decoders.decodeAbilityEffectChange
            ]
        , describe "PokeApi.Decoders.decodeAbilityFlavorText"
            [ decodeValidPayload
                "AbilityFlavorText"
                Valid.abilityFlavorText
                Decoders.decodeAbilityFlavorText
            ]
        , describe "PokeApi.Decoders.decodeAbilityPokemon"
            [ decodeValidPayload
                "AbilityPokemon"
                Valid.abilityPokemon
                Decoders.decodeAbilityPokemon
            ]
        , describe "PokeApi.Decoders.decodeApiResource"
            [ decodeValidPayload
                "ApiResource"
                Valid.apiResource
                Decoders.decodeApiResource
            , decodeValidPayload
                "NamedApiResource"
                Valid.namedApiResource
                Decoders.decodeApiResource
            ]
        , describe "PokeApi.Decoders.decodeApiResourceList"
            [ decodeValidPayload
                "ApiResourceList"
                Valid.apiResourceList
                Decoders.decodeApiResourceList
            , decodeValidPayload
                "NamedApiResourceList"
                Valid.namedApiResourceList
                Decoders.decodeApiResourceList
            ]
        , describe "PokeApi.Decoders.decodeApiUrl"
            [ decodeValidPayload
                "ApiUrl"
                Valid.apiUrl
                Decoders.decodeApiUrl
            ]
        , describe "PokeApi.Decoders.decodeApiListUrl"
            [ decodeValidPayload
                "ApiListUrl"
                Valid.apiListUrl
                Decoders.decodeApiListUrl
            ]
        , describe "PokeApi.Decoders.decodeAwesomeName"
            [ decodeValidPayload
                "AwesomeName"
                Valid.awesomeName
                Decoders.decodeAwesomeName
            ]
        , describe "PokeApi.Decoders.decodeBerry"
            [ decodeValidPayload
                "Berry"
                Valid.berry
                Decoders.decodeBerry
            ]
        , describe "PokeApi.Decoders.decodeBerryFirmness"
            [ decodeValidPayload
                "BerryFirmness"
                Valid.berryFirmness
                Decoders.decodeBerryFirmness
            ]
        , describe "PokeApi.Decoders.decodeBerryFlavor"
            [ decodeValidPayload
                "BerryFlavor"
                Valid.berryFlavor
                Decoders.decodeBerryFlavor
            ]
        , describe "PokeApi.Decoders.decodeBerryFlavorMap"
            [ decodeValidPayload
                "BerryFlavorMap"
                Valid.berryFlavorMap
                Decoders.decodeBerryFlavorMap
            ]
        , describe "PokeApi.Decoders.decodeChainLink"
            [ decodeValidPayload
                "ChainLink"
                Valid.chainLink
                Decoders.decodeChainLink
            ]
        , describe "PokeApi.Decoders.decodeCharacteristic"
            [ decodeValidPayload
                "Characteristic"
                Valid.characteristic
                Decoders.decodeCharacteristic
            ]
        , describe "PokeApi.Decoders.decodeContestComboSets"
            [ decodeValidPayload
                "ContestComboSets"
                Valid.contestComboSets
                Decoders.decodeContestComboSets
            ]
        , describe "PokeApi.Decoders.decodeContestComboDetail"
            [ decodeValidPayload
                "ContestComboDetail"
                Valid.contestComboDetail
                Decoders.decodeContestComboDetail
            ]
        , describe "PokeApi.Decoders.decodeContestEffect"
            [ decodeValidPayload
                "ContestEffect"
                Valid.contestEffect
                Decoders.decodeContestEffect
            ]
        , describe "PokeApi.Decoders.decodeContestName"
            [ decodeValidPayload
                "ContestName"
                Valid.contestName
                Decoders.decodeContestName
            ]
        , describe "PokeApi.Decoders.decodeContestType"
            [ decodeValidPayload
                "ContestType"
                Valid.contestType
                Decoders.decodeContestType
            ]
        , describe "PokeApi.Decoders.decodeDescription"
            [ decodeValidPayload
                "Description"
                Valid.description
                Decoders.decodeDescription
            ]
        , describe "PokeApi.Decoders.decodeEffect"
            [ decodeValidPayload
                "Effect"
                Valid.effect
                Decoders.decodeEffect
            ]
        , describe "PokeApi.Decoders.decodeEggGroup"
            [ decodeValidPayload
                "EggGroup"
                Valid.eggGroup
                Decoders.decodeEggGroup
            ]
        , describe "PokeApi.Decoders.decodeEncounter"
            [ decodeValidPayload
                "Encounter"
                Valid.encounter
                Decoders.decodeEncounter
            ]
        , describe "PokeApi.Decoders.decodeEncounterCondition"
            [ decodeValidPayload
                "EncounterCondition"
                Valid.encounterCondition
                Decoders.decodeEncounterCondition
            ]
        , describe "PokeApi.Decoders.decodeEncounterConditionValue"
            [ decodeValidPayload
                "EncounterConditionValue"
                Valid.encounterConditionValue
                Decoders.decodeEncounterConditionValue
            ]
        , describe "PokeApi.Decoders.decodeEncounterMethod"
            [ decodeValidPayload
                "EncounterMethod"
                Valid.encounterMethod
                Decoders.decodeEncounterMethod
            ]
        , describe "PokeApi.Decoders.decodeEncounterMethodRate"
            [ decodeValidPayload
                "EncounterMethodRate"
                Valid.encounterMethodRate
                Decoders.decodeEncounterMethodRate
            ]
        , describe "PokeApi.Decoders.decodeEncounterVersionDetails"
            [ decodeValidPayload
                "EncounterVersionDetails"
                Valid.encounterVersionDetails
                Decoders.decodeEncounterVersionDetails
            ]
        , describe "PokeApi.Decoders.decodeEvolutionChain"
            [ decodeValidPayload
                "EvolutionChain"
                Valid.evolutionChain
                Decoders.decodeEvolutionChain
            ]
        , describe "PokeApi.Decoders.decodeEvolutionDetail"
            [ decodeValidPayload
                "EvolutionDetail"
                Valid.evolutionDetail
                Decoders.decodeEvolutionDetail
            ]
        , describe "PokeApi.Decoders.decodeEvolutionTrigger"
            [ decodeValidPayload
                "EvolutionTrigger"
                Valid.evolutionTrigger
                Decoders.decodeEvolutionTrigger
            ]
        , describe "PokeApi.Decoders.decodeFlavorBerryMap"
            [ decodeValidPayload
                "FlavorBerryMap"
                Valid.flavorBerryMap
                Decoders.decodeFlavorBerryMap
            ]
        , describe "PokeApi.Decoders.decodeFlavorText"
            [ decodeValidPayload
                "FlavorText"
                Valid.flavorText
                Decoders.decodeFlavorText
            ]
        , describe "PokeApi.Decoders.decodeGeneration"
            [ decodeValidPayload
                "Generation"
                Valid.generation
                Decoders.decodeGeneration
            ]
        , describe "PokeApi.Decoders.decodeGender"
            [ decodeValidPayload
                "Gender"
                Valid.gender
                Decoders.decodeGender
            ]
        , describe "PokeApi.Decoders.decodeGenerationGameIndex"
            [ decodeValidPayload
                "GenerationGameIndex"
                Valid.generationGameIndex
                Decoders.decodeGenerationGameIndex
            ]
        , describe "PokeApi.Decoders.decodeGenus"
            [ decodeValidPayload
                "Genus"
                Valid.genus
                Decoders.decodeGenus
            ]
        , describe "PokeApi.Decoders.decodeGrowthRate"
            [ decodeValidPayload
                "GrowthRate"
                Valid.growthRate
                Decoders.decodeGrowthRate
            ]
        , describe "PokeApi.Decoders.decodeGrowthRateExperienceLevel"
            [ decodeValidPayload
                "GrowthRateExperienceLevel"
                Valid.growthRateExperienceLevel
                Decoders.decodeGrowthRateExperienceLevel
            ]
        , describe "PokeApi.Decoders.decodeItem"
            [ decodeValidPayload
                "Item"
                Valid.item
                Decoders.decodeItem
            ]
        , describe "PokeApi.Decoders.decodeItemAttribute"
            [ decodeValidPayload
                "ItemAttribute"
                Valid.itemAttribute
                Decoders.decodeItemAttribute
            ]
        , describe "PokeApi.Decoders.decodeItemCategory"
            [ decodeValidPayload
                "ItemCategory"
                Valid.itemCategory
                Decoders.decodeItemCategory
            ]
        , describe "PokeApi.Decoders.decodeItemFlingEffect"
            [ decodeValidPayload
                "ItemFlingEffect"
                Valid.itemFlingEffect
                Decoders.decodeItemFlingEffect
            ]
        , describe "PokeApi.Decoders.decodeItemHolderPokemon"
            [ decodeValidPayload
                "ItemHolderPokemon"
                Valid.itemHolderPokemon
                Decoders.decodeItemHolderPokemon
            ]
        , describe "PokeApi.Decoders.decodeItemHolderPokemonVersionDetail"
            [ decodeValidPayload
                "ItemHolderPokemonVersionDetail"
                Valid.itemHolderPokemonVersionDetail
                Decoders.decodeItemHolderPokemonVersionDetail
            ]
        , describe "PokeApi.Decoders.decodeItemPocket"
            [ decodeValidPayload
                "ItemPocket"
                Valid.itemPocket
                Decoders.decodeItemPocket
            ]
        , describe "PokeApi.Decoders.decodeItemSprites"
            [ decodeValidPayload
                "ItemSprites"
                Valid.itemSprites
                Decoders.decodeItemSprites
            ]
        , describe "PokeApi.Decoders.decodeLanguage"
            [ decodeValidPayload
                "Language"
                Valid.language
                Decoders.decodeLanguage
            ]
        , describe "PokeApi.Decoders.decodeLocation"
            [ decodeValidPayload
                "Location"
                Valid.location
                Decoders.decodeLocation
            ]
        , describe "PokeApi.Decoders.decodeLocationArea"
            [ decodeValidPayload
                "LocationArea"
                Valid.locationArea
                Decoders.decodeLocationArea
            ]
        , describe "PokeApi.Decoders.decodeLocationAreaEncounter"
            [ decodeValidPayload
                "LocationAreaEncounter"
                Valid.locationAreaEncounter
                Decoders.decodeLocationAreaEncounter
            ]
        , describe "PokeApi.Decoders.decodeMachine"
            [ decodeValidPayload
                "Machine"
                Valid.machine
                Decoders.decodeMachine
            ]
        , describe "PokeApi.Decoders.decodeMachineVersionDetail"
            [ decodeValidPayload
                "MachineVersionDetail"
                Valid.machineVersionDetail
                Decoders.decodeMachineVersionDetail
            ]
        , describe "PokeApi.Decoders.decodeMove"
            [ decodeValidPayload
                "Move"
                Valid.move
                Decoders.decodeMove
            ]
        , describe "PokeApi.Decoders.decodeMoveAilment"
            [ decodeValidPayload
                "MoveAilment"
                Valid.moveAilment
                Decoders.decodeMoveAilment
            ]
        , describe "PokeApi.Decoders.decodeMoveBattleStyle"
            [ decodeValidPayload
                "MoveBattleStyle"
                Valid.moveBattleStyle
                Decoders.decodeMoveBattleStyle
            ]
        , describe "PokeApi.Decoders.decodeMoveBattleStylePreference"
            [ decodeValidPayload
                "MoveBattleStylePreference"
                Valid.moveBattleStylePreference
                Decoders.decodeMoveBattleStylePreference
            ]
        , describe "PokeApi.Decoders.decodeMoveCategory"
            [ decodeValidPayload
                "MoveCategory"
                Valid.moveCategory
                Decoders.decodeMoveCategory
            ]
        , describe "PokeApi.Decoders.decodeMoveDamageClass"
            [ decodeValidPayload
                "MoveDamageClass"
                Valid.moveDamageClass
                Decoders.decodeMoveDamageClass
            ]
        , describe "PokeApi.Decoders.decodeMoveFlavorText"
            [ decodeValidPayload
                "MoveFlavorText"
                Valid.moveFlavorText
                Decoders.decodeMoveFlavorText
            ]
        , describe "PokeApi.Decoders.decodeMoveLearnMethod"
            [ decodeValidPayload
                "MoveLearnMethod"
                Valid.moveLearnMethod
                Decoders.decodeMoveLearnMethod
            ]
        , describe "PokeApi.Decoders.decodeMoveMetaData"
            [ decodeValidPayload
                "MoveMetaData"
                Valid.moveMetaData
                Decoders.decodeMoveMetaData
            ]
        , describe "PokeApi.Decoders.decodeMoveStatAffect"
            [ decodeValidPayload
                "MoveStatAffect"
                Valid.moveStatAffect
                Decoders.decodeMoveStatAffect
            ]
        , describe "PokeApi.Decoders.decodeMoveStatAffectSets"
            [ decodeValidPayload
                "MoveStatAffectSets"
                Valid.moveStatAffectSets
                Decoders.decodeMoveStatAffectSets
            ]
        , describe "PokeApi.Decoders.decodeMoveStatChange"
            [ decodeValidPayload
                "MoveStatChange"
                Valid.moveStatChange
                Decoders.decodeMoveStatChange
            ]
        , describe "PokeApi.Decoders.decodeMoveTarget"
            [ decodeValidPayload
                "MoveTarget"
                Valid.moveTarget
                Decoders.decodeMoveTarget
            ]
        , describe "PokeApi.Decoders.decodeName"
            [ decodeValidPayload
                "Name"
                Valid.name
                Decoders.decodeName
            ]
        , describe "PokeApi.Decoders.decodeNature"
            [ decodeValidPayload
                "Nature"
                Valid.nature
                Decoders.decodeNature
            ]
        , describe "PokeApi.Decoders.decodeNaturePokeathlonStatAffect"
            [ decodeValidPayload
                "NaturePokeathlonStatAffect"
                Valid.naturePokeathlonStatAffect
                Decoders.decodeNaturePokeathlonStatAffect
            ]
        , describe "PokeApi.Decoders.decodeNaturePokeathlonStatAffectSets"
            [ decodeValidPayload
                "NaturePokeathlonStatAffectSets"
                Valid.naturePokeathlonStatAffectSets
                Decoders.decodeNaturePokeathlonStatAffectSets
            ]
        , describe "PokeApi.Decoders.decodeNatureStatAffectSets"
            [ decodeValidPayload
                "NatureStatAffectSets"
                Valid.natureStatAffectSets
                Decoders.decodeNatureStatAffectSets
            ]
        , describe "PokeApi.Decoders.decodeNatureStatChange"
            [ decodeValidPayload
                "NatureStatChange"
                Valid.natureStatChange
                Decoders.decodeNatureStatChange
            ]
        , describe "PokeApi.Decoders.decodeNotFound"
            [ decodeValidPayload
                "NotFound"
                Valid.notFound
                Decoders.decodeNotFound
            ]
        , describe "PokeApi.Decoders.decodePalParkArea"
            [ decodeValidPayload
                "PalParkArea"
                Valid.palParkArea
                Decoders.decodePalParkArea
            ]
        , describe "PokeApi.Decoders.decodePalParkEncounterArea"
            [ decodeValidPayload
                "PalParkEncounterArea"
                Valid.palParkEncounterArea
                Decoders.decodePalParkEncounterArea
            ]
        , describe "PokeApi.Decoders.decodePalParkEncounterSpecies"
            [ decodeValidPayload
                "PalParkEncounterSpecies"
                Valid.palParkEncounterSpecies
                Decoders.decodePalParkEncounterSpecies
            ]
        , describe "PokeApi.Decoders.decodePastMoveStatValues"
            [ decodeValidPayload
                "PastMoveStatValues"
                Valid.pastMoveStatValues
                Decoders.decodePastMoveStatValues
            ]
        , describe "PokeApi.Decoders.decodePokeathlonStat"
            [ decodeValidPayload
                "PokeathlonStat"
                Valid.pokeathlonStat
                Decoders.decodePokeathlonStat
            ]
        , describe "PokeApi.Decoders.decodePokedex"
            [ decodeValidPayload
                "Pokedex"
                Valid.pokedex
                Decoders.decodePokedex
            ]
        , describe "PokeApi.Decoders.decodePokemon"
            [ decodeValidPayload
                "Pokemon"
                Valid.pokemon
                Decoders.decodePokemon
            ]
        , describe "PokeApi.Decoders.decodePokemonAbility"
            [ decodeValidPayload
                "PokemonAbility"
                Valid.pokemonAbility
                Decoders.decodePokemonAbility
            ]
        , describe "PokeApi.Decoders.decodePokemonColor"
            [ decodeValidPayload
                "PokemonColor"
                Valid.pokemonColor
                Decoders.decodePokemonColor
            ]
        , describe "PokeApi.Decoders.decodePokemonEncounter"
            [ decodeValidPayload
                "PokemonEncounter"
                Valid.pokemonEncounter
                Decoders.decodePokemonEncounter
            ]
        , describe "PokeApi.Decoders.decodePokemonEntry"
            [ decodeValidPayload
                "PokemonEntry"
                Valid.pokemonEntry
                Decoders.decodePokemonEntry
            ]
        , describe "PokeApi.Decoders.decodePokemonForm"
            [ decodeValidPayload
                "PokemonForm"
                Valid.pokemonForm
                Decoders.decodePokemonForm
            ]
        , describe "PokeApi.Decoders.decodePokemonFormSprites"
            [ decodeValidPayload
                "PokemonFormSprites"
                Valid.pokemonFormSprites
                Decoders.decodePokemonFormSprites
            ]
        , describe "PokeApi.Decoders.decodePokemonHabitat"
            [ decodeValidPayload
                "PokemonHabitat"
                Valid.pokemonHabitat
                Decoders.decodePokemonHabitat
            ]
        , describe "PokeApi.Decoders.decodePokemonHeldItem"
            [ decodeValidPayload
                "PokemonHeldItem"
                Valid.pokemonHeldItem
                Decoders.decodePokemonHeldItem
            ]
        , describe "PokeApi.Decoders.decodePokemonHeldItemVersion"
            [ decodeValidPayload
                "PokemonHeldItemVersion"
                Valid.pokemonHeldItemVersion
                Decoders.decodePokemonHeldItemVersion
            ]
        , describe "PokeApi.Decoders.decodePokemonMove"
            [ decodeValidPayload
                "PokemonMove"
                Valid.pokemonMove
                Decoders.decodePokemonMove
            ]
        , describe "PokeApi.Decoders.decodePokemonMoveVersion"
            [ decodeValidPayload
                "PokemonMoveVersion"
                Valid.pokemonMoveVersion
                Decoders.decodePokemonMoveVersion
            ]
        , describe "PokeApi.Decoders.decodePokemonShape"
            [ decodeValidPayload
                "PokemonShape"
                Valid.pokemonShape
                Decoders.decodePokemonShape
            ]
        , describe "PokeApi.Decoders.decodePokemonSpecies"
            [ decodeValidPayload
                "PokemonSpecies"
                Valid.pokemonSpecies
                Decoders.decodePokemonSpecies
            ]
        , describe "PokeApi.Decoders.decodePokemonSpeciesDexEntry"
            [ decodeValidPayload
                "PokemonSpeciesDexEntry"
                Valid.pokemonSpeciesDexEntry
                Decoders.decodePokemonSpeciesDexEntry
            ]
        , describe "PokeApi.Decoders.decodePokemonSpeciesGender"
            [ decodeValidPayload
                "PokemonSpeciesGender"
                Valid.pokemonSpeciesGender
                Decoders.decodePokemonSpeciesGender
            ]
        , describe "PokeApi.Decoders.decodePokemonSpeciesVariety"
            [ decodeValidPayload
                "PokemonSpeciesVariety"
                Valid.pokemonSpeciesVariety
                Decoders.decodePokemonSpeciesVariety
            ]
        , describe "PokeApi.Decoders.decodePokemonSprites"
            [ decodeValidPayload
                "PokemonSprites"
                Valid.pokemonSprites
                Decoders.decodePokemonSprites
            ]
        , describe "PokeApi.Decoders.decodePokemonStat"
            [ decodeValidPayload
                "PokemonStat"
                Valid.pokemonStat
                Decoders.decodePokemonStat
            ]
        , describe "PokeApi.Decoders.decodePokemonType"
            [ decodeValidPayload
                "PokemonType"
                Valid.pokemonType
                Decoders.decodePokemonType
            ]
        , describe "PokeApi.Decoders.decodeRegion"
            [ decodeValidPayload
                "Region"
                Valid.region
                Decoders.decodeRegion
            ]
        , describe "PokeApi.Decoders.decodeStat"
            [ decodeValidPayload
                "Stat"
                Valid.stat
                Decoders.decodeStat
            ]
        , describe "PokeApi.Decoders.decodeSuperContestEffect"
            [ decodeValidPayload
                "SuperContestEffect"
                Valid.superContestEffect
                Decoders.decodeSuperContestEffect
            ]
        , describe "PokeApi.Decoders.decodeType"
            [ decodeValidPayload
                "Type"
                Valid.type_
                Decoders.decodeType
            ]
        , describe "PokeApi.Decoders.decodeTypePokemon"
            [ decodeValidPayload
                "TypePokemon"
                Valid.typePokemon
                Decoders.decodeTypePokemon
            ]
        , describe "PokeApi.Decoders.decodeTypeRelations"
            [ decodeValidPayload
                "TypeRelations"
                Valid.typeRelations
                Decoders.decodeTypeRelations
            ]
        , describe "PokeApi.Decoders.decodeVerboseEffect"
            [ decodeValidPayload
                "VerboseEffect"
                Valid.verboseEffect
                Decoders.decodeVerboseEffect
            ]
        , describe "PokeApi.Decoders.decodeVersion"
            [ decodeValidPayload
                "Version"
                Valid.version
                Decoders.decodeVersion
            ]
        , describe "PokeApi.Decoders.decodeVersionEncounterDetail"
            [ decodeValidPayload
                "VersionEncounterDetail"
                Valid.versionEncounterDetail
                Decoders.decodeVersionEncounterDetail
            ]
        , describe "PokeApi.Decoders.decodeVersionGameIndex"
            [ decodeValidPayload
                "VersionGameIndex"
                Valid.versionGameIndex
                Decoders.decodeVersionGameIndex
            ]
        , describe "PokeApi.Decoders.decodeVersionGroup"
            [ decodeValidPayload
                "VersionGroup"
                Valid.versionGroup
                Decoders.decodeVersionGroup
            ]
        , describe "PokeApi.Decoders.decodeVersionGroupFlavorText"
            [ decodeValidPayload
                "VersionGroupFlavorText"
                Valid.versionGroupFlavorText
                Decoders.decodeVersionGroupFlavorText
            ]
        ]


decodeValidPayload : String -> String -> Decoder a -> Test
decodeValidPayload resource validJson decoder =
    test ("can decode a valid " ++ resource) <|
        \_ ->
            case decodeString decoder validJson of
                Ok _ ->
                    Expect.pass

                Err err ->
                    Expect.fail <|
                        "Failed to decode a valid payload"
                            ++ toString err
