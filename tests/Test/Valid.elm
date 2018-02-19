module Test.Valid exposing (..)

{-| Valid payloads copied from Pokeapi documentation: <https://pokeapi.co/docsv2>
-}


ability : String
ability =
    """
    {
      "id": 1,
      "name": "stench",
      "is_main_series": true,
      "generation": {
        "name": "generation-iii",
        "url": "http://pokeapi.co/api/v2/generation/3/"
      },
      "names": [{
        "name": "Stench",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "effect_entries": [{
        "effect": "This Pokémon's damaging moves have a 10% chance to make the target [flinch]{mechanic:flinch} with each hit if they do not already cause flinching as a secondary effect.  This ability does not stack with a held item.  Overworld: The wild encounter rate is halved while this Pokémon is first in the party.",
        "short_effect": "Has a 10% chance of making target Pokémon [flinch]{mechanic:flinch} with each hit.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "effect_changes": [{
        "version_group": {
          "name": "black-white",
          "url": "http://pokeapi.co/api/v2/version-group/11/"
        },
        "effect_entries": [{
          "effect": "Has no effect in battle.",
          "language": {
            "name": "en",
            "url": "http://pokeapi.co/api/v2/language/9/"
          }
        }]
      }],
      "flavor_text_entries": [{
        "flavor_text":
        "臭い\x3000においを\x3000放つことによって 攻撃した\x3000ときに\x3000相手を ひるませることが\x3000ある。",
        "language": {
          "name": "ja",
          "url": "http://pokeapi.co/api/v2/language/11/"
        },
        "version_group": {
          "name": "x-y",
          "url": "http://pokeapi.co/api/v2/version-group/15/"
        }
      }],
      "pokemon": [{
        "is_hidden": true,
        "slot": 3,
        "pokemon": {
          "name": "gloom",
          "url": "http://pokeapi.co/api/v2/pokemon/44/"
        }
      }]
    }
    """


