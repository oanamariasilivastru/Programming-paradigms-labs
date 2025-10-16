%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1a
declare
fun {Num N K}
   if K==0 then 1
   else N*{Num N-1 K-1}
   end
end

declare
fun {Den K}
   if K==0 then 1
   else K*{Den K-1}
   end
end

declare
fun {C N K}
   {Num N K} div {Den K}
end

{Browse {C 2 0}}
{Browse {C 10 3}}


%1b
declare
fun {Comb N K}
   if K==0 then 1
   else ((N-K+1) * {Comb N K-1}) div K
   end
end

{Browse {Comb 10 3}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4
declare
fun {Insert T N}
   case T of
   nil then
      node(N nil nil)
   [] node(V L R) then
      if N<V then
	 node(V {Insert L N} R)
      else
	 node(V L {Insert R N})
      end
   end
end

declare
fun {Smallest T}
   case T of
   nil then nil
   [] node(V nil _) then V
   [] node(_ L _) then {Smallest L}
   end
end

declare
fun {Largest T}
   case T of
   nil then nil
   [] node(V _ nil) then V
   [] node(_ _ R) then {Largest R}
   end
end

declare
fun {IsBST T}
   case T of
      nil then true
   [] node(V L R) then
      local LeftOK RightOK in
         LeftOK = case L of
                     nil then true
                  [] node(_ _ _) then {Largest L} < V
                  end
         RightOK = case R of
                      nil then true
                   [] node(_ _ _) then {Smallest R} >= V
                   end
         LeftOK andthen RightOK andthen {IsBST L} andthen {IsBST R}
      end
   end
end



local
   T0 T1 T2 T3 T4
in
   T0 = nil
   T1 = {Insert T0 10}
   T2 = {Insert T1 5}
   T3 = {Insert T2 15}
   T4 = {Insert T3 7}

   {Browse T4}

   {Browse {Smallest T4}}

   {Browse {Largest T4}}

   {Browse {IsBST T4}}
   
end

