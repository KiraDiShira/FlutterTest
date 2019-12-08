# Efficienza dell' algoritmo.

Se il numero di parole in ingresso è `N`, la complessità algoritmica nel caso peggiore di questa implementazione è lineare `O(N)`, così ricavata:

Il metodo `GetWords` itera tutte le parole per costruirmi una lista di oggetti in cui ognuno persiste la parola originale e la stessa ordinata per codice ASCII. Se assumiamo che sia nota la lunghezza massima che può avere una parola questo algoritmo di ordinamento ha una complessità costante `O(1)`. Quindi questo metodo ha complessità `O(N)`.

Successivamente si raggruppa per parola ordinata, e questa fase ha complessità circa `O(N)` perchè la `groupBy` in Linq ha una implementazione basata su hash.

E infine bisogna stampare a video tutte le `N` parole, quindi la complessità di questa fase è `O(N)`.

Ricapitolando: 

```
Costruzione parole + raggruppamento + stampa = O(N) + O(N) + O(N) = O(N)
```
