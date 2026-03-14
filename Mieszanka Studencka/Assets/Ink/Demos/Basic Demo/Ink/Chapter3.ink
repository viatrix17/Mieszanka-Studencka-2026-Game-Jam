EXTERNAL showObjects(name)
EXTERNAL hideObjects(name)

VAR all_checked = false

=== chapter_three ===
~ showObjects("House") 
Wszedłeś do pokoju Monsieur Fogga. Jest tu cicho, a on sam zdaje się na coś czekać.
-> room_exploration

=== room_exploration ===
// Sprawdzamy stan przy każdym wejściu do tego węzła
{all_checked: 
    ~ hideObjects("House")
    -> finish_chapter
- else: 
    Muszę najpierw sprawdzić wszystkie dowody w pokoju.
    -> DONE 
}

=== finish_chapter ===
Wszystko gotowe. Czas ruszać w drogę!
// ~ hideObjects("House")
-> END

=== kliknieto_obraz ===
To piękny pejzaż przedstawiający Londyn. Na ramie widnieje data: 1872.
-> room_exploration // Wracamy do głównej logiki, żeby sprawdzić czy all_checked

=== kliknieto_fogga ===
- Ruszamy, czy będziesz tak stać? - pyta Fogg, nie odrywając wzroku od gazety.
- Ach, ta młodzież.
-> room_exploration