
// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity 0.8.24;

/*
    ✅ Has at least one uppercase letter
    ✅ Has at least one lowercase letter
    ✅ Has at least one number (0–9)
    ✅ Has at least one special character @!_$%#
    ✅ Has a minimum length of 10 characters

    If all are true → emit an event with the message:

    “The password meets the established requirements”
*/

contract PasswordValidator{

    uint8 public minimunCharacters = 10;
    mapping(bytes1 => bool) private specialCharacters;

    modifier isPasswordEmpty(string memory password_) {
        bytes memory bPassword = bytes(password_);

        if( bPassword.length == 0 ) revert();
        _;
    }

    event eventValidatePassword ( string password_, string result_ );

    constructor() {
        specialCharacters["@"] = true;
        specialCharacters["!"] = true;
        specialCharacters["_"] = true;
        specialCharacters["$"] = true;
        specialCharacters["%"] = true;
        specialCharacters["#"] = true;
    }
    
    function validatePassword(string memory password_) 
    public isPasswordEmpty( password_ )
    returns (string memory){

        string memory result = "The password does not meet the established requirements";

        if( haveMinimunLenght(password_) && 
            hasLowerCaseLetter(password_) && 
            hasUpperCaseLetter(password_) &&
            hasNumber(password_) &&
            hasSpecialCharacter(password_) ){
            
            result = "The password meets the established requirements";
        }

        emit eventValidatePassword( password_, result );

        return result;
    }

    function haveMinimunLenght( string memory password_ )
    internal view 
    returns (bool){

        if( bytes(password_).length > minimunCharacters )
            return true;

        return false;        
    }
    
    function hasLowerCaseLetter( string memory password_ )
    internal pure
    returns (bool){
        //abcdefghijklmnopqrstuvwxyz
        bytes memory bPassword = bytes(password_);

        for (uint8 i=0; i < bPassword.length; i++){
            if( uint8( bPassword[i] ) >= 97 && 
                uint8( bPassword[i] ) <= 122 )
                return true;
        }

        return false;        
    }

    function hasUpperCaseLetter( string memory password_ )
    internal pure
    returns (bool){
        //ABCDEFGHIJKLMNOPQRSTUVWXYZ
        bytes memory bPassword = bytes(password_);

        for (uint8 i=0; i < bPassword.length; i++){
            if( uint8( bPassword[i] ) >= 65 && 
                uint8( bPassword[i] ) <= 90 )
                return true;
        }

        return false;
    }

    function hasNumber( string memory password_ )
    internal pure
    returns (bool){
        //0123456789
        bytes memory bPassword = bytes(password_);

        for (uint8 i=0; i < bPassword.length; i++){
            if( uint8( bPassword[i] ) >= 48 && 
                uint8( bPassword[i] ) <= 57 )
                return true;
        }

        return false;
    }

    function hasSpecialCharacter( string memory password_ ) 
    internal view 
    returns (bool) {
        bytes memory bPassword = bytes(password_);

        for (uint8 i = 0; i < bPassword.length; i++) {
            if( specialCharacters[ bPassword[i] ] ) 
                return true;
        }

        return false;
    }

}