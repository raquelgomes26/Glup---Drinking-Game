/* ************************************************************************ *
*    ex6.pl, v1.0                                                          *
*    Programa que resolve um labirinto                                     *
*                                                                          *
*    Copyright (C) 2017 by Rafael Aziz Da Silva Rocha                      *
*                                                                          *
*    This program is free software; you can redistribute it and/or modify  *
*    it under the terms of the GNU General Public License as published by  *
*    the Free Software Foundation; either version 2 of the License, or     *
*    (at your option) any later version.                                   *
*                                                                          *
*    This program is distributed in the hope that it will be useful,       *
*    but WITHOUT ANY WARRANTY; without even the implied warranty of        *
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
*    GNU General Public License for more details.                          *
*                                                                          *
*    You should have received a copy of the GNU General Public License     *
*    along with this program; if not, write to the                         *
*    Free Software Foundation, Inc.,                                       *
*    59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
*                                                                          *
*    To contact the author, please write to:                               *
*    Rafael Aziz Da Silva Rocha <rafaelazizlvr@gmail.com>                  *
*    Webpage: http://www.upe.br                                            *
*    Phone: +55 (81) 99940-3183                                            *
* ************************************************************************ *
* 
*/

start:-
    Li=1,
    Ci=1,
    Lf=6,
    Cf=8,
    lab(La),
    imprime(La),
    tenta(Li, Ci, Lf, Cf, La).

lab(La):-
    La = ["############",
          "#          #",
          "# # # #### #",
          "#   # # #  #",
          "# # #   # ##",
          "# # # ######",
          "#   #  #   #",
          "# ###  ### #",
          "# #      # #",
          "# ###### # #",
          "#   #      #",
          "############"].

imprime([]).
imprime([Head|Tail]):-
    writeln(Head),
    imprime(Tail).

tenta(Li, Ci, Lf, Cf, Labi):-
    preenche(Lf, Cf, Labi, Labf),
    tentaM(Li, Ci, Lf, Cf, Labi),
    imprime([Labf]),
    tenta(Li, Ci, Lf, Cf, Labf).

tentaM(Li, Ci, Lf, Cf, Labi):-      
    tentaB(Li, Ci, Lf, Cf, Labi).
tentaM(Li, Ci, Lf, Cf, Labi):-
    tentaD(Li, Ci, Lf, Cf, Labi).
tentaM(Li, Ci, Lf, Cf, Labi):-
    tentaE(Li, Ci, Lf, Cf, Labi).
tentaM(Li, Ci, Lf, Cf, Labi):-
    tentaC(Li, Ci, Lf, Cf, Labi).

tentaC(Li, Ci, Lf, Ci, Labi):-
    Lf is Li - 1,
    teste(Lf, Ci, Labi).
tentaD(Li, Ci, Li, Cf, Labi):-
    Cf is Ci + 1,
    teste(Li, Cf, Labi).
tentaB(Li, Ci, Lf, Ci, Labi):-
    Lf is Li + 1,
    teste(Lf, Ci, Labi).
tentaE(Li, Ci, Li, Cf, Labi):-
    Cf is Ci - 1,
    teste(Li, Cf, Labi).
 
teste(L, C, Lab):-
    nth0(L, Lab, Ls),
    string_codes(" ", [S]),
    nth0(C, Ls, S).

preenche(L, C, Labi, Labf):-
    nth0(L, Labi, Lx),
    string_codes("x", [X]),
    preenchex(C, X, Lx, Lr),
    preenchex(L, Lr, Labi, Labf).

preenchex(0, X, [_|Ti], [X|Ti]):-
    !.

preenchex(I, X, [H|T], [H|R]):-
    I > 0,
    If is I-1,
    preenchex(If, X, T, R).
