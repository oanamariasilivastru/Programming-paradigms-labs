local
fun lazy {Gen N}
   N | {Gen N+1}
end

fun lazy {Filter L H}
   case L of
      nil then nil
   [] A|As then
      if (A mod H)==0 then {Filter As H}
      else A | {Filter As H}
      end
   end
end

fun lazy {Sieve L}
   case L of
      nil then nil
   [] H|T then
      H | {Sieve {Filter T H}}
   end
end

fun lazy {Prime}
   {Sieve {Gen 2}}
end

fun {GetAfter N}
   fun {Find L}
      case L of
         nil then nil
      [] H|T then
         if H > N then H
         else {Find T}
         end
      end
   end
in
   {Find {Prime}}
end
in
{Browse {GetAfter 10}}   % => 11
{Browse {GetAfter 30}}   % => 31
end