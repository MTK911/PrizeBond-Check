CLS

$AMT = 100,200,1500 #Prize Bond Amount
$userAgent = [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome
$PBN100 = "123456,123457" #Rupee 100 PrizeBond List
$PBN200 = "123456" #Rupee 200 PrizeBond List
$PBN1500 = "123456,123457" #Rupee 1500 PrizeBond List
foreach ($nom in $AMT) {
$lojon = '$PBN'+$nom #Variable maker
$URI ="http://prizebond.result.pk/pb-ajax.php"
$HTML= Invoke-WebRequest -uri $URI -ContentType "application/x-www-form-urlencoded; charset=UTF-8" -UserAgent $userAgent -Method POST -Body "number1=$(iex $lojon)&number2=$(iex $lojon)&pb_draw_detail=all&draw_name=$($nom)" #Request maker
@($HTML.ParsedHtml.getElementsByTagName("table"))[0].innerText | Tee-Object -FilePath $env:USERPROFILE\Desktop\Restults_$nom.txt #Output genrator
}