#!/bin/bash

clearScreen() {
    clear # Clear the terminal screen
}

generateRandomNumberMatrix() {
    for (( i = 0; i < 50; i++ )); do
        for (( j = 0; j < 50; j++ )); do 
            randomNumber=$(( RANDOM % 100 )) # Generate a random number between 0 and 99
            printf "%3d " "$randomNumber" # Print number right-aligned within 3 spaces
        done
        echo "" # Move to the next line after each row
    done
}

pauseLoop() {
    echo "Paused. Press Spacebar to resume or 'q' to quit..."
    while true; do
        read -rsn1 input
        case "$input" in
            " ")
                break # Resume when spacebar is pressed again
                ;;
            "q")
                exit 0 # Exit the script if 'q' is pressed
                ;;
        esac
    done
}

mainLoop() {
    while true; do
        clearScreen
        generateRandomNumberMatrix
        echo "Press Spacebar to pause or 'q' to quit..."

        # Use read with timeout for non-blocking input check
        read -rsn1 -t 0.1 input
        case "$input" in
            " ")
                pauseLoop # Call pauseLoop to handle the paused state
                ;;
            "q")
                exit 0 # Exit the script if 'q' is pressed
                ;;
        esac
    done
}

mainLoop
