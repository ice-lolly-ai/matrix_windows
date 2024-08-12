#!/bin/bash

clearScreen() {
    clear # Clear the terminal screen
}

printRandomNumberMatrix() {
    running=true
    
    while true; do
        while [ "$running" = true ]; do
            clearScreen
            echo "Random Number Matrix (50x50):"
            for (( i = 0; i < 50; i++ )); do
                for (( j = 0; j < 500; j++ )); do 
                    randomNumber=$(( RANDOM % 100 )) # Generate a random number between 0 and 99
                    printf "%3d " "$randomNumber" # Print number right-aligned within 3 spaces
                done
                echo "" # Move to the next line after each row
            done
            
            echo "Press Spacebar to pause or 'q' to quit..."
            read -rsn1 -t 0.1 input # Read one character without echoing it, with a 0.1-second timeout
            
            case "$input" in
                " ")
                    running=false # Pause generation when spacebar is pressed
                    ;;
                "q")
                    exit 0 # Exit the script if 'q' is pressed
                    ;;
            esac
        done
        
        # Second loop to handle paused state and resume when spacebar is pressed again
        while [ "$running" = false ]; do
            clearScreen
            echo "Paused. Press Spacebar to resume or 'q' to quit..."
            read -rsn1 input # Read one character without echoing it
            
            case "$input" in
                " ")
                    running=true # Resume generation when spacebar is pressed again
                    ;;
                "q")
                    exit 0 # Exit the script if 'q' is pressed
                    ;;
            esac
        done
    done
}

printRandomNumberMatrix
