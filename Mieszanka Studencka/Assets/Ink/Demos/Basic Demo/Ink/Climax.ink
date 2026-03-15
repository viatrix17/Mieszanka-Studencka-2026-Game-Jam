//sceny znikają, pozostaje czerń/sama czarna dziura
//lenula still

==climaxStart
<i>Płaskie tło rozpada się jak tandetna makieta. To koniec przedstawienia. </i>
->choice1
=choice1
*[<i>Ukłoń się.</i>]
Przyznaję, świetnie odegrałaś swoją rolę. Mimo usilnych prób ustalenia własnej destynacji... zostałaś doprowadzona tutaj. Zgodnie ze <i>scenariuszem</i>. #Beatrycze
->choice1
*Ja nie rozumiem. #Ty
Ha! Możesz się okłamywać, ale przyszłość jest już dawno dokonana. #Beatrycze
**Przecież to oksymoron! #Ty
A jednak! W jedności nie ma niewiadomych. #Beatrycze
->choice1
**[<i>Nie kwestionuj bytu.</i>]
Pogodziłaś się jednak ze swoim losem? #Beatrycze
->choice1
*Co się stało z kościołem? Z parkiem? Z moim domem? #Ty
Są i ich nie ma. W obecnym momencie wydaje mi się, że masz większe zmartwienia. #Beatrycze
->choice1
*To nie tak miało się skończyć... #Ty
"Nie tak"?! A czego oczekiwałaś? Że uda Ci się uciec z <b>czarnej dziury</b>? Niedoczekanie... #Beatrycze
->choice1
*<b>JA</b> nie mogę tak skończyć! #Ty
Zawsze "ja", jakby czarna dziura miała to usłyszeć i zlitować się z uwagi na Twój indywidualizm! #Beatrycze 
->choice1
*[<i>Kontynuuj</i>]
->climaxMid

=climaxMid
<i>Coraz trudniej jest Ci stwierdzić, gdzie kończy się Twoje ciało, a zaczyna czarna dziura. Wszystko jest tak samo ciemne, tak samo zimne, tak samo... martwe.</i>
*<i>Przecież masz jeszcze czas!</i>
<i>Tak... Tak! Masz jeszcze {time} {time == 1:minutę|{time == 0:minut|{time >= 5:minut|minuty}}}. To jeszcze nie koniec!</i>
**[<i>Weź głęboki wdech.</i>]
<i> Bierzesz wdech, po chwili go wypuszczając. Albo przynajmniej wydaje Ci się, że to robisz. Nie masz pewności czy cokolwiek pozostało jeszcze z Twoich płuc. </i>
~ time += 1
<i> Czujesz się... lepiej?</i>
***[<i>Próbuj dalej.</i>]
<i>Możesz to zrobić, tak, na pewno Ci się uda! Co to dla Ciebie! Wleciałaś zupełnie sama w czarną dziurę do jasnej cholery i przeżyłaś tak długo! Jak nie ty to kto!?
~ time += 1
****[<i>Więcej czasu...</i>]
<i>Tylko... tylko odrobinę więcej. Odrobinę więcej i stąd uciekniesz.</i>
~ time += 1
*****[...]
~ time += 1
->loop
*[<i>Poddaj się.</i>]
->climaxEnd

==loop
{addTime()}
~loops += 1
+[...]
->loop
*{loops >= 6}[<i>Poddaj się..</i>]
->climaxEnd

==climaxEnd
~time = 3
<i>Wystarczy. Nie masz już siły. Twoje mięśnie dawno zostały postrzępione, rozplątane, ich atomy gotowe do pełnienia innych funkcji.</i>
<i>Czekasz na szelmowski głos Twojej towarzyszki, ale odpowiada Ci jedynie wszechobecny niebyt.</i>
<i>Kompletna cisza. Byłaby osamatniająca, gdyby nie to, że... nie jesteś sama. No tak, bo w zasadzie jak można być samym w ogóle nie będąc?</i>
*[<i>Oddaj pamięć.</i>]
~ time = 2
<i>Wymykają Ci się ostatnie wspomnienia. Dziwne amalgamaty, nie umiesz stwierdzić jak dużo naprawdę doświadczyłaś, a ile z nich to pozostałości po innych błąkających się świadomościach.</i>
**[<i>Oddaj myśli.</i>]
~ time = 1
<i>Wyzbywasz się szczątkowych przemyśleń, wszelkich wewnętrznych komentarzy. Robisz to jednak z nadzieją, że przynajmniej one Ciebie przeżyją. Może jakoś się wydostaną, uczepią pierwszego astronauty, którego napotkają? W końcu pozwalasz ulecieć również samej nadziei.</i>
***[<i>Oddaj siebie.</i>]
~ time = 0
<i>Twój ostateczny akt entropii, zjednoczenie z okalającą Cię czernią. </i>
<i>Czas się zatrzymuje. Zapada kurtyna. Widownia się rozchodzi. Mają własne życia, do których jeszcze mogą wrócić. </i>
****[...]
<i>Ale to tylko kwestia czasu.</i>
//XD
->END
//jak w zasadzie mają się czarne dziury do entropii? ja nie wiem, a teraz jest za pozno zebym myslala nad zasadami termodynamiki...
