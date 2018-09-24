pragma solidity ^0.4.24;

contract owned {
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
}

contract Hello is owned {
   
   function HelloWorld () public view returns (string) {
        require (msg.sender == owner);
        return "Hello World";
   }
}