abilityEffectChange : String
abilityEffectChange =
    """
    {
      "version_group": {
        "name": "black-white",
        "url": "http://pokeapi.co/api/v2/version-group/11/"
      },
      "effect_entries": [{
        "effect": "Has no effect in battle.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


abilityFlavorText : String
abilityFlavorText =
    """
    {
      "flavor_text": "臭くて\x3000相手が↵ひるむ\x3000ことがある。",
      "language": {
        "name": "ja",
        "url": "https://pokeapi.co/api/v2/language/11/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    }
    """


abilityPokemon : String
abilityPokemon =
    """
    {
      "is_hidden": true,
      "pokemon": {
        "name": "gloom",
        "url": "https://pokeapi.co/api/v2/pokemon/44/"
      },
      "slot": 3
    }
    """


apiResource : String
apiResource =
    """
    {
      "url": "http://pokeapi.co/api/v2/evolution-chain/1/"
    }
    """


namedApiResource : String
namedApiResource =
    """
    {
      "name": "soft",
      "url": "http://pokeapi.co/api/v2/berry-firmness/2/"
    }
    """


apiResourceList : String
apiResourceList =
    """
    {
      "count": 365,
      "next": "http://pokeapi.co/api/v2/evolution-chain/?limit=20&offset=20",
      "previous": null,
      "results": [{
        "url": "http://pokeapi.co/api/v2/evolution-chain/1/"
      }]
    }
    """


namedApiResourceList : String
namedApiResourceList =
    """
    {
      "count": 248,
      "next": "http://pokeapi.co/api/v2/ability/?limit=20&offset=20",
      "previous": null,
      "results": [{
        "name": "stench",
        "url": "http://pokeapi.co/api/v2/ability/1/"
      }]
    }
    """


apiUrl : String
apiUrl =
    "\"http://pokeapi.co/api/v2/language/5/\""


apiListUrl : String
apiListUrl =
    "\"http://pokeapi.co/api/v2/pokemon/?limit=20&offset=20\""


awesomeName : String
awesomeName =
    """
    {
      "awesome_name": "Pomaceous",
      "language": {
        "name": "en",
        "url": "http://pokeapi.co/api/v2/language/9/"
      }
    }
    """


berry : String
berry =
    """
    {
      "id": 1,
      "name": "cheri",
      "growth_time": 3,
      "max_harvest": 5,
      "natural_gift_power": 60,
      "size": 20,
      "smoothness": 25,
      "soil_dryness": 15,
      "firmness": {
        "name": "soft",
        "url": "http://pokeapi.co/api/v2/berry-firmness/2/"
      },
      "flavors": [{
        "potency": 10,
        "flavor": {
            "name": "spicy",
            "url": "http://pokeapi.co/api/v2/berry-flavor/1/"
        }
      }],
      "item": {
        "name": "cheri-berry",
        "url": "http://pokeapi.co/api/v2/item/126/"
      },
      "natural_gift_type": {
        "name": "fire",
        "url": "http://pokeapi.co/api/v2/type/10/"
      }
    }
    """


berryFirmness : String
berryFirmness =
    """
    {
      "berries": [{
        "url": "https:\\/\\/pokeapi.co\\/api\\/v2\\/berry\\/1\\/",
        "name": "cheri"
      }],
      "names": [{
        "name": "Tendre",
        "language": {
          "url": "https:\\/\\/pokeapi.co\\/api\\/v2\\/language\\/5\\/",
          "name": "fr"
        }
      }],
      "id": 2,
      "name": "soft"
    }
    """


berryFlavor : String
berryFlavor =
    """
    {
      "id": 1,
      "name": "spicy",
      "berries": [{
        "potency": 10,
        "berry": {
          "name": "rowap",
          "url": "http://pokeapi.co/api/v2/berry/64/"
        }
      }],
      "contest_type": {
        "name": "cool",
        "url": "http://pokeapi.co/api/v2/contest-type/1/"
      },
      "names": [{
        "name": "Spicy",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


berryFlavorMap : String
berryFlavorMap =
    """
    {
      "potency": 10,
      "flavor": {
        "name": "spicy",
        "url": "http://pokeapi.co/api/v2/berry-flavor/1/"
      }
    }
    """


chainLink : String
chainLink =
    """
    {
      "is_baby": false,
      "species": {
        "name": "raticate",
        "url": "http://pokeapi.co/api/v2/pokemon-species/20/"
      },
      "evolution_details": [{
        "item": null,
        "trigger": {
          "name": "level-up",
          "url": "http://pokeapi.co/api/v2/evolution-trigger/1/"
        },
        "gender": null,
        "held_item": null,
        "known_move": null,
        "known_move_type": null,
        "location": null,
        "min_level": 20,
        "min_happiness": null,
        "min_beauty": null,
        "min_affection": null,
        "needs_overworld_rain": false,
        "party_species": null,
        "party_type": null,
        "relative_physical_stats": null,
        "time_of_day": "",
        "trade_species": null,
        "turn_upside_down": false
      }],
      "evolves_to": []
    }
    """


characteristic : String
characteristic =
    """
    {
      "id": 1,
      "gene_modulo": 0,
      "possible_values": [0, 5, 10, 15, 20, 25, 30],
      "highest_stat": {
        "name": "hp",
        "url": "http://pokeapi.co/api/v2/stat/1/"
      },
      "descriptions": [{
        "description": "Loves to eat",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


contestComboSets : String
contestComboSets =
    """
    {
      "normal": {
        "use_before": [{
          "name": "double-slap",
          "url": "http://pokeapi.co/api/v2/move/3/"
        }, {
          "name": "headbutt",
          "url": "http://pokeapi.co/api/v2/move/29/"
        }, {
          "name": "feint-attack",
          "url": "http://pokeapi.co/api/v2/move/185/"
        }],
        "use_after": null
      },
      "super": {
        "use_before": null,
        "use_after": null
      }
    }
    """


contestComboDetail : String
contestComboDetail =
    """
    {
      "use_after": null,
      "use_before": {
        "name": "double-slap",
        "url": "https://pokeapi.co/api/v2/move/3/"
      }
    }
    """


contestEffect : String
contestEffect =
    """
    {
      "id": 1,
      "appeal": 4,
      "jam": 0,
      "effect_entries": [{
        "effect": "Gives a high number of appeal points wth no other effects.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "flavor_text_entries": [{
        "flavor_text": "A highly appealing move.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


contestName : String
contestName =
    """
    {
      "name": "Cool",
      "color": "Red",
      "language": {
        "name": "en",
        "url": "http://pokeapi.co/api/v2/language/9/"
      }
    }
    """


contestType : String
contestType =
    """
    {
      "id": 1,
      "name": "cool",
      "berry_flavor": {
        "name": "spicy",
        "url": "http://pokeapi.co/api/v2/berry-flavor/1/"
      },
      "names": [{
        "name": "Cool",
        "color": "Red",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


description : String
description =
    """
    {
      "description": "Rot/Blau/Gelb Kanto Dex",
      "language": {
        "name": "de",
        "url": "http://pokeapi.co/api/v2/language/6/"
      }
    }
    """


effect : String
effect =
    """
    {
      "effect": "Badly poisons the target.",
      "language": {
        "name": "en",
        "url": "http://pokeapi.co/api/v2/language/9/"
      }
    }
    """


eggGroup : String
eggGroup =
    """
    {
      "id": 1,
      "name": "monster",
      "names": [{
        "language": {
          "name": "it",
          "url": "https://pokeapi.co/api/v2/language/8/"
        },
        "name": "Mostro"
      }],
      "pokemon_species": [{
        "name": "blastoise",
        "url": "https://pokeapi.co/api/v2/pokemon-species/9/"
      }]
    }
    """


encounter : String
encounter =
    """
    {
      "min_level": 20,
      "max_level": 30,
      "condition_values": [],
      "chance": 60,
      "method": {
        "name": "surf",
        "url": "http://pokeapi.co/api/v2/encounter-method/5/"
      }
    }
    """


encounterCondition : String
encounterCondition =
    """
    {
      "id": 1,
      "name": "swarm",
      "values": [{
        "name": "swarm-yes",
        "url": "http://pokeapi.co/api/v2/encounter-condition-value/1/"
      }, {
        "name": "swarm-no",
        "url": "http://pokeapi.co/api/v2/encounter-condition-value/2/"
      }],
      "names": [{
        "name": "Schwarm",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }]
    }
    """


encounterConditionValue : String
encounterConditionValue =
    """
    {
      "id": 1,
      "name": "swarm-yes",
      "condition": {
        "name": "swarm",
        "url": "http://pokeapi.co/api/v2/encounter-condition/1/"
      },
      "names": [{
        "name": "WÃ¤hrend eines Schwarms",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }]
    }
    """


encounterMethod : String
encounterMethod =
    """
    {
      "id": 1,
      "name": "walk",
      "order": 1,
      "names": [{
        "name": "Walking in tall grass or a cave",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


encounterMethodRate : String
encounterMethodRate =
    """
    {
      "encounter_method": {
        "name": "old-rod",
        "url": "http://pokeapi.co/api/v2/encounter-method/2/"
      },
      "version_details": [{
        "rate": 25,
        "version": {
          "name": "platinum",
          "url": "http://pokeapi.co/api/v2/version/14/"
        }
      }]
    }
    """


encounterVersionDetails : String
encounterVersionDetails =
    """
    {
      "rate": 25,
      "version": {
        "name": "platinum",
        "url": "http://pokeapi.co/api/v2/version/14/"
      }
    }
    """


evolutionChain : String
evolutionChain =
    """
    {
      "id": 7,
      "baby_trigger_item": null,
      "chain": {
        "is_baby": false,
        "species": {
          "name": "rattata",
          "url": "http://pokeapi.co/api/v2/pokemon-species/19/"
        },
        "evolution_details": null,
        "evolves_to": [{
          "is_baby": false,
          "species": {
            "name": "raticate",
            "url": "http://pokeapi.co/api/v2/pokemon-species/20/"
          },
          "evolution_details": [{
            "item": null,
            "trigger": {
              "name": "level-up",
              "url": "http://pokeapi.co/api/v2/evolution-trigger/1/"
            },
            "gender": null,
            "held_item": null,
            "known_move": null,
            "known_move_type": null,
            "location": null,
            "min_level": 20,
            "min_happiness": null,
            "min_beauty": null,
            "min_affection": null,
            "needs_overworld_rain": false,
            "party_species": null,
            "party_type": null,
            "relative_physical_stats": null,
            "time_of_day": "",
            "trade_species": null,
            "turn_upside_down": false
          }],
          "evolves_to": []
        }]
      }
    }
    """


evolutionDetail : String
evolutionDetail =
    """
    {
      "item": null,
      "trigger": {
        "name": "level-up",
        "url": "http://pokeapi.co/api/v2/evolution-trigger/1/"
      },
      "gender": null,
      "held_item": null,
      "known_move": null,
      "known_move_type": null,
      "location": null,
      "min_level": 20,
      "min_happiness": null,
      "min_beauty": null,
      "min_affection": null,
      "needs_overworld_rain": false,
      "party_species": null,
      "party_type": null,
      "relative_physical_stats": null,
      "time_of_day": "",
      "trade_species": null,
      "turn_upside_down": false
    }
    """


evolutionTrigger : String
evolutionTrigger =
    """
    {
      "id": 1,
      "name": "level-up",
      "names": [{
        "name": "Level up",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "pokemon_species": [{
        "name": "ivysaur",
        "url": "http://pokeapi.co/api/v2/pokemon-species/2/"
      }]
    }
    """


flavorBerryMap : String
flavorBerryMap =
    """
    {
      "potency": 10,
      "berry": {
        "name": "rowap",
        "url": "http://pokeapi.co/api/v2/berry/64/"
      }
    }
    """


flavorText : String
flavorText =
    """
    {
      "flavor_text": "Enables the user to perform first in the next turn.",
      "language": {
        "name": "en",
        "url": "http://pokeapi.co/api/v2/language/9/"
      }
    }
    """


generation : String
generation =
    """
    {
      "id": 1,
      "name": "generation-i",
      "abilities": [],
      "main_region": {
        "name": "kanto",
        "url": "http://pokeapi.co/api/v2/region/1/"
      },
      "moves": [{
        "name": "pound",
        "url": "http://pokeapi.co/api/v2/move/1/"
      }],
      "names": [{
        "name": "Generation I",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "pokemon_species": [{
        "name": "bulbasaur",
        "url": "http://pokeapi.co/api/v2/pokemon-species/1/"
      }],
      "types": [{
        "name": "normal",
        "url": "http://pokeapi.co/api/v2/type/1/"
      }],
      "version_groups": [{
        "name": "red-blue",
        "url": "http://pokeapi.co/api/v2/version-group/1/"
      }]
    }
    """


gender : String
gender =
    """
    {
      "id": 1,
      "name": "female",
      "pokemon_species_details": [{
        "rate": 1,
        "pokemon_species": {
          "name": "bulbasaur",
          "url": "http://pokeapi.co/api/v2/pokemon-species/1/"
        }
      }],
      "required_for_evolution": [{
        "name": "wormadam",
        "url": "http://pokeapi.co/api/v2/pokemon-species/413/"
      }]
    }
    """


generationGameIndex : String
generationGameIndex =
    """
    {
      "game_index": 1,
      "generation": {
        "name": "generation-vi",
        "url": "http://pokeapi.co/api/v2/generation/6/"
      }
    }
    """


genus : String
genus =
    """
    {
      "genus": "Bagworm",
      "language": {
        "name": "en",
        "url": "http://pokeapi.co/api/v2/language/9/"
      }
    }
    """


growthRate : String
growthRate =
    """
    {
      "id": 1,
      "name": "slow",
      "formula": "\\frac{5x^3}{4}",
      "descriptions": [{
        "description": "langsam",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "levels": [{
        "level": 100,
        "experience": 1250000
      }],
      "pokemon_species": [{
        "name": "growlithe",
        "url": "http://pokeapi.co/api/v2/pokemon-species/58/"
      }]
    }
    """


growthRateExperienceLevel : String
growthRateExperienceLevel =
    """
    {
      "level": 100,
      "experience": 1250000
    }
    """


item : String
item =
    """
    {
      "id": 1,
      "name": "master-ball",
      "cost": 0,
      "fling_power": 10,
      "fling_effect": {
        "name":"flinch",
        "url":"http://pokeapi.co/api/v2/item-fling-effect/7/"
      },
      "attributes": [{
        "name": "holdable",
        "url": "http://pokeapi.co/api/v2/item-attribute/5/"
      }],
      "category": {
        "name": "standard-balls",
        "url": "http://pokeapi.co/api/v2/item-category/34/"
      },
      "effect_entries": [{
        "effect": "Used in battle:   [Catches]{mechanic:catch} a wild Pokémon without fail.  If used in a trainer battle, nothing happens and the ball is lost.",
        "short_effect": "Catches a wild Pokémon every time.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "flavor_text_entries": [{
        "text": "The best Poké Ball with the ultimate level of performance. With it, you will catch any wild Pokémon without fail.",
        "version_group": {
          "name": "x-y",
          "url": "http://pokeapi.co/api/v2/version-group/15/"
        },
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "game_indices": [{
        "game_index": 1,
        "generation": {
          "name": "generation-vi",
          "url": "http://pokeapi.co/api/v2/generation/6/"
        }
      }],
      "names": [{
        "name": "Master Ball",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "sprites": {
        "default": "http://pokeapi.co/media/sprites/items/master-ball.png"
      },
      "held_by_pokemon": [{
        "pokemon": {
          "name": "chansey",
          "url": "http://pokeapi.co/api/v2/pokemon/113/"
        },
        "version_details": [{
          "rarity": 50,
          "version": {
            "name": "soulsilver",
            "url": "http://pokeapi.co/api/v2/version/16/"
          }
        }]
      }],
      "baby_trigger_for": {
        "url":"http://pokeapi.co/api/v2/evolution-chain/1/"
      },
      "machines": []
    }
    """


itemAttribute : String
itemAttribute =
    """
    {
      "id": 1,
      "name": "countable",
      "descriptions": [{
        "description": "Has a count in the bag",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "items": [{
        "name": "master-ball",
        "url": "http://pokeapi.co/api/v2/item/1/"
      }],
      "names": [{
        "name": "Countable",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


itemCategory : String
itemCategory =
    """
    {
      "id": 1,
      "name": "stat-boosts",
      "items": [{
        "name": "guard-spec",
        "url": "http://pokeapi.co/api/v2/item/55/"
      }],
      "names": [{
        "name": "Stat boosts",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "pocket": {
        "name": "battle",
        "url": "http://pokeapi.co/api/v2/item-pocket/7/"
      }
    }
    """


itemFlingEffect : String
itemFlingEffect =
    """
    {
      "id": 1,
      "name": "badly-poison",
      "effect_entries": [{
        "effect": "Badly poisons the target.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "items": [{
        "name": "toxic-orb",
        "url": "http://pokeapi.co/api/v2/item/249/"
      }]
    }
    """


itemHolderPokemon : String
itemHolderPokemon =
    """
    {
      "pokemon": {
        "name": "chansey",
        "url": "http://pokeapi.co/api/v2/pokemon/113/"
      },
      "version_details": [{
        "rarity": 50,
        "version": {
          "name": "soulsilver",
          "url": "http://pokeapi.co/api/v2/version/16/"
        }
      }]
    }
    """


itemHolderPokemonVersionDetail : String
itemHolderPokemonVersionDetail =
    """
    {
      "rarity": 50,
      "version": {
        "name": "soulsilver",
        "url": "http://pokeapi.co/api/v2/version/16/"
      }
    }
    """


itemPocket : String
itemPocket =
    """
    {
      "id": 1,
      "name": "misc",
      "categories": [{
        "name": "collectibles",
        "url": "http://pokeapi.co/api/v2/item-category/9/"
      }],
      "names": [{
        "name": "Items",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


itemSprites : String
itemSprites =
    """
    {
      "default": "http://pokeapi.co/media/sprites/items/master-ball.png"
    }
    """


language : String
language =
    """
    {
      "id": 1,
      "name": "ja",
      "official": true,
      "iso639": "ja",
      "iso3166": "jp",
      "names": [{
        "name": "Japanese",
        "language": {
          "name": "en",
            "url": "http://pokeapi.co/api/v2/language/9/"
        }
    }]
}
    """


location : String
location =
    """
    {
      "id": 1,
      "name": "canalave-city",
      "region": {
        "name": "sinnoh",
        "url": "http://pokeapi.co/api/v2/region/4/"
      },
      "names": [{
        "name": "Canalave City",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "game_indices": [{
        "game_index": 7,
        "generation": {
          "name": "generation-iv",
          "url": "http://pokeapi.co/api/v2/generation/4/"
        }
      }],
      "areas": [{
        "name": "canalave-city-area",
        "url": "http://pokeapi.co/api/v2/location-area/1/"
      }]
    }
    """


locationArea : String
locationArea =
    """
    {
      "id": 1,
      "name": "canalave-city-area",
      "game_index": 1,
      "encounter_method_rates": [{
        "encounter_method": {
          "name": "old-rod",
          "url": "http://pokeapi.co/api/v2/encounter-method/2/"
        },
        "version_details": [{
          "rate": 25,
          "version": {
            "name": "platinum",
            "url": "http://pokeapi.co/api/v2/version/14/"
          }
        }]
      }],
      "location": {
        "name": "canalave-city",
        "url": "http://pokeapi.co/api/v2/location/1/"
      },
      "names": [{
        "name": "",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "pokemon_encounters": [{
        "pokemon": {
          "name": "tentacool",
          "url": "http://pokeapi.co/api/v2/pokemon/72/"
        },
        "version_details": [{
          "version": {
            "name": "diamond",
            "url": "http://pokeapi.co/api/v2/version/12/"
          },
          "max_chance": 60,
          "encounter_details": [{
            "min_level": 20,
            "max_level": 30,
            "condition_values": [],
            "chance": 60,
            "method": {
              "name": "surf",
              "url": "http://pokeapi.co/api/v2/encounter-method/5/"
            }
          }]
        }]
      }]
    }
    """


locationAreaEncounter : String
locationAreaEncounter =
    """
    {
      "location_area": {
        "name": "kanto-route-2-south-towards-viridian-city",
        "url": "http://pokeapi.co/api/v2/location-area/296/"
      },
      "version_details": [{
        "max_chance": 10,
        "encounter_details": [{
          "min_level": 7,
          "max_level": 7,
          "condition_values": [{
            "name": "time-morning",
            "url": "http://pokeapi.co/api/v2/encounter-condition-value/3/"
          }],
          "chance": 5,
          "method": {
            "name": "walk",
            "url": "http://pokeapi.co/api/v2/encounter-method/1/"
          }
        }],
        "version": {
          "name": "heartgold",
          "url": "http://pokeapi.co/api/v2/version/15/"
        }
      }]
    }
    """


machine : String
machine =
    """
    {
      "id": 1,
      "item": {
        "name": "tm01",
        "url": "http://localhost:8000/api/v2/item/305/"
      },
      "move": {
        "name": "mega-punch",
        "url": "http://localhost:8000/api/v2/move/5/"
      },
      "version_group": {
        "name": "red-blue",
        "url": "http://localhost:8000/api/v2/version/1/"
      }
    }
    """


machineVersionDetail : String
machineVersionDetail =
    """
    {
      "machine": {
        "url": "https://pokeapi.co/api/v2/machine/1264/"
      },
      "version_group": {
        "url": "https://pokeapi.co/api/v2/version-group/16/",
        "name": "omega-ruby-alpha-sapphire"
      }
    }
    """


move : String
move =
    """
    {
      "id": 1,
      "name": "pound",
      "accuracy": 100,
      "effect_chance": null,
      "pp": 35,
      "priority": 0,
      "power": 40,
      "contest_combos": {
        "normal": {
          "use_before": [{
            "name": "double-slap",
            "url": "http://pokeapi.co/api/v2/move/3/"
          }, {
            "name": "headbutt",
            "url": "http://pokeapi.co/api/v2/move/29/"
          }, {
            "name": "feint-attack",
            "url": "http://pokeapi.co/api/v2/move/185/"
          }],
          "use_after": null
        },
        "super": {
          "use_before": null,
          "use_after": null
        }
      },
      "contest_type": {
        "name": "tough",
        "url": "http://pokeapi.co/api/v2/contest-type/5/"
      },
      "contest_effect": {
        "url": "http://pokeapi.co/api/v2/contest-effect/1/"
      },
      "damage_class": {
        "name": "physical",
        "url": "http://pokeapi.co/api/v2/move-damage-class/2/"
      },
      "effect_entries": [{
        "effect": "Inflicts [regular damage]{mechanic:regular-damage}.",
        "short_effect": "Inflicts regular damage with no additional effect.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "effect_changes": [],
      "generation": {
        "name": "generation-i",
        "url": "http://pokeapi.co/api/v2/generation/1/"
      },
      "meta": {
        "ailment": {
          "name": "none",
          "url": "http://pokeapi.co/api/v2/move-ailment/0/"
        },
        "category": {
          "name": "damage",
          "url": "http://pokeapi.co/api/v2/move-category/0/"
        },
        "min_hits": null,
        "max_hits": null,
        "min_turns": null,
        "max_turns": null,
        "drain": 0,
        "healing": 0,
        "crit_rate": 0,
        "ailment_chance": 0,
        "flinch_chance": 0,
        "stat_chance": 0
      },
      "names": [{
        "name": "Pound",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "past_values": [],
      "stat_changes": [],
      "super_contest_effect": {
        "url": "http://pokeapi.co/api/v2/super-contest-effect/5/"
      },
      "target": {
        "name": "selected-pokemon",
        "url": "http://pokeapi.co/api/v2/move-target/10/"
      },
      "type": {
        "name": "normal",
        "url": "http://pokeapi.co/api/v2/type/1/"
      },
      "flavor_text_entries": [{
        "flavor_text": "Pounds with fore legs or tail.",
        "language": {
          "url": "http://localhost:8000/api/v2/language/9/",
          "name": "en"
        },
        "version_group": {
          "url": "http://localhost:8000/api/v2/version-group/3/",
          "name": "gold-silver"
        }
      }],
      "machines": []
    }
    """


moveAilment : String
moveAilment =
    """
    {
      "id": 1,
      "name": "paralysis",
      "moves": [{
        "name": "thunder-punch",
        "url": "http://pokeapi.co/api/v2/move/9/"
      }],
      "names": [{
        "name": "Paralysis",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


moveBattleStyle : String
moveBattleStyle =
    """
    {
      "id": 1,
      "name": "attack",
      "names": [{
        "name": "Attack",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


moveBattleStylePreference : String
moveBattleStylePreference =
    """
    {
      "low_hp_preference": 32,
      "high_hp_preference": 30,
      "move_battle_style": {
        "name": "attack",
        "url": "http://pokeapi.co/api/v2/move-battle-style/1/"
      }
    }
    """


moveCategory : String
moveCategory =
    """
    {
      "id": 1,
      "name": "ailment",
      "descriptions": [{
        "description": "No damage; inflicts status ailment",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "moves": [{
        "name": "sing",
        "url": "http://pokeapi.co/api/v2/move/47/"
      }]
    }
    """


moveDamageClass : String
moveDamageClass =
    """
    {
      "id": 1,
      "name": "status",
      "descriptions": [{
        "description": "ダメージない",
        "language": {
          "name": "ja-Hrkt",
          "url": "http://pokeapi.co/api/v2/language/1/"
        }
      }],
      "moves": [{
        "name": "swords-dance",
        "url": "http://pokeapi.co/api/v2/move/14/"
      }],
      "names": [{
        "name": "ぶつり",
        "language": {
          "name": "ja-Hrkt",
          "url": "https://pokeapi.co/api/v2/language/1/"
        }
      }]
    }
    """


moveFlavorText : String
moveFlavorText =
    """
    {
      "flavor_text": "Pounds with fore legs or tail.",
      "language": {
        "url": "http://localhost:8000/api/v2/language/9/",
        "name": "en"
      },
      "version_group": {
        "url": "http://localhost:8000/api/v2/version-group/3/",
        "name": "gold-silver"
      }
    }
    """


moveLearnMethod : String
moveLearnMethod =
    """
    {
      "id": 1,
      "name": "level-up",
      "names": [{
        "name": "Level up",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "descriptions": [{
        "description": "Wird gelernt, wenn ein Pokémon ein bestimmtes Level erreicht.",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "version_groups": [{
        "name": "red-blue",
        "url": "http://pokeapi.co/api/v2/version-group/1/"
      }]
    }
    """


moveMetaData : String
moveMetaData =
    """
    {
      "ailment": {
        "name": "none",
        "url": "http://pokeapi.co/api/v2/move-ailment/0/"
      },
      "category": {
        "name": "damage",
        "url": "http://pokeapi.co/api/v2/move-category/0/"
      },
      "min_hits": null,
      "max_hits": null,
      "min_turns": null,
      "max_turns": null,
      "drain": 0,
      "healing": 0,
      "crit_rate": 0,
      "ailment_chance": 0,
      "flinch_chance": 0,
      "stat_chance": 0
    }
    """


moveStatAffect : String
moveStatAffect =
    """
    {
      "change": -1,
      "move": {
        "name": "growl",
        "url": "http://pokeapi.co/api/v2/move/45/"
      }
    }
    """


moveStatAffectSets : String
moveStatAffectSets =
    """
    {
      "increase": [{
        "change": 2,
        "move": {
          "name": "swords-dance",
          "url": "http://pokeapi.co/api/v2/move/14/"
        }
      }],
      "decrease": [{
        "change": -1,
        "move": {
          "name": "growl",
          "url": "http://pokeapi.co/api/v2/move/45/"
        }
      }]
    }
    """


moveStatChange : String
moveStatChange =
    """
    {
      "stat": {
        "name": "attack",
        "url": "https://pokeapi.co/api/v2/stat/2/"
      },
      "change": -1
    }
    """


moveTarget : String
moveTarget =
    """
    {
      "id": 1,
      "name": "specific-move",
      "descriptions": [{
        "description": "Eine spezifische Fähigkeit. Wie diese Fähigkeit genutzt wird, hängt von den genutzten Fähigkeiten ab.",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "moves": [{
        "name": "counter",
        "url": "http://pokeapi.co/api/v2/move/68/"
      }],
      "names": [{
        "name": "Spezifische Fähigkeit",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }]
    }
    """


name : String
name =
    """
    {
      "name": "Walking in tall grass or a cave",
      "language": {
        "name": "en",
        "url": "http://pokeapi.co/api/v2/language/9/"
      }
    }
    """


nature : String
nature =
    """
    {
      "id": 2,
      "name": "bold",
      "decreased_stat": {
        "name": "attack",
        "url": "http://pokeapi.co/api/v2/stat/2/"
      },
      "increased_stat": {
        "name": "defense",
        "url": "http://pokeapi.co/api/v2/stat/3/"
      },
      "likes_flavor": {
        "name": "sour",
        "url": "http://pokeapi.co/api/v2/berry-flavor/5/"
      },
      "hates_flavor": {
        "name": "spicy",
        "url": "http://pokeapi.co/api/v2/berry-flavor/1/"
      },
      "pokeathlon_stat_changes": [{
        "max_change": -2,
        "pokeathlon_stat": {
          "name": "speed",
          "url": "http://pokeapi.co/api/v2/pokeathlon-stat/1/"
        }
      }],
      "move_battle_style_preferences": [{
        "low_hp_preference": 32,
        "high_hp_preference": 30,
        "move_battle_style": {
          "name": "attack",
          "url": "http://pokeapi.co/api/v2/move-battle-style/1/"
        }
      }],
      "names": [{
        "name": "ずぶとい",
        "language": {
          "name": "ja-Hrkt",
          "url": "http://pokeapi.co/api/v2/language/1/"
        }
      }]
    }
    """


naturePokeathlonStatAffect : String
naturePokeathlonStatAffect =
    """
    {
      "max_change": 2,
      "nature": {
        "name": "timid",
        "url": "http://pokeapi.co/api/v2/nature/5/"
      }
    }
    """


naturePokeathlonStatAffectSets : String
naturePokeathlonStatAffectSets =
    """
    {
      "increase": [{
        "max_change": 2,
        "nature": {
          "name": "timid",
          "url": "http://pokeapi.co/api/v2/nature/5/"
        }
      }],
      "decrease": [{
        "max_change": -1,
        "nature": {
          "name": "hardy",
          "url": "http://pokeapi.co/api/v2/nature/1/"
        }
      }]
    }
    """


natureStatAffectSets : String
natureStatAffectSets =
    """
    {
      "increase": [{
        "name": "lonely",
        "url": "http://pokeapi.co/api/v2/nature/6/"
      }],
      "decrease": [{
        "name": "bold",
        "url": "http://pokeapi.co/api/v2/nature/2/"
      }]
    }
    """


natureStatChange : String
natureStatChange =
    """
    {
      "max_change": -2,
      "pokeathlon_stat": {
        "name": "speed",
        "url": "http://pokeapi.co/api/v2/pokeathlon-stat/1/"
      }
    }
    """


notFound : String
notFound =
    """
    {
      "detail": "Not found."
    }
    """


palParkArea : String
palParkArea =
    """
    {
      "id": 1,
      "name": "forest",
      "names": [{
        "name": "Forest",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "pokemon_encounters": [{
        "base_score": 30,
        "rate": 50,
        "pokemon_species": {
          "name": "caterpie",
          "url": "http://pokeapi.co/api/v2/pokemon-species/10/"
        }
      }]
    }
    """


palParkEncounterArea : String
palParkEncounterArea =
    """
    {
      "rate": 30,
      "base_score": 50,
      "area": {
        "name": "field",
        "url": "https://pokeapi.co/api/v2/pal-park-area/2/"
      }
    }
    """


palParkEncounterSpecies : String
palParkEncounterSpecies =
    """
    {
      "base_score": 30,
      "rate": 50,
      "pokemon_species": {
        "name": "caterpie",
        "url": "http://pokeapi.co/api/v2/pokemon-species/10/"
      }
    }
    """


pastMoveStatValues : String
pastMoveStatValues =
    """
    {
      "accuracy": null,
      "pp": null,
      "power": null,
      "effect_entries": [],
      "effect_chance": null,
      "type": {
        "name": "normal",
        "url": "https://pokeapi.co/api/v2/type/1/"
      },
      "version_group": {
        "name": "gold-silver",
        "url": "https://pokeapi.co/api/v2/version-group/3/"
      }
    }
    """


pokeathlonStat : String
pokeathlonStat =
    """
    {
      "id": 1,
      "name": "speed",
      "affecting_natures": {
        "increase": [{
          "max_change": 2,
          "nature": {
            "name": "timid",
            "url": "http://pokeapi.co/api/v2/nature/5/"
          }
        }],
        "decrease": [{
          "max_change": -1,
          "nature": {
            "name": "hardy",
            "url": "http://pokeapi.co/api/v2/nature/1/"
          }
        }]
      },
      "names": [{
        "name": "Speed",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }]
    }
    """


pokedex : String
pokedex =
    """
    {
      "id": 2,
      "name": "kanto",
      "is_main_series": true,
      "descriptions": [{
        "description": "Rot/Blau/Gelb Kanto Dex",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "names": [{
        "name": "Kanto",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "pokemon_entries": [{
        "entry_number": 1,
        "pokemon_species": {
          "name": "bulbasaur",
          "url": "http://pokeapi.co/api/v2/pokemon-species/1/"
        }
      }],
      "region": {
        "name": "kanto",
        "url": "http://pokeapi.co/api/v2/region/1/"
      },
      "version_groups": [{
        "name": "red-blue",
        "url": "http://pokeapi.co/api/v2/version-group/1/"
      }]
    }
    """


pokemon : String
pokemon =
    """
    {
      "id": 12,
      "name": "butterfree",
      "base_experience": 178,
      "height": 11,
      "is_default": true,
      "order": 16,
      "weight": 320,
      "abilities": [{
        "is_hidden": true,
        "slot": 3,
        "ability": {
          "name": "tinted-lens",
          "url": "http://pokeapi.co/api/v2/ability/110/"
        }
      }],
      "forms": [{
        "name": "butterfree",
        "url": "http://pokeapi.co/api/v2/pokemon-form/12/"
      }],
      "game_indices": [{
        "game_index": 12,
        "version": {
          "name": "white-2",
          "url": "http://pokeapi.co/api/v2/version/22/"
        }
      }],
      "held_items": [{
        "item": {
          "name": "silver-powder",
          "url": "http://pokeapi.co/api/v2/item/199/"
        },
        "version_details": [{
          "rarity": 5,
          "version": {
            "name": "y",
            "url": "http://pokeapi.co/api/v2/version/24/"
          }
        }]
      }],
      "location_area_encounters": "/api/v2/pokemon/12/encounters",
      "moves": [{
        "move": {
          "name": "flash",
          "url": "http://pokeapi.co/api/v2/move/148/"
        },
        "version_group_details": [{
          "level_learned_at": 0,
          "version_group": {
            "name": "x-y",
            "url": "http://pokeapi.co/api/v2/version-group/15/"
          },
          "move_learn_method": {
            "name": "machine",
            "url": "http://pokeapi.co/api/v2/move-learn-method/4/"
          }
        }]
      }],
      "species": {
        "name": "butterfree",
        "url": "http://pokeapi.co/api/v2/pokemon-species/12/"
      },
      "sprites": {
        "back_female": "http://pokeapi.co/media/sprites/pokemon/back/female/12.png",
        "back_shiny_female": "http://pokeapi.co/media/sprites/pokemon/back/shiny/female/12.png",
        "back_default": "http://pokeapi.co/media/sprites/pokemon/back/12.png",
        "front_female": "http://pokeapi.co/media/sprites/pokemon/female/12.png",
        "front_shiny_female": "http://pokeapi.co/media/sprites/pokemon/shiny/female/12.png",
        "back_shiny": "http://pokeapi.co/media/sprites/pokemon/back/shiny/12.png",
        "front_default": "http://pokeapi.co/media/sprites/pokemon/12.png",
        "front_shiny": "http://pokeapi.co/media/sprites/pokemon/shiny/12.png"
      },
      "stats": [{
        "base_stat": 70,
        "effort": 0,
        "stat": {
          "name": "speed",
          "url": "http://pokeapi.co/api/v2/stat/6/"
        }
      }],
      "types": [{
        "slot": 2,
        "type": {
          "name": "flying",
          "url": "http://pokeapi.co/api/v2/type/3/"
        }
      }]
    }
    """


pokemonAbility : String
pokemonAbility =
    """
    {
      "is_hidden": true,
      "slot": 3,
      "ability": {
        "name": "tinted-lens",
        "url": "http://pokeapi.co/api/v2/ability/110/"
      }
    }
    """


pokemonColor : String
pokemonColor =
    """
    {
      "id": 1,
      "name": "black",
      "names": [{
        "name": "黒い",
        "language": {
          "name": "ja-Hrkt",
          "url": "http://pokeapi.co/api/v2/language/1/"
        }
      }],
      "pokemon_species": [{
        "name": "snorlax",
        "url": "http://pokeapi.co/api/v2/pokemon-species/143/"
      }]
    }
    """


pokemonEncounter : String
pokemonEncounter =
    """
    {
      "pokemon": {
        "name": "tentacool",
        "url": "http://pokeapi.co/api/v2/pokemon/72/"
      },
      "version_details": [{
        "version": {
          "name": "diamond",
          "url": "http://pokeapi.co/api/v2/version/12/"
        },
        "max_chance": 60,
        "encounter_details": [{
          "min_level": 20,
          "max_level": 30,
          "condition_values": [],
          "chance": 60,
          "method": {
            "name": "surf",
            "url": "http://pokeapi.co/api/v2/encounter-method/5/"
          }
        }]
      }]
    }
    """


pokemonEntry : String
pokemonEntry =
    """
    {
      "entry_number": 1,
      "pokemon_species": {
        "name": "bulbasaur",
        "url": "http://pokeapi.co/api/v2/pokemon-species/1/"
      }
    }
    """


pokemonForm : String
pokemonForm =
    """
    {
      "id": 413,
      "name": "wormadam-plant",
      "order": 503,
      "form_order": 1,
      "is_default": true,
      "is_battle_only": false,
      "is_mega": false,
      "form_name": "plant",
      "pokemon": {
        "name": "wormadam-plant",
        "url": "http://pokeapi.co/api/v2/pokemon/413/"
      },
      "sprites": {
        "back_default": "http://pokeapi.co/media/sprites/pokemon/back/413.png",
        "back_shiny": "http://pokeapi.co/media/sprites/pokemon/back/shiny/413.png",
        "front_default": "http://pokeapi.co/media/sprites/pokemon/413.png",
        "front_shiny": "http://pokeapi.co/media/sprites/pokemon/shiny/413.png"
      },
      "version_group": {
        "name": "diamond-pearl",
        "url": "http://pokeapi.co/api/v2/version-group/8/"
      },
      "names": [{
        "name": "Plant Wormadam",
        "language": {
          "name": "en",
          "url": "https://pokeapi.co/api/v2/language/9/"
        }
      }],
      "form_names": [{
        "name": "草木蓑衣",
        "language": {
          "name": "zh-Hans",
          "url": "https://pokeapi.co/api/v2/language/12/"
        }
      }]
    }
    """


pokemonFormSprites : String
pokemonFormSprites =
    """
    {
      "back_default": "http://pokeapi.co/media/sprites/pokemon/back/413.png",
      "back_shiny": "http://pokeapi.co/media/sprites/pokemon/back/shiny/413.png",
      "front_default": "http://pokeapi.co/media/sprites/pokemon/413.png",
      "front_shiny": "http://pokeapi.co/media/sprites/pokemon/shiny/413.png"
    }
    """


pokemonHabitat : String
pokemonHabitat =
    """
    {
      "id": 1,
      "name": "cave",
      "names": [{
        "name": "grottes",
        "language": {
          "name": "fr",
          "url": "http://pokeapi.co/api/v2/language/5/"
        }
      }],
      "pokemon_species": [{
        "name": "zubat",
        "url": "http://pokeapi.co/api/v2/pokemon-species/41/"
      }]
    }
    """


pokemonHeldItem : String
pokemonHeldItem =
    """
    {
      "item": {
        "name": "silver-powder",
        "url": "http://pokeapi.co/api/v2/item/199/"
      },
      "version_details": [{
        "rarity": 5,
        "version": {
          "name": "y",
          "url": "http://pokeapi.co/api/v2/version/24/"
        }
      }]
    }
    """


pokemonHeldItemVersion : String
pokemonHeldItemVersion =
    """
    {
      "rarity": 5,
      "version": {
        "name": "y",
        "url": "http://pokeapi.co/api/v2/version/24/"
      }
    }
    """


pokemonMove : String
pokemonMove =
    """
    {
      "move": {
        "name": "flash",
        "url": "http://pokeapi.co/api/v2/move/148/"
      },
      "version_group_details": [{
        "level_learned_at": 0,
        "version_group": {
          "name": "x-y",
          "url": "http://pokeapi.co/api/v2/version-group/15/"
        },
        "move_learn_method": {
          "name": "machine",
          "url": "http://pokeapi.co/api/v2/move-learn-method/4/"
        }
      }]
    }
    """


pokemonMoveVersion : String
pokemonMoveVersion =
    """
    {
      "level_learned_at": 0,
      "version_group": {
        "name": "x-y",
        "url": "http://pokeapi.co/api/v2/version-group/15/"
      },
      "move_learn_method": {
        "name": "machine",
        "url": "http://pokeapi.co/api/v2/move-learn-method/4/"
      }
    }
    """


pokemonShape : String
pokemonShape =
    """
    {
      "id": 1,
      "name": "ball",
      "awesome_names": [{
        "awesome_name": "Pomaceous",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "names": [{
        "name": "Ball",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "pokemon_species": [{
        "name": "shellder",
        "url": "http://pokeapi.co/api/v2/pokemon-species/90/"
      }]
    }
    """


pokemonSpecies : String
pokemonSpecies =
    """
    {
      "id": 413,
      "name": "wormadam",
      "order": 441,
      "gender_rate": 8,
      "capture_rate": 45,
      "base_happiness": 70,
      "is_baby": false,
      "hatch_counter": 15,
      "has_gender_differences": false,
      "forms_switchable": false,
      "growth_rate": {
        "name": "medium",
        "url": "http://pokeapi.co/api/v2/growth-rate/2/"
      },
      "pokedex_numbers": [{
        "entry_number": 45,
        "pokedex": {
          "name": "kalos-central",
          "url": "http://pokeapi.co/api/v2/pokedex/12/"
        }
      }],
      "egg_groups": [{
        "name": "bug",
        "url": "http://pokeapi.co/api/v2/egg-group/3/"
      }],
      "color": {
        "name": "gray",
        "url": "http://pokeapi.co/api/v2/pokemon-color/4/"
      },
      "shape": {
        "name": "squiggle",
        "url": "http://pokeapi.co/api/v2/pokemon-shape/2/"
      },
      "evolves_from_species": {
        "name": "burmy",
        "url": "http://pokeapi.co/api/v2/pokemon-species/412/"
      },
      "evolution_chain": {
        "url": "http://pokeapi.co/api/v2/evolution-chain/213/"
      },
      "habitat": null,
      "generation": {
        "name": "generation-iv",
        "url": "http://pokeapi.co/api/v2/generation/4/"
      },
      "names": [{
        "name": "Wormadam",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "pal_park_encounters": [{
        "rate": 20,
        "base_score": 70,
        "area": {
          "name": "forest",
          "url": "https://pokeapi.co/api/v2/pal-park-area/1/"
        }
      }],
      "flavor_text_entries": [{
        "flavor_text": "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        },
        "version": {
          "name": "red",
          "url": "http://pokeapi.co/api/v2/version/1/"
        }
      }],
      "form_descriptions": [{
        "description": "Forms have different stats and movepools.  During evolution, Burmy's current cloak becomes Wormadam's form, and can no longer be changed.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "genera": [{
        "genus": "Bagworm",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "varieties": [{
        "is_default": true,
        "pokemon": {
          "name": "wormadam-plant",
          "url": "http://pokeapi.co/api/v2/pokemon/413/"
        }
      }]
    }
    """


pokemonSpeciesDexEntry : String
pokemonSpeciesDexEntry =
    """
    {
      "entry_number": 45,
      "pokedex": {
        "name": "kalos-central",
        "url": "http://pokeapi.co/api/v2/pokedex/12/"
      }
    }
    """


pokemonSpeciesGender : String
pokemonSpeciesGender =
    """
    {
      "rate": 1,
      "pokemon_species": {
        "name": "bulbasaur",
        "url": "http://pokeapi.co/api/v2/pokemon-species/1/"
      }
    }
    """


pokemonSpeciesVariety : String
pokemonSpeciesVariety =
    """
    {
      "is_default": true,
      "pokemon": {
        "name": "wormadam-plant",
        "url": "http://pokeapi.co/api/v2/pokemon/413/"
      }
    }
    """


pokemonSprites : String
pokemonSprites =
    """
    {
      "back_female": "http://pokeapi.co/media/sprites/pokemon/back/female/12.png",
      "back_shiny_female": "http://pokeapi.co/media/sprites/pokemon/back/shiny/female/12.png",
      "back_default": "http://pokeapi.co/media/sprites/pokemon/back/12.png",
      "front_female": "http://pokeapi.co/media/sprites/pokemon/female/12.png",
      "front_shiny_female": "http://pokeapi.co/media/sprites/pokemon/shiny/female/12.png",
      "back_shiny": "http://pokeapi.co/media/sprites/pokemon/back/shiny/12.png",
      "front_default": "http://pokeapi.co/media/sprites/pokemon/12.png",
      "front_shiny": "http://pokeapi.co/media/sprites/pokemon/shiny/12.png"
    }
    """


pokemonStat : String
pokemonStat =
    """
    {
      "base_stat": 70,
      "effort": 0,
      "stat": {
        "name": "speed",
        "url": "http://pokeapi.co/api/v2/stat/6/"
      }
    }
    """


pokemonType : String
pokemonType =
    """
    {
      "slot": 2,
      "type": {
        "name": "flying",
        "url": "http://pokeapi.co/api/v2/type/3/"
      }
    }
    """


region : String
region =
    """
    {
      "id": 1,
      "name": "kanto",
      "locations": [{
        "name": "celadon-city",
        "url": "http://pokeapi.co/api/v2/location/67/"
      }],
      "main_generation": {
        "name": "generation-i",
        "url": "http://pokeapi.co/api/v2/generation/1/"
      },
      "names": [{
        "name": "Kanto",
        "language": {
          "name": "de",
          "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "pokedexes": [{
        "name": "kanto",
        "url": "http://pokeapi.co/api/v2/pokedex/2/"
      }],
      "version_groups": [{
        "name": "red-blue",
        "url": "http://pokeapi.co/api/v2/version-group/1/"
      }]
    }
    """


stat : String
stat =
    """
    {
      "id": 2,
      "name": "attack",
      "game_index": 2,
      "is_battle_only": false,
      "affecting_moves": {
        "increase": [{
          "change": 2,
          "move": {
            "name": "swords-dance",
            "url": "http://pokeapi.co/api/v2/move/14/"
          }
        }],
        "decrease": [{
          "change": -1,
          "move": {
            "name": "growl",
            "url": "http://pokeapi.co/api/v2/move/45/"
          }
        }]
      },
      "affecting_natures": {
        "increase": [{
          "name": "lonely",
          "url": "http://pokeapi.co/api/v2/nature/6/"
        }],
        "decrease": [{
          "name": "bold",
          "url": "http://pokeapi.co/api/v2/nature/2/"
        }]
      },
      "characteristics": [{
        "url": "http://pokeapi.co/api/v2/characteristic/2/"
      }],
      "move_damage_class": {
        "name": "physical",
        "url": "http://pokeapi.co/api/v2/move-damage-class/2/"
      },
      "names": [{
        "name": "こうげき",
        "language": {
          "name": "ja-Hrkt",
          "url": "http://pokeapi.co/api/v2/language/1/"
        }
      }]
    }
    """


superContestEffect : String
superContestEffect =
    """
    {
      "id": 1,
      "appeal": 2,
      "flavor_text_entries": [{
        "flavor_text": "Enables the user to perform first in the next turn.",
        "language": {
          "name": "en",
          "url": "http://pokeapi.co/api/v2/language/9/"
        }
      }],
      "moves": [{
        "name": "agility",
        "url": "http://pokeapi.co/api/v2/move/97/"
      }]
    }
    """


type_ : String
type_ =
    """
    {
      "id": 5,
      "name": "ground",
      "damage_relations": {
        "no_damage_to": [{
          "name": "flying",
          "url": "http://pokeapi.co/api/v2/type/3/"
        }],
        "half_damage_to": [{
          "name": "bug",
          "url": "http://pokeapi.co/api/v2/type/7/"
        }],
        "double_damage_to": [{
          "name": "poison",
          "url": "http://pokeapi.co/api/v2/type/4/"
        }],
        "no_damage_from": [{
          "name": "electric",
          "url": "http://pokeapi.co/api/v2/type/13/"
        }],
        "half_damage_from": [{
          "name": "poison",
          "url": "http://pokeapi.co/api/v2/type/4/"
        }],
        "double_damage_from": [{
          "name": "water",
          "url": "http://pokeapi.co/api/v2/type/11/"
        }]
      },
      "game_indices": [{
        "game_index": 4,
        "generation": {
          "name": "generation-i",
          "url": "http://pokeapi.co/api/v2/generation/1/"
        }
      }],
      "generation": {
        "name": "generation-i",
        "url": "http://pokeapi.co/api/v2/generation/1/"
      },
      "move_damage_class": {
        "name": "physical",
        "url": "http://pokeapi.co/api/v2/move-damage-class/2/"
      },
      "names": [{
        "name": "땅",
        "language": {
          "name": "ko",
          "url": "https://pokeapi.co/api/v2/language/3/"
        }
      }],
      "pokemon": [{
        "slot": 1,
        "pokemon": {
          "name": "sandshrew",
          "url": "http://pokeapi.co/api/v2/pokemon/27/"
        }
      }],
      "moves": [{
        "name": "sand-attack",
        "url": "http://pokeapi.co/api/v2/move/28/"
      }]
    }
    """


typePokemon : String
typePokemon =
    """
    {
      "slot": 1,
      "pokemon": {
        "name": "sandshrew",
        "url": "http://pokeapi.co/api/v2/pokemon/27/"
      }
    }
    """


typeRelations : String
typeRelations =
    """
    {
      "no_damage_to": [{
        "name": "flying",
        "url": "http://pokeapi.co/api/v2/type/3/"
      }],
      "half_damage_to": [{
        "name": "bug",
        "url": "http://pokeapi.co/api/v2/type/7/"
      }],
      "double_damage_to": [{
        "name": "poison",
        "url": "http://pokeapi.co/api/v2/type/4/"
      }],
      "no_damage_from": [{
        "name": "electric",
        "url": "http://pokeapi.co/api/v2/type/13/"
      }],
      "half_damage_from": [{
        "name": "poison",
        "url": "http://pokeapi.co/api/v2/type/4/"
      }],
      "double_damage_from": [{
        "name": "water",
        "url": "http://pokeapi.co/api/v2/type/11/"
      }]
    }
    """


verboseEffect : String
verboseEffect =
    """
    {
      "effect": "This Pokémon's damaging moves have a 10% chance to make the target flinch with each hit if they do not already cause flinching as a secondary effect.↵↵This ability does not stack with a held item.↵↵Overworld: The wild encounter rate is halved while this Pokémon is first in the party.",
      "short_effect": "Has a 10% chance of making target Pokémon flinch with each hit.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      }
    }
    """


version : String
version =
    """
    {
      "id": 1,
      "name": "red",
      "names": [{
        "name": "Rot",
        "language": {
            "name": "de",
            "url": "http://pokeapi.co/api/v2/language/6/"
        }
      }],
      "version_group": {
        "name": "red-blue",
        "url": "http://pokeapi.co/api/v2/version-group/1/"
      }
    }
    """


versionEncounterDetail : String
versionEncounterDetail =
    """
    {
      "version": {
        "name": "diamond",
        "url": "https://pokeapi.co/api/v2/version/12/"
      },
      "max_chance": 40,
      "encounter_details": [{
        "min_level": 30,
        "max_level": 40,
        "chance": 40,
        "method": {
          "name": "super-rod",
          "url": "https://pokeapi.co/api/v2/encounter-method/4/"
        },
        "condition_values": []
      }]
    }
    """


versionGameIndex : String
versionGameIndex =
    """
    {
      "game_index": 1,
      "version": {
        "name": "heartgold",
        "url": "https://pokeapi.co/api/v2/version/15/"
      }
    }
    """


versionGroup : String
versionGroup =
    """
    {
      "id": 1,
      "name": "red-blue",
      "order": 1,
      "generation": {
        "name": "generation-i",
        "url": "http://pokeapi.co/api/v2/generation/1/"
      },
      "move_learn_methods": [{
        "name": "level-up",
        "url": "http://pokeapi.co/api/v2/move-learn-method/1/"
      }],
      "pokedexes": [{
        "name": "kanto",
        "url": "http://pokeapi.co/api/v2/pokedex/2/"
      }],
      "regions": [{
        "name": "kanto",
        "url": "http://pokeapi.co/api/v2/region/1/"
      }],
      "versions": [{
        "name": "red",
        "url": "http://pokeapi.co/api/v2/version/1/"
      }]
    }
    """


versionGroupFlavorText : String
versionGroupFlavorText =
    """
    {
      "text": "必定能捉到野生宝可梦的，↵性能最好的球。",
      "language": {
        "name": "zh-Hans",
        "url": "https://pokeapi.co/api/v2/language/12/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    }
    """
