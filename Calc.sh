#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display the menu
function display_menu {
    echo -e "${BLUE}Simple Colored Calculator${NC}"
    echo -e "${YELLOW}1) Addition${NC}"
    echo -e "${YELLOW}2) Subtraction${NC}"
    echo -e "${YELLOW}3) Multiplication${NC}"
    echo -e "${YELLOW}4) Division${NC}"
    echo -e "${YELLOW}5) Exit${NC}"
}

# Main loop
while true; do
    display_menu
    read -p "Select an option: " option

    if [[ $option -eq 5 ]]; then
        echo -e "${GREEN}Exiting...${NC}"
        break
    fi

    read -p "Enter first number: " num1
    read -p "Enter second number: " num2

    case $option in
        1)
            result=$(echo "$num1 + $num2" | bc)
            echo -e "${GREEN}Result: $result${NC}"
            ;;
        2)
            result=$(echo "$num1 - $num2" | bc)
            echo -e "${GREEN}Result: $result${NC}"
            ;;
        3)
            result=$(echo "$num1 * $num2" | bc)
            echo -e "${GREEN}Result: $result${NC}"
            ;;
        4)
            if [ "$num2" -ne 0 ]; then
                result=$(echo "scale=2; $num1 / $num2" | bc)
                echo -e "${GREEN}Result: $result${NC}"
            else
                echo -e "${RED}Error: Division by zero!${NC}"
            fi
            ;;
        *)
            echo -e "${RED}Invalid option! Please try again.${NC}"
            ;;
    esac

    echo ""
done
