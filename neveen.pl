% Base case: If BList is empty, there are no occurrences.
memCount(_, [], 0).

% If BList is shorter than AList, no match is possible.
memCount(AList, BList, 0) :-
    length(AList, LenA),
    length(BList, LenB),
    LenA > LenB.

% If AList matches the prefix of BList, increment count and recurse.
memCount(AList, BList, Count) :-
    append(AList, Rest, BList),
    memCount(AList, Rest, CountRest),
    Count is CountRest + 1.

% If AList doesn't match, move one element ahead in BList.
memCount(AList, [_|Tail], Count) :-
    memCount(AList, Tail, Count).
