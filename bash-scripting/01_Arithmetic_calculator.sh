#!/usr/bin/env bash

arithmetic_calculator() {


read -p "Enter first number: " first_number
read -p "Enter second number: " second_number

addition=$((first_number + second_number))
subtraction=$((first_number - second_number))
multiplication=$((first_number * second_number))

if [ "$second_number" -eq 0 ]; then
    echo "Error: division by 0 is not allowed"
    exit 1
else
    division=$((first_number / second_number))
fi

echo "Results: $first_number + $second_number = $addition  $first_number - $second_number = $subtraction  $first_number × $second_number = $multiplication  $first_number ÷ $second_number = $division"

}

arithmetic_calculator