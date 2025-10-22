declare
fun {Reverse L}
   fun {ReverseAcc L1 Acc}
      case L1
      of nil then Acc
      [] H|T then {ReverseAcc T H|Acc}
      end
   end
in
   {ReverseAcc L nil}
end

{Browse {Reverse ['I' 'want' 2 go 'there']}}