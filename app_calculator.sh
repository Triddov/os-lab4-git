#!/bin/bash
# Простой калькулятор: выводит сумму двух целых чисел.
# Использование: ./app_calculator.sh <num1> <num2>

num1=$1
num2=$2

if [ -z "$num1" ] || [ -z "$num2" ]; then
    echo "Ошибка: не переданы аргументы"
    exit 1
fi

echo "Сумма: $((num1 + num2))"
