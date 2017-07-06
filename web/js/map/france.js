/*
Plugin Name: France regions map
Plugin URI: http://blog.comersis.com/articles/SVG-Raphael-map/
Description: France departements map.
Version: fr-reg-1.0215
Author: S.Marmion ©2015
Author URI: http://www.cmap.comersis.com
License: non-comercial
*/
var mapfill = "#6ED023";                                              // Couleur de remplissage des régions
var maphover_fill = "#44A33D";                                        // Couleur de survol au passage de la souris
var mapstroke = "#FFFFFF";                                            // Couleur des lignes de séparation des régions
var mapstroke_width = 1;                                              // Epaisseur des lignes de séparation des régions (en points)
var mapWidth = (2/3) * window.screen.availHeight;                     // Largeur de la carte en pixels
var mapHeight = (2/3) * window.screen.availHeight;                    // Hauteur de la carte en pixels (facultatif)
				
var paths = {
    Z1: {
        title: "Alsace-Champagne-Ardenne-Lorraine"
    },
    Z2: {
        title: "Aquitaine-Limousin-Poitou-Charentes"
    },
    Z3: {
        title: "Auvergne-Rhône-Alpes"
    },
    Z4: {
        title: "Bourgogne-Franche-Comté"
    },
    Z5: {
        title: "Bretagne"
    },
    Z6: {
        title: "Centre"
    },
    Z7: {
        title: "Corse"
    },
    Z8: {
        title: "Languedoc-Roussillon-Midi-Pyrénées"
    },
    Z9: {
        title: "Ile-de-France"
    },
    Z10: {
        title: "Nord-Pas-de-Calais-Picardie"
    },
    Z11: {
        title: "Normandie"
    },
    Z12: {
        title: "Pays-de-la-Loire"
    },
    Z13: {
        title: "Provence-Alpes-Côte-d-Azur"
    }
}
for(var i in paths) { 
    paths[i].url = '/search/' + paths[i].title ; 
}