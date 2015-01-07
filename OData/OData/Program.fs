//Example chosen from http://msdn.microsoft.com/en-us/library/hh156504.aspx

open Microsoft.FSharp.Data.TypeProviders

//source
type ODataSource = ODataService<"http://services.odata.org/Northwind/Northwind.svc/">

//creating objects for data
let dataobject = ODataSource.GetDataContext()
let dataContext = ODataSource.ServiceTypes.NorthwindEntities()

//Querying Odata using F# query expression
query { for employer in dataobject.Employees do
        select employer }
|> Seq.iter (fun employer ->
    printfn "Firstname: %s" employer.FirstName
    )

//so that console doesn't close abruptly
let x = System.Console.ReadLine();