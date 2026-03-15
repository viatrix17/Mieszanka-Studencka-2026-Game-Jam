//wersja z 16:33
//tu zaczyna się ink
//EXTERNAL wait(time)
->start

== start
Gdy zapytali Cię na rozmowie o pracę, gdzie widzisz się za pięć lat, ostatnim, o czym pomyślałaś, było zostanie makaronem. 
O spagettizacji czytałaś do tej pory jedynie w poradniku małego astronauty, niemniej, bez wątpienia stała się Twoim przeznaczniem. 
Czarna dziura powoli wciąga Cię w swoje odmęty. 
Czujesz, jak Twoje ciało zamienia się w długą, cienką strugę materii, a Twój umysł ulga dezintegracji... 
Dezintegracji?
->domStart
//albo ->domStart w inku jeśli chcemy przejść bezpośrednio dalej albo interakcja z czarną dziurą i przejście _inkStory.ChoosePathString("domStart"); w unity (w tej pierwszej sytuacji usuń ->DONE powyżej)

== domStart
//dom na zewnątrz
Zaskakująco, jesteś cały czas w niezłej formie. 2+2 to cały czas 4, nadal nie umiesz francuskiego, 
a co najbardziej istotne - wciąż chce Ci się siku.
Wygląda na to, że to nie Twój koniec. Przynajmniej nie na razie. 
Z mieszaniną zdziwienia, podekscytowania i parcia na pęcherz rozglądasz się po otoczeniu.
-> DONE

== dom0
To Twój dom rodzinny. Rozpoznałabyś go nawet z zamkniętymi oczami, po zapachu placków z jabłkami, które Twoja mama robiła na śniadanie niemal każdego dnia. Coś jest jednak nie w porządku, choć nie możesz stwierdzić co. 
Może to przez zaćmiewający umysł pęcherz. Wątpisz jednak, żeby pełen pęcherz wywoływał też halucynacje.
-> DONE

== dom1
#char: B
//ustawiłam na razie tag, który będzie ustalał jaka jest postać, ale mogę zmienić na zmienną? Nie wiem jak to ugryźć do końca. Ustawię też tagi ustalające mówców. B for Beatrycze, P for protagonistka, U for unknown
//*pojawia się Beatrycze*
Chodźmy do domu. Robi się zimno. #speak: U
->choice1
=choice1
* Ale czarna dziura... #speak: P
Jaka znowu dziura? Kiedy Ty, dziecko, w końcu dorośniesz… #speak: U
->choice1
TODO: dodać pierwsze kim jesteś, po którym dopiero pojawia się niższe
* Kim jesteś? #speak: P
Jak to kim? Jestem Twoją matką, Twoją siostrą, Twoją córką, Twoją żoną, Twoją przyjaciółką, Twoją przewodniczką, Twoją…
 #speak: U
** ...Beatrycze. #speak: P
Chodźmy do domu. 
***Muszę siku
->DONE
//przejście po kliknięciu na drzwi
== dom2
placeholder
->DONE





