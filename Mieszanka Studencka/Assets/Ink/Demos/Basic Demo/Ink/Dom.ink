//zuza
== domStart
<i>Zaskakująco, jesteś cały czas w niezłej formie. 2+2 to cały czas 4, nadal nie umiesz francuskiego, a co najbardziej istotne - wciąż chce Ci się siku.</i>
<i>Wygląda na to, że to nie Twój koniec. Przynajmniej nie na razie. Z mieszaniną zdziwienia, podekscytowania i parcia na pęcherz rozglądasz się po otoczeniu.</i>
-> DONE

== dom0
<i>To Twój dom rodzinny. Rozpoznałabyś go nawet z zamkniętymi oczami, po zapachu placków z jabłkami, które Twoja mama robiła na śniadanie niemal każdego dnia. Coś jest jednak nie w porządku, choć nie możesz stwierdzić co.</i>

<i>Może to przez zaćmiewający umysł pęcherz. Wątpisz jednak, żeby pełen pęcherz wywoływał też halucynacje.</i>
-> DONE

== dom1
//Ustawię też tagi ustalające mówców.
//*pojawia się Beatrycze*
Chodźmy do domu. Robi się zimno. #unknown
->choice1
=choice1
#char: B1
* Ale czarna dziura... #Ty
Jaka znowu dziura? Kiedy Ty, dziecko, w końcu dorośniesz… #unknown
->choice1
* Kim jesteś? #Ty
Nie wygłupiaj się. Wracajmy już. #unknown
~ kimJestes = true
->choice1
* {kimJestes}<b>Kim</b> jesteś?
Jak to kim? Jestem Twoją matką, Twoją siostrą, Twoją córką, Twoją żoną, Twoją przyjaciółką, Twoją przewodniczką, Twoją… #unknown
** ...Beatrycze. #Ty
~ time -= 1
Chodźmy do domu. #Beatrycze
***Muszę siku. #Ty #break_loop
-> DONE
//we wnętrzu gracz musi znaleźć toaletę

==domKorytarz
~ showObjects("Hall")
<i>Korytarz.</i>
->DONE

== kuchnia
#break_loop
//po kliknięciu na kuchnię
~ hideObjects("Hall")
<i> Kuchnia. </i>
Placki jeszcze niegotowe! #Beatrycze
->domPrzedmioty

== salon
#break_loop
~ hideObjects("Hall")
//po kliknięciu na salon
<i>Salon. Nie musisz tam teraz iść.
->DONE

== kibelInteract
//po kliknieciu na kibel
<i>Toaleta. Dopiero co tam byłaś.</i>
->DONE

== domKibel
//~ showObjects("Bathroom")
~ kibelFound = true
//po wejściu do toalety
Jasny gwint, czemu w tym domu nigdy nie było papieru toaletowego?</i> #Ty
//nie wiem czy robimy wybór tekstowy czy graficzny, na razie zrobiłam tekstowy ale można zmienić
* <i>Opróżnij pęcherz mimo braku papieru.</i> #Ty #break_loop
~ siku = true
~ time += 1
->DONE
* <i>Sikanie bez papieru to nie sikanie.</i> #Ty #break_loop
-> DONE

//graficznie przejście do innego pomieszczenia

== domPrzedmioty
~ showObjects("Kitchen")   
->DONE 
= papier
//_inkStory.ChoosePathString("domPrzedmioty.papier");
~ papierSeen = true
<i>Kto o zdrowych zmysłach trzyma papier toaletowy w lodówce?!</i>
~ allChecked()
{allCheckedDom: ->domPlacki|->DONE}

= poradnik
~poradnikSeen =  true
<i> Poniekąd trzeba go obwiniać o całą sytuację.</i>
~ allChecked()
{allCheckedDom: ->domPlacki|->DONE}

= jablko
~jablkoSeen = true
<i>Znak rozpoznawczy mamy. Bez nich nie usmaży placków.</i>
~ allChecked()
{allCheckedDom: ->domPlacki|->DONE}


==domPlacki
~ hideObjects("Kitchen")
Placki gotowe! Pospiesz się, bo wystygną! #Beatrycze 

~ time += 1
<i>Placki smakują tak jak zawsze - najlepiej na świecie. Nie jadłaś takich od lat, odkąd mama zachorowała. Nie zdawałaś sobie dotąd sprawy, jaką nostalgię w Tobie wywołują. Kim więc była kobieta, która potrafiła je tak dokładnie odtworzyć?</i>
->choice1
=choice1
* Gdzie jest moja mama? #Ty
Powiedziałam Ci już, przecież jestem Twoją mamą. Chyba nie żal Ci czasu dla własnej mamy? #Beatrycze
->domKoniec
* {papierSeen} Czemu trzymasz papier toaletowy w lodówce? #Ty
Córko, kiedy Ty w końcu wyrośniesz z tych głupich pytań… #Beatrycze
->choice1



/// część lenowa
==domKoniec
~ time -= 1
<i>Zanim będziesz w stanie zadać kolejne pytanie, rozbrzmiewa sygnał dzwoniącego telefonu. </i>
// jeśli będzie czas to można wrzucić dźwięk telefonu?
To do Ciebie. #Beatrycze
*Do mnie? #Ty
Twoja <i>dziewczyna</i>. Pamiętam jak sama byłam młoda... #Beatrycze
<i>W powietrzu unosi się zapach papierosów. Nie jesteś w stanie stwierdzić jego źródła.</i> #go_park
//gracz klika żeby wyjść, potem pojawia się w parku
->DONE
