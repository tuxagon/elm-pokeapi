module PokeApi exposing (..)

import Http


type alias ApiResource =
    { url : String
    }


type alias ApiResourceList =
    { count : Int
    , next : String
    , previous : Bool
    , results : List ApiResource
    }
