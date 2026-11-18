# Obiettivo

L’obiettivo di questo compito, da svolgere singolarmente, è prendere familiarità con i concetti di base di Flutter visti a lezione (composizione di widget, gestione dello stato, input dell’utente e navigazione tra schermate) realizzando una semplice app per la gestione di una lista di attività (to-do list). Il codice va pubblicato su una repository GitHub pubblica e l’app eseguita su emulatore e su smartphone fisico.

_Nota: come spunto didattico, alcune app consegnate verranno provate insieme in classe, con una breve demo dal vivo a cura di chi le ha sviluppate._

## Istruzioni
### 1. Dominio
L’app gestisce un’unica entità, l’attività, caratterizzata da:
- titolo: testo obbligatorio che la descrive;
- stato: da fare o completata (una nuova attività è da fare);
- importanza: se l’attività è importante o no (per default no).

### 2. Requisiti funzionali
L’app deve permettere all’utente di:

- **R1.** Aggiungere attività
- **R2.** Consultare le attività
- **R3.** Aggiornare lo stato di un’attività
- **R4.** Eliminare attività

### 3. Scenari

#### S1 – Aggiungere un’attività (R1)

Punto di partenza: l’utente è sull’elenco delle attività.
1. L’utente avvia la creazione di una nuova attività.
2. L’utente inserisce il titolo e indica se l’attività è importante.
3. L’utente conferma.
4. L’app torna all’elenco, vi aggiunge l’attività e mostra un messaggio temporaneo di conferma.

→ **Variante – titolo mancante:** al passo 3 l’app segnala l’errore e non crea l’attività. L’errore scompare quando l’utente corregge il titolo.

→ **Variante – rinuncia:** ai passi 1-3 l’utente torna all’elenco senza confermare la creazione (ad esempio con il comando di ritorno del dispositivo). L’attività non viene creata, l’elenco resta invariato e non compare alcun messaggio.

#### S2 – Consultare le attività (R2)

Punto di partenza: l’app non è ancora in esecuzione.
1. L’utente avvia l’app.
2. L’app mostra l’elenco di tutte le attività, ciascuna con titolo, stato e importanza ben distinguibili, e il numero di attività completate sul totale.

→ **Variante – nessuna attività:** l’app mostra un’indicazione su come aggiungerne una.

#### S3 – Aggiornare lo stato di un’attività (R3)

Punto di partenza: l’utente è sull’elenco, che contiene almeno un’attività.

1. L’utente seleziona un’attività.
2. L’utente la segna come completata oppure la riporta a "da fare".
3. L’app aggiorna subito lo stato dell’attività e il conteggio delle attività completate.

#### S4 – Eliminare un’attività (R4)

Punto di partenza: l’utente è sull’elenco, che contiene almeno un’attività.
1. L’utente chiede di eliminare un’attività.
2. L’app chiede conferma.
3. L’utente conferma.
4. L’app rimuove l’attività dall’elenco e aggiorna il conteggio.

→ **Variante – rinuncia:** al passo 3 l’utente rifiuta la conferma. L’attività non viene eliminata e rimane invariata.

## Materiale da consegnare
* il link alla repository GitHub pubblica con l’intero progetto Flutter;
* due screenshot dell’app in esecuzione sullo smartphone:
  * l’elenco con almeno tre attività, di cui almeno una completata e almeno una importante, con il conteggio visibile (S2);
  * l’errore di titolo mancante durante la creazione di un’attività (S1, variante).

