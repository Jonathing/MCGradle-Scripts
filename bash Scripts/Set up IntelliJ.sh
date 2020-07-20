#!/bin/bash

# Get arguments
MCGradleArgs=$1

if [ "$MCGradleArgs" != "FromHub" ]
then
    # Clear the screen
    clear

    MCGradleAuthor="Jonathing"
    MCGradleVersion="0.4.1"

    # Print script information
    echo "MCGradle Scripts (for GNU bash)"
    echo "Version $MCGradleVersion"
    echo "Written and Maintained by $MCGradleAuthor"
    echo ""

    # Check for update
    . ./internal/check_update.sh

    # Go to root project directory
    cd ../..

    # Get Forge mod name
    MCProjectName=`grep 'displayName=' src/main/resources/META-INF/mods.toml -m 1`
    MCProjectName=${MCProjectName#*'"'}; MCProjectName=${MCProjectName%'"'*}
fi

# Inform user that IntelliJ set up is done by IntelliJ IDEA
echo "The IntelliJ IDEA workspace for Forge is no longer set up through a command."
echo "To import the project to IntelliJ IDEA, simply open the \"build.gradle\" file as a project."
echo "Gradle will do the rest for you as it imports and indexes the project into IntelliJ."
echo ""

if [ "$MCGradleArgs" != "FromHub" ]
then
    # Return to scripts directory
    cd Scripts/bash\ Scripts/
    read -s -n 1 -p "Press any key to exit MCGradle Scripts..."
else
    read -s -n 1 -p "Press any key to return to the MCGradle Scripts Hub..."
fi

# END OF SCRIPT
echo ""
echo ""
