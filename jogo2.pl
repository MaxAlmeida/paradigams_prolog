:- dynamic conclui/2.
:- dynamic derrota/2.
:- dynamic tem/2.
:-op(900,xfx,[ehDoTipo, ehUmTipoDe, ehUm, conclui,tem, derrota]).

agua ehUmTipoDe classe.
fogo ehUmTipoDe classe.
terra ehUmTipoDe classe.
vento ehUmTipoDe classe.

monstroA ehDoTipo agua.
monstroB ehDoTipo fogo.
monstroC ehDoTipo terra.
monstroD ehDoTipo vento.
X ehDoTipo fogo:- X conclui missaoFogo.
X ehDoTipo agua:- X conclui missaoAgua.
X ehDoTipo vento:- X conclui missaoAgua.
X ehDoTipo terra:- X conclui missaoTerra.


X tem tiro=chamas:- X ehDoTipo fogo.
X tem tiro=jatoDeAgua:- X ehDoTipo agua.
X tem tiro=lancaRocha:- X ehDoTipo vento.
X tem tiro=rajadaCortante:- X ehDoTipo vento.


X conclui missaoFogo:- X tem itemFogo, X derrota monstroAgua, X derrota monstroTerra.
X conclui missaoAgua:- X tem itemAgua, X derrota monstroFogo, X derrota monstroVento.
X conclui missaoTerra:- X tem itemTerra, X derrota monstroAgua, X derrota monstroFogo. 
X conclui missaoVento:- X tem itemVento, X derrota monstroVento, X derrota monstroTerra.

X tem itemFogo:- here comes the javascript code
X tem itemAgua:- here comes the javascript code
X tem itemVento:- here comes the javascript code
X tem itemTerra:- here comes the javascript code

X derrota monstroAgua:-here comes the javascript code
X derrota monstroFogo:-here comes the javascript code
X derrota monstroVento:-here comes the javascript code
X derrota monstroTerra:-here comes the javascript code
