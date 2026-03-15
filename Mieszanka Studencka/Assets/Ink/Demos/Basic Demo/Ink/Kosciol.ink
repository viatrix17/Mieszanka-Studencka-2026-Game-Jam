//dalej do kościoła i część Zuzowa

==kosciolStart
<i>Świat wokół wydaje się przez chwilę rozmazany, lecz dzwony wybrzmiewają we wnętrzu Twojej czaszki wyraźniej niż byś chciała. Znajdujesz się w kościele. Gdy dzwony cichną, smętna melodia psalmu dolatuje do Twoich uszu. Ogarnia Cię lodowate zimno przeciągu. A może to od Ciebie bije chłód.</i>

//dzwiek dzwonow jesli bedzie mozliwosc

<i>Gdy dzwony cichną, smętna melodia psalmu dolatuje do Twoich uszu. Ogarnia Cię lodowate zimno przeciągu. A może to od Ciebie bije chłód.</i>

Zebraliśmy się tu dzisiaj, by pożegnać naszą ukochaną siostrę w wierze. #Beatrycze

<i>Nie pamiętam tego.</i> #Ty

Wygłosisz ostatnie przemówienie? #Beatrycze

* Tak. # Ty

* Co się tu, jasny gwint, dzieje?! #Ty
Jeszcze nie wiesz? {time == 1:Została|{time >= 5:Zostało|Zostały}} Ci tylko {time} {time == 1:minuta|{time == 0:minut|{time >= 5:minut|minuty}}}. A może aż tyle? #Beatrycze
-
*Była dobrą córką, dobrą siostrą, dobrą matką, dobrą żoną, dobrą przyjaciółką, dobrą… #Ty
*Była złą córką, złą siostrą, złą matką, złą żoną, złą przyjaciółką, złą… #Ty

-
Odwiedzającą? Wizytatorką? Turystką?... Kim ja jestem? #Ty

<i>Ciało w trumnie wygląda dziwnie świeżo. Prawie jak Ty.</i>
~time -= 1

Nic z tego nie rozumiem. To się przecież nie dzieje naprawdę. #Ty

Masz rację. #Beatrycze

O co chodzi z tym licznikiem? #Ty

Liczy sekundy do krytycznego rozwiązania sytuacji toaletowej. #Beatrycze

Nie żartuj sobie ze mnie. #Ty

Przepraszam. No tak, Ty nie masz już nawet pęcherza. #Beatrycze
->climaxStart


==kosciolPrzedmioty

= biblia
~ bibliaSeen = true
<i>Pismo Święte. Dla jednych pomoc, dla drugich nonsens.</i>
~ allChecked()
{allCheckedK: ->kosciolKoniec|->DONE}

= kwiaty
~kwiatySeen = true
<i>Kwiaty. Nie wypada przyjść na pogrzeb bez kwiatów.</i>
~ allChecked()
{allCheckedK: ->kosciolKoniec|->DONE}

= papier
~papierSeen2 = true
<i>Papier toaletowy. Tym razem na otarcie łez.</i>
~ allChecked()
{allCheckedK: ->kosciolKoniec|->DONE}

//to climax!
//also hejka tu lenka once again

==kosciolKoniec
Wiesz co to wszystko oznacza, prawda? #Beatrycze
*Tak. #Ty
Nie do końca w to wierzę. #Beatrycze
->climaxStart
*Nie. #Ty
Biedna Ty. #Beatrycze
->climaxStart








