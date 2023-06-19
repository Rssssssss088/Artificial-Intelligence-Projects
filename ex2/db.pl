commonGenre(X, Y, G):- genre(X, G), genre(Y, G), X \= Y.

commonGenre1(X, Y):- commonGenre(X, Y, G1).

commonGenre2(X, Y):- commonGenre(X, Y, G1), commonGenre(X, Y, G2), G1 \= G2.

commonGenre3(X, Y):- commonGenre(X, Y, G1), commonGenre(X, Y, G2), commonGenre(X, Y, G3), G1 \= G2, G2 \= G3 , G3 \= G1.

commonGenre4(X, Y):- commonGenre(X, Y, G1), commonGenre(X, Y, G2), commonGenre(X, Y, G3), commonGenre(X, Y, G4), G1 \= G2, G1 \= G3, G1 \= G4, G2 \= G3, G2 \= G4, G3 \= G4.

same_director(Movie1, Movie2) :- 
    director_name(Movie1, Director), 
    director_name(Movie2, Director), 
    Movie1 \= Movie2.

commonKeyword(X, Y, G):- keyword(X, G), keyword(Y, G), X \= Y.

commonKeywords1(X, Y):- commonKeyword(X, Y, G1).

commonKeywords2(X, Y):- commonKeyword(X, Y, G1), commonKeyword(X, Y, G2), G1 \= G2.

commonKeywords3(X, Y):- commonKeyword(X, Y, G1), commonKeyword(X, Y, G2), commonKeyword(X, Y, G3), G1 \= G2, G2 \= G3 , G3 \= G1.

commonKeywords4(X, Y):- commonKeyword(X, Y, G1), commonKeyword(X, Y, G2), commonKeyword(X, Y, G3), commonKeyword(X, Y, G4), G1 \= G2, G1 \= G3, G1 \= G4, G2 \= G3, G2 \= G4, G3 \= G4.

same_language(Movie1, Movie2) :- 
    language(Movie1, Lang), 
    language(Movie2, Lang), 
    Movie1 \= Movie2.
    
commonActor(X, Y, G):- actor(X, G), actor(Y, G), X \= Y.

commonActors1(X, Y):- commonActor(X, Y, G1).

commonActors2(X, Y):- commonActor(X, Y, G1), commonActor(X, Y, G2), G1 \= G2.

commonActors3(X, Y):- commonActor(X, Y, G1), commonActor(X, Y, G2), commonActor(X, Y, G3), G1 \= G2, G2 \= G3 , G3 \= G1.


commonStudio(X, Y):- production_company(X, G), production_company(Y, G), X \= Y.

commonProductionCountry(X, Y):- production_country(X, G), production_country(Y, G), X \= Y.

sameCountry(X, Y):- country(X, G), country(Y, G), X \= Y.

% queries will be up to here

find_sim_5(X, Y):- (commonGenre3(X, Y) ; same_director(X, Y)), 
                    commonKeywords1(X, Y), 
                    ( commonActors1(X, Y) ; commonStudio(X, Y) ). 

find_sim_4(X, Y):- commonGenre2(X, Y), commonStudio(X, Y). 

find_sim_3(X, Y):- commonGenre2(X, Y), commonKeywords1(X, Y).

find_sim_2(X, Y):- commonGenre2(X, Y), sameCountry(X,Y).

find_sim_1(X, Y):- commonGenre2(X, Y).

% I should use also commonDecade, goodRating, same_director 