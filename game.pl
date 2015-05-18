:- dynamic i_am_at/1, at/2.

description(acessoFga,
  'Voce está a caminho da fga, há apenas um caminho a seguir.').
description(entradaFga,
  'Voce está na entrada da fga , com lama e mato dos dois lados.').
description(lama,
  'Atolou!!!').
description(estacionamento,
  'Voce esta no estacionamento da fga. Enfim, conseguiu estacionar.').
description(labirinto(_),
  'Voce esta perdido, encontre o caminho para chegar na aula').
description(caminhoSala,
  'Voce esta a caminho da sala de aula.').
description(porta,
	    'Voce está entrando na sala de aula.').
description(aula,
  'Voce entrou na aula.').
description(xerox,
	    'Voce está na xerox').

report :-
  at(you,X),
  description(X,Y),
  write(Y),
  nl.

connect(acessoFga,frente,entradaFga).
connect(entradaFga,atras,acessoFga).
connect(entradaFga,direita,xerox).
connect(xerox,atras,entradaFga).
connect(xerox,frente,lama).
connect(entradaFga,esquerda,lama).
connect(entradaFga,frente,estacionamento).
connect(estacionamento,atras,entradaFga).
connect(estacionamento,esquerda,labirinto(0)).
connect(labirinto(0),atras,estacionamento).
connect(estacionamento,direita,caminhoSala).
connect(caminhoSala,atras,estacionamento).
connect(caminhoSala,frente,entrada2).
connect(entrada2,frente,porta).
connect(porta,atras,entrada2).
connect(porta,frente,aula).

connect(labirinto(0),esquerda,labirinto(1)).
connect(labirinto(0),direita,labirinto(3)).
connect(labirinto(1),esquerda,labirinto(0)).
connect(labirinto(1),direita,labirinto(2)).
connect(labirinto(2),esquerda,estacionamento).
connect(labirinto(2),direita,labirinto(0)).
connect(labirinto(3),esquerda,labirinto(4)).
connect(labirinto(3),direita,labirinto(4)).

move(Dir) :-
  at(you,Loc),
  connect(Loc,Dir,Next),
  retract(at(you,Loc)),
  assert(at(you,Next)),
  report,
  !.

move(_) :-
  write('Isso nao eh movimento permitido.\n'),
  report.

frente :- move(frente).
esquerda :- move(esquerda).
direita :- move(direita).
atras:-move(atras).


peixe :-

  at(you,labirinto(4)),
  write('Voce comeu peixe no RU\n'),
  write('voce teve uma indigestao mortal. Fim de jogo\n'),
  retract(at(you,labirinto(4))),
  assert(at(you,done)),
  !.
peixe.

peixe2:-
	at(you,labirinto(3)),
	at(mister_foods,in_hand),
	write('Voce estava com fome e decidiu usar seu vale do mister foods'),
	write('Agora voce pode ir para aula satisfeito.!\n'),
	write('Afinal voce comeu no mister foods.\n'),
	retract(at(you,labirinto(3))),
	assert(at(you,done)),
	!.
peixe2.

conluido :-
  at(conluido,Loc),
  at(you,Loc),
  write('Voce não pareceu um calouro.\n'),
  write('Parabens, seu IRA agora é 3!\n'),
  retract(at(you,Loc)),
  assert(at(you,done)),
  !.

conluido.

key:-
	at(key,Loc),
	at(you,Loc),
	write('Voce encontrou a secretaria.\nAqui voce pega sua grade horaria.'),
	!.

key.

mister_foods:-
	at(mister_foods,Loc),
	at(you,Loc),
	write('Voce encontrou um vale refeição do mister foods.Voce deveria pega-lo.'),
	!.

mister_foods.

lama :-
  at(you,lama),
  write('Fim de jogo!.\n'),
  retract(at(you,lama)),
  assert(at(you,done)),
  !.

lama.

caminhoSala:-
	at(you,caminhoSala),
	at(key, in_hand),
	retract(at(you,caminhoSala)),
	assert(at(you,entrada2)),
	nl.

caminhoSala.

entrada2:-
	at(you,porta),
	at(key, in_hand),
	write('Voce entrou com a grade a horaria na mao. Mostrou que é calouro'),
	retract(at(you, porta)),
	assert(at(you, done)),
	nl.
entrada2.

pegar(X):-
	at(X, in_hand),
	write('Voce já esta segurando isso!'),
	nl.

pegar(X):-
	at(you,Loc),
	at(X, Loc),
	retract(at(X, Loc)),
	assert(at(X, in_hand)),
	write('Item pego.'),
	nl.

pegar(_):-
	write('Não há nada aqui.'),
	nl.

largar(X) :-
       at(X, in_hand),
       at(you,Loc),
       retract(at(X, in_hand)),
       assert(at(X, Loc)),
       write('Item largardo.'),
       nl.

largar(_) :-
        write('Voce nao está segurando nada.'),
        nl.

main :-
  at(you,done),
  write('Obrigado por jogar.\n'),
  !.

main :-
  write('\nProximo Movimento -- '),
  read(Move),
  call(Move),
  peixe,
  conluido,
  lama,
  caminhoSala,
  entrada2,
  key,
  mister_foods,
  peixe2,
  main.

go :-
  retractall(at(_,_)), % clean up from previous runs
  assert(at(you,acessoFga)),
  assert(at(peixe,labirinto(3))),
  assert(at(conluido,aula)),
  assert(at(key,labirinto(2))),
  assert(at(mister_foods,xerox)),
  write('This is an adventure game. \n'),
  write('Legal moves are esquerda, direita, frente, or atras.\n'),
  write('To pick up items type ''pegar(x)". \n'),
  write('To largar items ''largar(x)''. \n'),
  write('End each move with a period.\n\n'),
  report,
  main.
























