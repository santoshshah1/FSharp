module internal RelationalDatabase

open System.Data.Linq
open System.Data.Entity
open Microsoft.FSharp.Data.TypeProviders

 type private EntityConnection = SqlEntityConnection<ConnectionString=" Server=(localdb)\mssqllocaldb;
 Initial Catalog=UNI-KL;Integrated Security=SSPI;MultipleActiveResultSets=true",Pluralize = true>

 let private context = EntityConnection.GetDataContext()

[<EntryPoint>]
//displays seminar title
 query { for seminar in context.Seminars do
        select seminar }
|> Seq.iter (fun seminar -> printfn "%s" seminar.Title)

//joins the table
query { for seminar in context.Seminars do
        join Participant in context.Participants on (seminar.SeminarID = Participant.SeminarID)
        select (seminar.SeminarID,seminar.Level,Participant.Name, Participant.Grade) }
|> Seq.iter (fun (SeminarID, Level, Name, Grade) -> printfn "%d %s %s %s" SeminarID Level Name Grade)


//use of where clause to filter
query { for seminar in context.Seminars do
        where (seminar.Level= "Bachelor")
        select seminar }
|> Seq.iter (fun seminar -> printfn "%s" seminar.Title)

//console doesn't close abruptly
let x = System.Console.ReadLine();