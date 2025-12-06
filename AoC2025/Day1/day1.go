package main

import( 
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"
	"strconv"
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

		// Main Logic Block

		if direction == "R" {
			dial += amount
		} else {
			dial -= amount
		}

		// Implement over rotation logic
		// Maybe count how many times over it goes?
		// Unsure, fuckin optical migrane ahh coding session

		if dial == 0 {
			count += 1
		}
		fmt.Println(dial)
	
	}
	fmt.Println("Count:", count)
}