module Freebase

open FSharp.Data

let data=WorldBankData.GetDataContext()


 
 //so that console doesn't close abruptly
let x = System.Console.ReadLine();