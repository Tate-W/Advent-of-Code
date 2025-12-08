package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {

	// Dial starts at 50
	dial := 50
	count := 0
	// Dial rotates all around, L51 = 99 : R51 = 1
	// Need to find the count that it ends up at 0

	// Open file using os import
	file, err := os.Open("input.txt")
	// File open error handling and logging
	if err != nil {
		log.Fatalf("failed to open", err)
	}
	defer file.Close()
	// Create a scanner for the file lines using bufio import
	scanner := bufio.NewScanner(file)
	// Read in each line of the input.txt file
	for scanner.Scan() {
		line := scanner.Text()

		// Parsing out the direction char and rotation amount
		var parse []string
		if strings.Contains(line, "R") {
			parse = strings.SplitAfterN(line, "R", 2)
		} else {
			parse = strings.SplitAfterN(line, "L", 2)
		}
		direction := parse[0]
		amount, _ := strconv.Atoi(parse[1])
		rotations := amount / 100
		amount = amount % 100

		count += rotations

		// Main Logic Block
		if direction == "R" {
			if (amount + dial) > 100 {
				count++
			}
			dial = (amount + dial) % 100
		} else {
			if amount > dial {
				if dial != 0 {
					count++
				}
				dial = (dial - amount) + 100
			} else {
				dial = dial - amount
			}
		}

		if dial == 0 {
			count++
		}

	}
	fmt.Println("Count:", count)
}
