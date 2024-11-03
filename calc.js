function add(x, y) {
    return x + y;
}

function subtract(x, y) {
    return x - y;
}

function multiply(x, y) {
    return x * y;
}

function divide(x, y) {
    if (y !== 0) {
        return x / y;
    } else {
        return "Error! Division by zero.";
    }
}

const prompt = require('prompt-sync')();

console.log("Select operation:");
console.log("1. Add");
console.log("2. Subtract");
console.log("3. Multiply");
console.log("4. Divide");

const choice = prompt("Enter choice (1/2/3/4): ");
const num1 = parseFloat(prompt("Enter first number: "));
const num2 = parseFloat(prompt("Enter second number: "));

let result;
switch (choice) {
    case '1':
        result = add(num1, num2);
        break;
    case '2':
        result = subtract(num1, num2);
        break;
    case '3':
        result = multiply(num1, num2);
        break;
    case '4':
        result = divide(num1, num2);
        break;
    default:
        result = "Invalid input";
}

console.log(`Result: ${result}`);
