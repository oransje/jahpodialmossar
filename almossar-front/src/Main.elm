module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Json.Decode as Decode
import Http
import Browser.Events exposing (onKeyDown)

-- MAIN

main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }


-- MODEL

type alias Model =
    { message : String
    , loading : Bool
    }

init : () -> ( Model, Cmd Msg )
init _ =
    ( Model "" False, getData )


-- UPDATE

type Msg
    = GotData (Result Http.Error ApiData)
    | GetData
    | SpacePressed

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotData (Ok apiData) ->
            ( { model | message = apiData.message, loading = False }, Cmd.none )

        GotData (Err _) ->
            ( { model | message = "Erro de Conexão", loading = False }, Cmd.none )

        GetData ->
            ( { model | loading = True }, getData )

        SpacePressed ->
            ( { model | loading = True }, getData )


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "jahpodialmossar POC" ]
        
        , if model.loading then
            p [] [ text "Carregando..." ]
          else
            div [ class "container"]
                [
                    -- p [] [ text "Mensagem da API:"],
                    h2 [] [ text model.message ]
                ]
          , h3 [] [ text "Aperte " ]
          ,  button [ onClick GetData ] [ text "Espaço" ],
            h3 [] [ text "ou clique aqui para atualizar" ]
        ]


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
    onKeyDown (Decode.map alwaysSpacePressed (Decode.field "keyCode" Decode.int))


alwaysSpacePressed : Int -> Msg
alwaysSpacePressed keyCode =
    if keyCode == 32 then
        SpacePressed
    else
        GetData


-- HTTP REQUEST

type alias ApiData =
    { message : String
    , time : String
    }

getData : Cmd Msg
getData =
    Http.get
        { url = "http://localhost:8080/api"
        , expect = Http.expectJson GotData apiDataDecoder
        }

apiDataDecoder : Decode.Decoder ApiData
apiDataDecoder =
    Decode.map2 ApiData
        (Decode.field "message" Decode.string)
        (Decode.field "time" Decode.string)
