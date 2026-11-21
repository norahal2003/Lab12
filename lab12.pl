
%  Graph: road(From, To) = one-way arrow in the figure 
road('Makkah',  'Madinah').
road('Makkah',  'Riyadh').

road('Madinah', 'Makkah').
road('Madinah', 'Taif').
road('Madinah', 'Tabuk').

road('Taif',    'Dammam').
road('Taif',    'Tabuk').

road('Tabuk',   'Taif').

road('Dammam',  'Qatif').
road('Dammam',  'Riyadh').

road('Riyadh',  'Dammam').

road('Qatif',   'Madinah').
road('Qatif',   'Dammam').

%  travel(Start, End, Path) 
% Path is the list of cities from Start to End, with no city repeated.
travel(Start, End, Path) :-
    path(Start, End, [Start], RevPath),
    reverse(RevPath, Path).

% path(Current, End, Visited, RevPath)
% Reached the destination: add it to the visited list.
path(Current, End, Visited, [End|Visited]) :-
    road(Current, End).

% Otherwise move to an unvisited neighbour and keep searching.
path(Current, End, Visited, Path) :-
    road(Current, Next),
    Next \== End,
    \+ member(Next, Visited),
    path(Next, End, [Next|Visited], Path).
