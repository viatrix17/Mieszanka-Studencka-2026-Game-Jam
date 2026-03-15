//Dom. czy protag. znalazła papier, raczej będzie bez znaczenia 
VAR papierSeen = false

VAR poradnikSeen = false
VAR jablkoSeen = false
VAR allCheckedDom = false

VAR tortSeen = false
VAR plackiSeen = false
VAR winoSeen = false

VAR bibliaSeen = false
VAR kwiatySeen = false
VAR papierSeen2 = false
VAR allCheckedK = false

== function allChecked
{ 
- bibliaSeen && kwiatySeen && papierSeen2:
    ~ allCheckedK = true
- papierSeen && poradnikSeen && jablkoSeen:
    ~ allCheckedDom = true
}

//czy bylo sikane duh
VAR siku = false

//Park. Czy padło pytanie Gdzie/Kim na randeczce
VAR piknikGdzie = true

//Park. po kilku pytaniach nasza kobieta nam przerywa
VAR piknikTime = 0

//Dom. Czy padło pierwsze "Kim jesteś?"
VAR kimJestes = false

//dopasowywanie dialogu do przedmiotu wg. tego jak chronologicznie były wybrane
VAR marriage = 0

//LICZNIK MINUT (67)
VAR time = 7

//w koncowce ile zapętleń było z dodawaniem czasu
VAR loops = 0

//czy w domu było się już w kiblu
VAR kibelFound = false

=== function addTime
{
- time >= 1000:
    ~ time += 200
- time >= 100:
    ~ time += 50
- time >= 50:
    ~ time += 10
- time >=10:
    ~ time += 5
- else:
    ~ time += 1
}

// ~ showObjects("x") tutaj wynotuję jak nazywam te obiekty

// beatrycze -> Beatrycze

// czarna dziura -> czarnaDziura
// przed domem -> domZewnątrz
// w toalecie -> kibel
// w korytarzu -> domKorytarz
// na pikniku -> park
// na stypie -> kosciol
// koniec z beatrycze -> czarnaDziuraB
// koniec bez beatrycze -> czarnaDziura



