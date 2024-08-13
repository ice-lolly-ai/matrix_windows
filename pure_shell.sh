#!/bin/zsh

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

mainLoop() {
    while true; do
        clearScreen
        generateRandomNumberMatrix
        echo "Press Spacebar to pause or 'q' to quit..."

        read -t 0.1 -k 1 input
        if [[ "$input" == " " ]]; then
            pauseLoop # Call pauseLoop to handle the paused state
        elif [[ "$input" == "q" ]]; then
            exit 0
        fi
    done
}

pauseLoop() {
    echo "Paused. Press Spacebar to resume or 'q' to quit..."
    while true; do
        read -k 1 input
        if [[ "$input" == " " ]]; then
            break # Exit pause loop and return to main loop
        elif [[ "$input" == "q" ]]; then
            exit 0
        fi
    done
}

mainLoop
