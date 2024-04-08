const arr = [{
    'a': 1,
    'b': 2,
    'c': 3,
    'd': 4
},
{
    'a': 4,
    'b': 5,
    'c': 9,
    'e': 10
}]

const obj = {};

arr.forEach(element => {
    for (const key in element) {
        obj[key] ? obj[key].push(element[key]) : obj[key] = [element[key]];
    }
});

console.log(obj);


// Write a function that takes an array (a) and a value (b) as argument
// The function should remove all instance of b from array a.

function removeElementFromArray(a, b) {
    return a.filter(ele => ele !== b);   
}
console.log(removeElementFromArray([1, 2, 3], 2))    // [1, 3]
console.log(removeElementFromArray([1, 2, '2'], '2'))     //  [1, 2]
console.log(removeElementFromArray([false, '2', 1], false))   //  ['2', 1]
console.log(removeElementFromArray([1, 2, '2', 1], 1))    // [2, '2']


// Write a function that takes a number as argument
// and return array of individual digits of that number.

function numberToArrayOfDigit(num) {
    const result = [];
    const arr = num.toString().split('');
    for (let i = 0; i < arr.length; i++) {
        result.push(parseInt(arr[i]));
    }
    return result;
}

console.log(numberToArrayOfDigit(123));  // [1,2,3]
console.log(numberToArrayOfDigit(428))   // [4,2,8]
console.log(numberToArrayOfDigit(39134)) // [3,9,1,3,4]


// Check if all array element types are same and return true or false

function isAllElementofSameType(arr) {
    const type = typeof (arr[0]);
    for (let i = 0; i < arr.length; i++) {
        if (type === 'object') {
            return Array.isArray(arr[i]) ? arr.every(ele => Array.isArray(ele)) : arr.every(ele => !Array.isArray(ele));
        }
        return arr.every(ele => typeof (ele) === type);
    }
}
console.log(isAllElementofSameType([1, 2, 3]))    // true
console.log(isAllElementofSameType([1, '2', 3]))  // false
console.log(isAllElementofSameType(['1', '2', '3']))   // true
console.log(isAllElementofSameType([[1], [2], [3]]))    // true
console.log(isAllElementofSameType([{ a: 1 }, { b: 2 }, { c: 3 }]))    // true
console.log(isAllElementofSameType([{ a: 1 }, [2], { c: 3 }]))  // false
