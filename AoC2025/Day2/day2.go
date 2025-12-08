package main

import (
	"bufio"
	"fmt"
	"log"
	"math"
	"os"
	"strconv"
	"strings"
)

func main() {
	// Open file using os import
	file, err := os.Open("input.txt")
	// File open error handling and logging
	if err != nil {
		log.Fatalf("failed to open", err)
	}
	defer file.Close()
	// Create a scanner for the file lines using bufio import
	scanner := bufio.NewScanner(file)

	part1(scanner)
	file.Seek(0, 0)
	scanner = bufio.NewScanner(file)
	part2(scanner)
}

func part1(scanner *bufio.Scanner) {
	invalidTotal := 0
	for scanner.Scan() {
		// Count thru the range
		// Check even #, if no ignore
		// Split number in half and compare both sides
		// If same, add full number to the count
		allRanges := strings.Split(scanner.Text(), ",")

		for _, rang := range allRanges {
			vals := strings.Split(rang, "-")
			// Convert to ints
			current, _ := strconv.Atoi(vals[0])
			max, _ := strconv.Atoi(vals[1])

			for current <= max {
				numChars := int(math.Floor(math.Log10(float64(current))) + 1)

				if numChars%2 == 0 {
					rightHalf := current % int(math.Pow(10, float64(numChars/2)))
					leftHalf := current / int(math.Pow(10, float64(numChars/2)))

					if rightHalf == leftHalf {
						invalidTotal += current
					}
				}

				current++

			}

		}
	}

	fmt.Println(invalidTotal)

}

func part2(scanner *bufio.Scanner) {

	for scanner.Scan() {
		line := scanner.Text()
		fmt.Println(line)
	}
}
