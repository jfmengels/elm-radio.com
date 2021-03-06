module Layout exposing (view)

import FontAwesome as Fa
import Html exposing (..)
import Html.Attributes as Attr exposing (class)
import Html.Events
import MenuSvg
import Pages exposing (pages)
import Pages.PagePath as PagePath


href page =
    Attr.href (PagePath.toString page)


view : { model | menuOpen : Bool } -> msg -> List (Html msg) -> Html msg
view model toggleMenuMsg main =
    Html.div [ Attr.id "body", class "font-body bg-light min-h-screen flex flex-col" ]
        [ Html.nav
            [ Attr.class "flex font-display items-center justify-between flex-wrap bg-dark p-6 shadow-lg waves-bg "
            ]
            [ a [ href Pages.pages.index, class "flex flex-wrap justify-center flex-grow" ]
                [ div [ class "flex flex-wrap justify-center items-center flex-grow text-light mr-6" ]
                    [ img
                        [ class "pr-6"
                        , Attr.src "/logo.svg"
                        , Attr.alt "Elm Radio logo"
                        ]
                        []
                    , span [ class "font-semibold text-3xl" ] [ text "elm radio" ]
                    ]
                ]
            , div [ class "w-full block lg:flex lg:items-center lg:w-auto text-lg" ]
                [ a [ class "text-center block mt-4 lg:inline-block lg:mt-0 text-light hover:text-light mr-4", Attr.href "#responsive-header" ]
                    [ text "Tune in to the tools and techniques in the Elm ecosystem." ]
                ]
            ]
        , div [ class "flex justify-center " ]
            [ div [ class "flex-grow max-w-4xl px-8 py-4" ] main ]

        -- , Html.footer
        --     [ Attr.class "flex font-display justify-center flex-wrap bg-dark p-6 waves-bg"
        --     ]
        --     [ icons ]
        ]


icons =
    Html.div
        [--     Element.centerX
         -- , Element.spacing 12
         -- , Font.size 30
        ]
        [ iconLink
            { icon = Fa.twitterSquare
            , alt = "Twitter"
            , url = "https://twitter.com/elm_pages/"
            }
        , iconLink
            { icon = Fa.youTubeSquare
            , alt = "YouTube"
            , url = "https://www.youtube.com/user/dillonkearns"
            }
        , iconLink
            { icon = Fa.slack
            , alt = "Slack"
            , url = "slack://channel?id=CNSNETV37&team=T0CJ5UNHK"
            }
        ]


iconLink : { icon : Fa.Icon, alt : String, url : String } -> Html msg
iconLink { icon, alt, url } =
    a
        [ Attr.href url
        , class "text-light hover:text-gray-400 mr-4 text-2xl"
        , Attr.attribute "aria-label" alt
        , Attr.rel "noopener"
        ]
        [ Fa.icon icon ]
