==parkStart

//siedząc na kocu piknikowym. Na przeciwko znajduje się Beatrycze.
Nie wiesz jak się cieszę, że wreszcie udało nam się wyjść razem! Nawet pogoda nam sprzyja. #Beatrycze
->choice1
=choice1
*Ja też się cieszę. #Ty
{piknikTime > 1: ->parkTalk}
~ piknikTime += 1
<i>Czy to Ty czy nagle się zrobiło jakoś dziwnie duszno?</i>
Nie za gorąco Ci w tej kurtce? Jesteś cała czerwona. <i>śmiech</i> #Beatrycze
<i>To chyba jednak Ty.
->choice1
*I Twoi rodzice nie mają nic przeciwko? #Ty
{piknikTime > 1: ->parkTalk}
~ piknikTime += 1
Dlaczego mieliby mieć coś przeciwko?
**Racja, nie wiem, dlaczego o to zapytałam. #Ty
->choice1
**Nie wiem... tak mi intuicja podpowiada. #Ty
Doszukujesz się problemów, gdzie ich nie ma. #Beatrycze
->choice1
*{piknikGdzie} Chwila, gdzie ja jestem? #Ty
{piknikTime > 1: ->parkTalk}
~ piknikTime += 1
~ piknikGdzie = false
Na... pikniku? W piękny słoneczny dzień, ze swoją wprost fantastyczną dziewczyną? #Beatrycze
**No tak... #Ty
<i>Postać na przeciwko Ciebie wydaje się... uśmiechać.</i>
->choice1
*{piknikGdzie} Chwila, kim ty jesteś? #Ty
{piknikTime > 1: ->parkTalk}
~ piknikTime += 1
~ piknikGdzie = false
Twoją wprost fantastyczną dziewczyną? Z którą, przypominam z własnej woli, wybrałaś się na piknik w piękny, słoneczny dzień? #Beatrycze
**No tak... #Ty
->choice1

==parkTalk
<i>Chcesz coś powiedzieć, ale Twoja dziewczyna wchodzi Ci w słowo.</i>
Ja... wiem, że pewnie masz mi dużo do powiedzenia... pewnie jeszcze więcej pytań, ha... #Beatrycze
<i>Twoja towarzyszka spogląda za siebie, po czym jej wzrok znowu pada na Ciebie.</i>
Ale nie wiem czy starczy nam czasu. #Beatrycze
->choice1
=choice1
*[Jej twarz.]
<i>Uśmiech nie dosięga jej oczu.</i>
->choice1
*[Jedzenie.]
<i>Twoje oczy z kolei zwracają się ku jedzeniu rozłożonemu na piknikowym kocu{siku:.|, a także bujnemu krzakowi, który zdaje się oferować adekwatną... <b>prywatność</b>.}
#go_church
->DONE

== parkJedzenie
~showObjects("Park")
-> DONE
=krzak
{siku:->krzak0|{marriage > 0:->krzak1|->krzak2}}
=krzak0
<i>Bujny krzak. Nie jesteś nim zainteresowana.
->DONE
=krzak1
<i>Twoja dziewczyna nie odrywa od Ciebie wzroku. To nie jest dobry moment.
->DONE
=krzak2
<i>Ciśnienie Twojego pęcherza staje się nie do wytrzymania. Znajdując jakąś (kiepską) wymówkę uciekasz w krzaki. Po kilku minutach wracasz na piknik z nowo nabytą motywacją i lżejsza o kilkaset mililitrów.</i>
~ time += 1
~ siku = true
->DONE
=tort
<i>Tort weselny. Czy... czy naprawdę jesteście gotowe na takie zobowiązanie?
{tortSeen: ->DONE|}
~tortSeen = true
~ marriage += 1
->wesele

=placki
<i>Placki z jabłkami. Twoja mama zawsze takie robiła.
{plackiSeen: ->DONE|}
~plackiSeen = true
~ marriage += 1
->wesele

=wino
<i>Może powinnyście były częściej wychodzić ze znajomymi... Nie żeby alkohol kiedykolwiek pomagał waszej relacji.
{winoSeen: ->DONE|}
~winoSeen = true
~ marriage += 1
->wesele

=wesele
{marriage < 2: ->wesele1}
{marriage == 2: ->wesele2}
{marriage == 3: ->wesele3}

=wesele1
*Jak to "nie starczy nam czasu"? Przecież jest jeszcze wcześnie, czasu nam nie brakuje! #Ty
Wyglądasz dzisiaj tak pięknie... #Beatrycze
//#go_church
->DONE
*Mówisz jakbyśmy miały się więcej nie zobaczyć... #Ty
Wyglądasz dzisiaj tak pięknie... #Beatrycze
->DONE

=wesele2
*Czy ty w ogóle mnie słuchasz? #Ty
Prawie tak jak w dniu naszego ślubu... #Beatrycze
->DONE
*[<i>Nic nie mów.</i>]
Prawie tak jak w dniu naszego ślubu... #Beatrycze
->DONE

=wesele3
*[Naszego ślubu?] #Ty
Naszego ślu- #Ty
<i>Przeraźliwie głośne bicie dzwonów przerywa Twoją myśl. Świat wydaje się stopniowo oddalać. Im bardziej wychylasz się, żeby złapać <i>jej</i> dłoń, tym dłuższy dystans Was rozdziela.</i>
**[<i>Wystaw dłoń dalej.]
~ time += 1
<i>Pomimo Twoich usilnych starań ona znika. Dokładnie tak jak wtedy. Wspomnienie jest rozmazane, nie pamiętasz czy też wystawiałaś swoją dłoń, czy pozwoliłaś jej odejść. </i>
->DONE
**[<i>Pozwól jej odejść.]
~ time -= 1
<i>I tak po prostu, w pewnym momencie, ona znika. Dokładnie tak jak wtedy. Wspomnienie jest rozmazane, nie pamiętasz czy wtedy też czy pozwoliłaś jej odejść, czy wystawiłaś swoją dłoń, trwając w naiwnym przekonaniu, że ją weźmie. </i>
~hideObjects("Park") 
#go_church
->DONE

//dalej na stype