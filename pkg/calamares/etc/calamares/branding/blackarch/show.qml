/* === This file is part of Calamares - <https://github.com/calamares> ===
 *
 *   Copyright 2015, Teo Mrnjavac <teo@kde.org>
 *   Copyright 2018, Adriaan de Groot <groot@kde.org>
 *
 *   Calamares is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   Calamares is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Calamares. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    function nextSlide() {
        console.log("QML Component (default slideshow) Next slide");
        presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 20000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: nextSlide()
    }

    Rectangle {
        id: backdrop
        color: "black"
        anchors.fill: parent
    }

    Slide {
        anchors.fill: parent

        Image {
            id: background1
            source: "1st-slider.png"
            width: 500; height: 275
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
        }
        /*Text {
            anchors.horizontalCenter: background.horizontalCenter
            anchors.top: background.bottom
            text: "This is a customizable QML slideshow.<br/>"+
                  "Distributions should provide their own slideshow and list it in <br/>"+
                  "their custom branding.desc file.<br/>"+
                  "To create a Calamares presentation in QML, import calamares.slideshow,<br/>"+
                  "define a Presentation element with as many Slide elements as needed."
            wrapMode: Text.WordWrap
            width: presentation.width
            horizontalAlignment: Text.Center
        }*/
    }

    Slide {
        anchors.fill: parent

        Image {
            id: background2
            source: "2nd-slider.png"
            width: 500; height: 275
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
        }
    }

    /*Slide {
        centeredText: qsTr("This is a third Slide element.")
    }*/

    // When this slideshow is loaded as a V1 slideshow, only
    // activatedInCalamares is set, which starts the timer (see above).
    //
    // In V2, also the onActivate() and onLeave() methods are called.
    // These example functions log a message (and re-start the slides
    // from the first).
    function onActivate() {
        console.log("QML Component (default slideshow) activated");
        presentation.currentSlide = 0;
    }
    
    function onLeave() {
        console.log("QML Component (default slideshow) deactivated");
    }

}
